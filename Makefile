
VERSION_ROSSGRAMBO := 1.0.15
VERSION_SWAGGER_CODEGEN := v3.0.15

CMD_GIT_CLONE := git clone
CMD_SWAGGER_CLI := build-swagger_codegen/modules/swagger-codegen-cli/target/swagger-codegen-cli.jar

DIR_SWAGGER_CODEGEN := build-swagger_codegen/

FILE_CODEZ_API_OAS := $(realpath $(OPENAPI_DIR)/dist/public_asana_oas.yaml)
FILE_CODEZ_APP_COMPONENTS_OAS := $(realpath $(OPENAPI_DIR)/app_components_oas.yaml)
FILE_SOURCE_UI_HOOKS_REFERENCE := source/includes/ui-hooks-reference/_index.html.md
FILE_SOURCE_API_REFERENCE := source/includes/api-reference/_index.html.md
FILE_SOURCE_CHANGELOG := source/includes/markdown/_12_1-news-and-changelog.html.md

ALL_CLIENT_LANGS := ruby java node php python
ALL_CLIENT_LIBS := $(addsuffix /,$(addprefix build-client_libs/,$(ALL_CLIENT_LANGS)))
ALL_CLIENT_SWAGGER_CONFIGS := $(addprefix build-client_libs/,$(ALL_CLIENT_LIBS))
ALL_RAW_OAS_YAML := $(FILE_CODEZ_API_OAS) $(FILE_CODEZ_APP_COMPONENTS_OAS)
ALL_OAS_YAML := defs/asana_oas.yaml defs/app_components_oas.yaml
ALL_SAMPLES := $(subst client_libs,client_libs_with_samples,$(ALL_CLIENT_LIBS)) build-api_explorer/src/resources/gen/

.PHONY: clean clean_client_libs all;

clean: clean_client_libs
	-rm -rf build* vendor node_modules

clean_client_libs:
	-rm -rf build-client_libs*

all: \
  $(FILE_SOURCE_API_REFERENCE) \
  $(FILE_SOURCE_UI_HOOKS_REFERENCE) \
  $(FILE_SOURCE_CHANGELOG) \
  vendor \
  node_modules \
  ;

.DEFAULT_GOAL := all

.bundle/config:
	asdf exec bundle config set --local path 'vendor/bundle'

vendor/: $(wildcard Gemfile*) .bundle/config ./bin/configure
	asdf exec bundle install

node_modules/: $(wildcard package*.json)
	asdf exec npm install

$(DIR_SWAGGER_CODEGEN):
	rm -rf '$@'
	$(CMD_GIT_CLONE) git@github.com:swagger-api/swagger-codegen.git '$@'
	git -C '$@' fetch --all --tags
	git -C '$@' checkout 'tags/$(VERSION_SWAGGER_CODEGEN)'
	mvn -f '$@/pom.xml' clean package

build-swagger_codegen_generators/: $(DIR_SWAGGER_CODEGEN)
	rm -rf '$@'
	$(CMD_GIT_CLONE) git@github.com:Asana/swagger-codegen-generators.git '$@'
	git -C '$@' fetch origin 'rossgrambo-$(VERSION_ROSSGRAMBO)-asana-configs'
	git -C '$@' checkout 'rossgrambo-$(VERSION_ROSSGRAMBO)-asana-configs'
	mvn -f '$@/pom.xml' clean package
	mvn -f '$@/pom.xml' \
		install:install-file \
		'-Dfile=target/swagger-codegen-generators-$(VERSION_ROSSGRAMBO).jar' \
		-DpomFile=pom.xml

build-widdershins/:
	rm -rf '$@'
	# $(CMD_GIT_CLONE) git@github.com:Mermade/widdershins.git '$@'
	$(CMD_GIT_CLONE) git@github.com:Asana/widdershins.git '$@'
	cd '$@' && asdf exec npm install

build-client_libs/:
	mkdir build-client_libs

$(ALL_CLIENT_LIBS): | build-client_libs/
	rm -rf 'build-client_libs/$(notdir $@)'
	$(CMD_GIT_CLONE) 'git@github.com:Asana/$(notdir $@)-asana.git' 'build-client_libs/$(notdir $@)'

build-client_libs_with_samples/:
	mkdir build-client_libs_with_samples

build-client_libs_with_samples/%/: build-client_libs/%/ build-swagger_codegen_generators/ | build-client_libs_with_samples/
	rm -rf '$@'
	cp -r '$<' '$@'
	cd '$@' && \
		java -jar '$(realpath $(CMD_SWAGGER_CLI))' \
		generate \
		--input-spec '$(realpath defs/asana_oas.yaml)' \
		--template-dir 'swagger_templates' \
		--lang 'asana-$(shell basename '$@')' \
		--config 'swagger_templates/$(shell basename '$@')-config.json' \
		-Dapis

build-api_explorer/: | build-client_libs/
	$(CMD_GIT_CLONE) git@github.com:Asana/api-explorer.git '$@'

build-api_explorer/src/resources/gen: build-swagger_codegen_generators/ build-api_explorer/
	# swagger's cli does not actually seem to respect the `--output` flag and so
	# we have to cd into the client lib dir and do work there
	cd 'build-api_explorer' && \
		java -jar '$(realpath $(CMD_SWAGGER_CLI))' \
		generate \
		--input-spec '$(realpath defs/asana_oas.yaml)' \
		--lang asana-api-explorer \
		--config swagger_templates/api-explorer-config.json \
		-Dapis

ALL_SERVE_DEPENDENCIES := \
													Makefile \
													node_modules \
													build-widdershins \
													replace_code_samples.js \
													$(wildcard source/templates/*) \
													$(ALL_SAMPLES)

$(FILE_SOURCE_UI_HOOKS_REFERENCE): defs/app_components_oas.yaml pui_widdershins_config.json $(ALL_SERVE_DEPENDENCIES)
	node build-widdershins/widdershins.js \
		-e pui_widdershins_config.json \
		--summary defs/app_components_oas.yaml \
		-o '$@'

$(FILE_SOURCE_API_REFERENCE): defs/asana_oas.yaml widdershins_config.json $(ALL_SERVE_DEPENDENCIES)
	node build-widdershins/widdershins.js \
		-e widdershins_config.json \
		--summary defs/asana_oas.yaml \
		-o '$@'
	node replace_code_samples.js '$@'

$(FILE_SOURCE_CHANGELOG): pull_forum_updates.js
	node pull_forum_updates.js

$(ALL_RAW_OAS_YAML): $(OPENAPI_DIR)/build.py
	cd '$(OPENAPI_DIR)' && \
		bash -l -c 'python build.py'

defs/asana_oas.yaml: $(FILE_CODEZ_API_OAS)
	cp '$<' '$@'

defs/app_components_oas.yaml: $(FILE_CODEZ_APP_COMPONENTS_OAS)
	cp '$<' '$@'

define library_pr
	cd ../client_libraries/$(1)-asana && git checkout master && git branch -D openapi-sync; git push origin --delete openapi-sync; git checkout -b openapi-sync && cd ../../developer-docs && $(MAKE) $(1)_gen && $(MAKE) $(1)_version_bump && cd ../client_libraries/$(1)-asana && git add . && git commit -m "Generated from OpenAPI"; git push --set-upstream origin openapi-sync && open https://github.com/Asana/$(1)-asana/compare/openapi-sync
endef

api_explorer_pr:
	cd ../client_libraries/api-explorer && git checkout master && git branch -D openapi-sync; git push origin --delete openapi-sync; git checkout -b openapi-sync && cd ../../developer-docs && $(MAKE) api_explorer_gen && cd ../client_libraries/api-explorer && git add . && git commit -m "Generated from OpenAPI"; git push --set-upstream origin openapi-sync && open https://github.com/Asana/api-explorer/compare/openapi-sync


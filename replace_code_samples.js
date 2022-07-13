const fs = require("fs");
const path = require("path");
const YAML = require("yaml");

const markdownFiles = [
  // "./source/includes/api-reference/_index.html.md",
  "./source/includes/ui-hooks-reference/_index.html.md",
];

const clientLibraryInfo = [
  {
    lang: "ruby",
    docs: "build-client_libs_with_samples/ruby/samples",
  },
  {
    lang: "javascript--nodejs",
    docs: "build-client_libs_with_samples/node/samples",
  },
  {
    lang: "javascript",
    docs: "build-client_libs_with_samples/node/samples",
  },
  {
    lang: "php",
    docs: "build-client_libs_with_samples/php/samples",
  },
  {
    lang: "java",
    docs: "build-client_libs_with_samples/java/samples",
  },
  {
    lang: "python",
    docs: "build-client_libs_with_samples/python/samples",
  },
];

function updateTemplateSectionsInFile(docsFilename) {
  console.log(`Reading ${docsFilename}`);
  fs.readFile(docsFilename, "utf8", function (err, docsData) {
    if (err) {
      return console.log(err);
    }

    console.log(`Read ${docsFilename}`);

    let promises = [];

    for (let i = 0; i < clientLibraryInfo.length; i++) {
      let info = clientLibraryInfo[i];

      promises.push(
        new Promise((resolve, reject) => {
          let p = path.resolve(__dirname, info.docs);

          fs.readdir(path.resolve(__dirname, info.docs), function (err, files) {
            if (err) {
              return console.log("Unable to scan directory: " + err);
            }

            replaceWithSamples(p, files, info.lang, resolve);
          });
        })
      );
    }

    Promise.all(promises).then((values) => {
      fs.writeFile(docsFilename, docsData, function (err) {
        if (err) return console.log(err);
        console.log(
          "Updated Code Samples from local versions of Client Libraries."
        );
      });
    });

    function replaceWithSamples(path, files, lang, callback) {
      let promises = [];

      let sampleHolder = {};
      files.forEach(function (filename) {
        promises.push(
          new Promise((resolve, reject) => {
            let p = `${path}/${filename}`;

            fs.readFile(p, "utf8", function (err, data) {
              sampleHolder = Object.assign(sampleHolder, YAML.parse(data));
              resolve();
            });
          })
        );
      });

      Promise.all(promises).then((values) => {
        for (let tag in sampleHolder) {
          if (sampleHolder.hasOwnProperty(tag)) {
            for (let operationId in sampleHolder[tag]) {
              if (sampleHolder[tag].hasOwnProperty(operationId)) {
                replace(sampleHolder, tag, operationId, lang);
              }
            }
          }
        }
        console.log("Completed replacements");
        callback();
      });
    }

    function replace(sampleHolder, tag, operationId, lang) {
      const regex = new RegExp(
        `\`\`\`${lang}\n!START SAMPLE!${toCamel(operationId)}!END SAMPLE!\n`,
        "g"
      );

      let replacementText = `\`\`\`${lang}\n${sampleHolder[tag][operationId]}`;

      docsData = docsData.replace(regex, replacementText);
    }

    function toCamel(s) {
      return s.replace(/([-_][a-z])/gi, ($1) => {
        return $1.toUpperCase().replace("-", "").replace("_", "");
      });
    }
  });
}

process.argv.slice(2).forEach(updateTemplateSectionsInFile);

<p align="center">
  <img src="https://assets.asana.biz/m/33a0924d61aabd7b/original/Asana-developers-lockup-horizontal.svg" alt="Asana: API Documentation" width="264">
  <br>
  <br>
  <br>
  <a href="https://github.com/slatedocs/slate/actions?query=workflow%3ABuild+branch%3Amain"><img src="https://github.com/slatedocs/slate/workflows/Build/badge.svg?branch=main" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/slatedocs/slate"><img src="https://img.shields.io/docker/v/slatedocs/slate?sort=semver" alt="Docker Version" /></a>
</p>

> **_NOTE:_**  This repository has been archived and is no longer being maintained. Asana's API documentation is available at [https://developers.asana.com/docs](https://developers.asana.com/docs). To access up-to-date versions of Asana's OpenAPI Specifications, visit the [openapi](https://github.com/asana/openapi) repository.

# OpenAPI Spec

The Asana OpenAPI spec is currently used to generate our documentation. You can
also use it to generate mock servers, client code, and many other things. You
can read more about OpenAPI specs
[here](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md).

~The up-to-date Asana OpenAPI spec is in this repository. Here's a
[link](https://github.com/Asana/developer-docs/blob/master/defs/asana_oas.yaml).~ See [openapi](https://github.com/asana/openapi) for up-to-date OpenAPI Specifications.

If you find any issues or have any suggestions for our OpenAPI spec. Please
create an issue in this repo or create a PR with the changes!

# Development

*Commands should be run from the root of this repository.*

## Requirements

You must be running macOS, and have [homebrew](https://brew.sh/) available.

You can install all dependencies for building locally by running the following:

``` shell
./bin/configure
```

This will install the following:

-   [asdf: a version manager used for other dependencies](https://asdf-vm.com/)
    note: it will *not* be added to your `$PATH`, but used by the scripts in
    this repo
    -   asdf will install (defined:in [`.tool-versions`](.tool-versions))
        -   node
        -   python
        -   ruby
-   [maven: java package manager for swagger](https://maven.apache.org/)
    -   [swagger](https://github.com/swagger-api/swagger-codegen)

## Local Development

To build once:

``` shell
make
```

To reset the working directory:

``` shell
make clean
```

To build continouously upon changes and launch the local web server:

``` shell
./bin/watch_and_serve_local_dev
```

Documentation will be accessible here (also included in the build output):

-   <http://localhost:4567/>

## Making Changes to Changes

*Internal Asanas: See <https://app.asana.com/0/77076599077/1122503737028047/f>
and <https://app.asana.com/0/0/1200652548580470/f> before making any updates.*

If the content you're changing is static (not generated from the OpenAPI spec):

-   edit the `.md` files in
    [`source/includes/markdown`](source/includes/markdown)
    -   if you're adding a markdown file, you'll also need to add it to
        [`source/docs/index.html.md`](source/docs/index.html.md)

If the content you're changing is in the OpenAPI spec:

1.  modify the OAS in `CODEZ`
    -   to quickly test something, make the changes in
        [`def/asana_oas.yaml`](defs/asana_oas.yaml). Just remember to put the
        changes in `CODEZ` if you want them to not be overridden on the next
        build.
2.  run `make`.
3.  verify your changes with `git diff`. Run
4.  run [`./bin/watch_and_serve_local_dev`](bin/watch_and_serve_local_dev)
5.  confirm the changes in the local dev environment by going to the url in the
    `bin/watch_and_serve_local_dev` output

Merging these changes into master causes them to be deployed.

## Making Changes to Styles

Make changes in source/stylesheets/*\_variables.scss* because the changes here
will be valid with future versions of Slate.

If you need to make more complex css changes, edit **screen.css.scss** or
**print.css.scss** but keep in mind that these will need to be merged for new
versions of Slate.

## Deployment (GitHub Pages)

This should happen automatically when changes are merged into this repo.

<!--
TODO: determine if this manual deploy process still works
      https://app.asana.com/0/1202273674392568/1202795807224614
-->

If you need to do this manually, then run the `deploy.sh` script. This will use
your local git credentials and local `/build` folder to push a build to a branch
named gh-pages (Where the docs are hosted).

## Architecture

The public OpenAPI spec is located at
[`defs/asana_oas.yaml`](defs/asana_oas.yaml)

To generate markdown from the spec, we use a forked
[widdershins](https://github.com/rossgrambo/widdershins).

# FAQ

*Why did we fork widdershins?* For our use case, we needed things like
denormalizing and dereferencing. We tried doing this to the spec & using an
unforked widdershins, but as we progressed with client library generation, it
made more sense to keep a clean spec and do this doc-specific editing in the
tooling. A potential future is pulling out this logic to a "openapi spec
transformer" to prep the spec for widdershins, but there will be a trade-offs to
consider.

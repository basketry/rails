[![main](https://github.com/basketry/rails/workflows/build/badge.svg?branch=main&event=push)](https://github.com/basketry/rails/actions?query=workflow%3Abuild+branch%3Amain+event%3Apush)
[![master](https://img.shields.io/npm/v/@basketry/rails)](https://www.npmjs.com/package/@basketry/rails)

# Rails

[Basketry generator](https://github.com/basketry) for generating Rails routes and controllers. This generator can be coupled with any Basketry pipeline. It is recommended to use this generator alongside the [`@basketry/sorbet`](https://github.com/basketry/sorbet) generator.

## Quick Start

The following example converts a "Swagger" doc into [Sorbet](https://sorbet.org/) types:

1. Save `https://petstore.swagger.io/v2/swagger.json` as `petstore.json` in the root of your project.
1. Install packages: `npm install -g basketry @basketry/swagger-2 @basketry/sorbet @basketry/rails`
1. Generate code: `basketry --source petstore.json --parser @basketry/swagger-2 --generators @basketry/sorbet @basketry/rails --output src`

When the last step is run, basketry will parse the source file (`petstore.json`) using the specified parser (`@basketry/swagger-2`) and then run each specified generator writing the output folder (`src`).

## Folder Structure

The generator writes a routes file within `config/routes/` and routers within `app/controllers/`.

Example config without options:

```json
{
  "source": "petstore.json",
  "parser": "@basketry/swagger-2",
  "generators": ["@basketry/sorbet", "@basketry/rails"],
  "output": ""
}
```

Resulting output (including files from [`@basketry/sorbet`](https://github.com/basketry/sorbet)):

```
my_project/
├─ app/
│  ├─ controllers/
│  │  ├─ petstore/
│  │  │  ├─ v1/
│  │  │  │  ├─ controller_helpers.rb
│  │  │  │  ├─ pets_controller.rb
│  │  │  │  ├─ stores_controller.rb
│  │  │  │  ├─ users_controller.rb
├─ config/
│  ├─ routes/
│  │  ├─ petstore_v1.rb
├─ .gitattributes
├─ basketry.config.json
├─ petstore.json
```

## Options

All Rails generator options are namespaced within a `sorbet` property. This generator's options include all options accepted by `@basketry/sorbet`. For this reason, it is recommended that all `sorbet` options be defined as common options to ensure that code generated by all sorbet-related generators use the same module and folder structure conventions.

Example config:

```json
{
  "source": "petstore.json",
  "parser": "@basketry/swagger-2",
  "generators": ["@basketry/sorbet", "@basketry/sorbet-validators"],
  "output": "",
  "options": {
    "sorbet": {
      "baseController": "Petstore::MyBaseController"
    }
  }
}
```

### `baseController`

This setting lets you specify the base controller inherited by the generated controllers. If not specified, the default is `ActionController::Base`.

Example usage:

```json
{
  "options": {
    "sorbet": {
      "baseController": "Petstore::MyBaseController"
    }
  }
}
```

## Snapshots

An example of generated Rails code can be found as a test snapshot at [`/src/snapshot/`](./src/snapshot/).

---

## For contributors:

### Run this project

1.  Install packages: `npm ci`
1.  Build the code: `npm run build`
1.  Run it! `npm start`

Note that the `lint` script is run prior to `build`. Auto-fixable linting or formatting errors may be fixed by running `npm run fix`.

### Create and run tests

1.  Add tests by creating files with the `.test.ts` suffix
1.  Run the tests: `npm t`
1.  Test coverage can be viewed at `/coverage/lcov-report/index.html`

### Publish a new package version

1. Ensure latest code is published on the `main` branch.
1. Create the new version number with `npm version {major|minor|patch}`
1. Push the branch and the version tag: `git push origin main --follow-tags`

The [publish workflow](https://github.com/basketry/sorbet-validators/actions/workflows/publish.yml) will build and pack the new version then push the package to NPM. Note that publishing requires write access to the `main` branch.

---

Generated with [generator-ts-console](https://www.npmjs.com/package/generator-ts-console)

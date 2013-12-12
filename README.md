### Yeoman Generator for Grunt-based CoffeeScript Yeoman Generators

[![Build Status](https://travis-ci.org/logankoester/generator-generator_grunt_coffee.png)](https://travis-ci.org/logankoester/generator-generator_grunt_coffee)
[![Dependency Status](https://david-dm.org/logankoester/generator-generator_grunt_coffee.png)](https://david-dm.org/logankoester/generator-generator_grunt_coffee)
[![devDependency Status](https://david-dm.org/logankoester/generator-generator_grunt_coffee/dev-status.png)](https://david-dm.org/logankoester/generator-generator_grunt_coffee#info=devDependencies)
[![Gittip](http://img.shields.io/gittip/logankoester.png)](https://www.gittip.com/logankoester/)

[![NPM](https://nodei.co/npm/generator-generator_grunt_coffee.png?downloads=true)](https://nodei.co/npm/generator-generator_grunt_coffee/)

`generator-generator_grunt_coffee` is a tool for generating
[Yeoman generators](http://yeoman.io/generators.html) that use a
[Grunt](http://gruntjs.com/)-based development workflow and the
[CoffeeScript](http://coffeescript.org/) programming language.

Many thanks to [https://github.com/tuxracer/generator-generatorcs](generator-generatorcs) for inspiring this fork.

## Key differences from [generator-generator](https://npmjs.org/package/generator-generator)

* Adds a `Gruntfile.coffee` for your generator including configuration for...
  * grunt-contrib-clean
  * grunt-contrib-coffee
  * grunt-contrib-copy
  * grunt-contrib-watch
  * grunt-mocha-cli
* Moves the `app/` and `test/` directories into `src/`, which contain `.coffee` files that
will be compiled to their original locations by the `grunt build` task.
* Removes `jshint`, as presumably you are writing your generator in CoffeeScript and not JS.
* Is itself written in CoffeeScript.
* Removes LICENSE file from output. Use another package for this such as [mit](https://npmjs.org/package/mit).


## Commands

* `yo generator_grunt_coffee` shows a wizard for generating a new generator
* `yo generator_grunt_coffee:subgenerator NAME` generates a subgenerator with the name NAME

## What do you get?

`generator_grunt_coffee` scaffolds out a complete project directory structure for
you.

    .
    ├── Gruntfile.coffee
    ├── LICENSE
    ├── node_modules
    ├── package.json
    ├── README.md
    └── src
      ├── app
      │   ├── index.coffee
      │   └── templates
      │       ├── _bower.json
      │       ├── editorconfig
      │       ├── _package.json
      │       └── travis.yml
      └── test
      ├── test-creation.coffee
      └── test-load.coffee

## Getting started
- Install: `npm install -g generator-generator_grunt_coffee`
- Run: `yo generator_grunt_coffee`

## License
[MIT License](http://en.wikipedia.org/wiki/MIT_License)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/logankoester/generator-generator_grunt_coffee/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


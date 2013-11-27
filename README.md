This library adds CommonJS support to [Sprockets](https://github.com/sstephenson/sprockets).

## About

This project is a fork of the original [sprockets-commonjs](https://github.com/maccman/sprockets-commonjs). 

Due to the lack of maintainance of the original project, I decided to create a new one based on it, make some changes and publish it as a new gem.

## What is CommonJS?

The CommonJS module format is a way of encapsulating JavaScript libraries, ensuring they have to explicitly require and export properties they use. In a nutshell:

1. You require in files using `require()`:

    var Asset = require('models/asset');

2. You export properties using `module.exports`:

    var Asset = function(){ /* ... */ };
    module.exports = Asset;

## This library

This library adds CommonJS support to Sprockets, so it can wrap up JavaScript files as modules, and serve them appropriately. This is done by storing any JS files you want in a folder called `modules`

Sprockets will then wrap up the JS library when it's requested, with the following:

    require.define({'library/name': function(exports, require, module){ /* Your library */ }});

`require.define()` is defined inside `commonjs.js`, which you'll need to include in the page before any modules are loaded.

One caveat to the approach this library takes, is that dependencies loaded through `require()` will not be added to the dependency graph. This library will not parse the AST tree for require calls. This decision has been made for a variety of reasons, but it does mean you need to require files through both CommonJS and Sprockets.

## Usage

1. Add `gem 'sprockets-cjs'` to your `Gemfile`
1. Add your javascript files inside a  `modules` folder
1. Require all the modules, e.g.: `//= require_tree ./modules`
1. Or, require individual modules, e.g.: `//= require ./modules/users`

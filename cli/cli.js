#!/usr/bin/env node
(function() {
  var CLI, program, serviceGen, viewDel, viewGen;

  program = require('commander');

  viewGen = require('./tasks/view_generator.js');

  viewDel = require('./tasks/view_deleter.js');

  serviceGen = require('./tasks/service_generator.js');

  CLI = (function() {
    function CLI() {
      program.version('0.0.1');
      program.command('gen-view [name] [route]').description('Generate a new View & Route').action((function(_this) {
        return function(name, route) {
          return new viewGen(name, route);
        };
      })(this));
      program.command('del-view [name] [route]').description('Delete an existing View & Route').action((function(_this) {
        return function(name, route) {
          return new viewDel(name, route);
        };
      })(this));
      program.command('gen-service [type] [name]').description('Generate a new Service').action((function(_this) {
        return function(type, name) {
          return new serviceGen(type, name);
        };
      })(this));
      program.command('*').action(function(env) {
        return console.log(env + ' is not a valid command...');
      });
      program.parse(process.argv);
    }

    return CLI;

  })();

  module.exports = new CLI;

}).call(this);

#!/usr/bin/env node
(function() {
  var CLI, MkView, RmView, program;

  program = require('commander');

  MkView = require('./tasks/mk_view');

  RmView = require('./tasks/rm_view');

  CLI = (function() {
    function CLI() {
      program.version('0.0.1');
      program.command('mk-view [name] [route]').description('Generate a new View & Route').action((function(_this) {
        return function(name, route) {
          return new MkView(name, route);
        };
      })(this));
      program.command('rm-view [name] [route]').description('Delete an existing View & Route').action((function(_this) {
        return function(name, route) {
          return new RmView(name, route);
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

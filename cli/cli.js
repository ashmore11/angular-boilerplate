#!/usr/bin/env node
(function() {
  var CLI, program, serviceGen, viewDel, viewGen;

  program = require('commander');

  viewGen = require('./tasks/view_generator.js');

  viewDel = require('./tasks/view_deleter.js');

  serviceGen = require('./tasks/service_generator.js');

  CLI = (function() {
    CLI.prototype.view = null;

    CLI.prototype.route = null;

    CLI.prototype.paths = {
      templates: 'cli/templates/',
      coffee: 'src/coffee/controllers/views/',
      jade: 'src/jade/views/',
      stylus: 'src/stylus/views/',
      routes: 'src/coffee/routes/routes.coffee',
      html: 'public/templates/views/'
    };

    function CLI() {
      program.version('0.1.1');
      program.command('gen-view [view] [route]').description('Generate a new View & Route').action((function(_this) {
        return function(view, route) {
          return new viewGen(view, route);
        };
      })(this));
      program.command('del-view [view] [route]').description('Delete an existing View & Route').action((function(_this) {
        return function(view, route) {
          return new viewDel(view, route);
        };
      })(this));
      program.command('gen-service [name]').description('Generate a new Service').action((function(_this) {
        return function(name) {
          return new serviceGen(name);
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

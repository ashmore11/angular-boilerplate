#!/usr/bin/env node
(function() {
  var CLI, fs, program,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  program = require('commander');

  fs = require('fs');

  CLI = (function() {
    CLI.prototype.view = null;

    function CLI() {
      this.generate_data = bind(this.generate_data, this);
      this.commands();
    }

    CLI.prototype.commands = function() {
      program.version('0.1.1');
      program.command('gen [view]').description('Generate a new View & Route').action((function(_this) {
        return function(view) {
          return _this.generate_view(view);
        };
      })(this));
      program.command('del [view]').description('Delete an existing View & Route').action((function(_this) {
        return function(view) {
          return _this.delete_view(view);
        };
      })(this));
      program.command('*').action(function(env) {
        return console.log(env + ' is not a valid command...');
      });
      return program.parse(process.argv);
    };


    /*
    	GENERATE VIEW
     */

    CLI.prototype.generate_view = function(view) {
      if (!view) {
        return console.log('Please give your view a name: app gen [view_name]');
      }
      this.view = view.toLowerCase();
      fs.open('src/coffee/controllers/' + this.view + '.coffee', 'w');
      fs.open('src/stylus/views/' + this.view + '.styl', 'w');
      fs.open('src/jade/views' + this.view + '.jade', 'w');
      fs.readFile('cli/mvc/controller.coffee', (function(_this) {
        return function(err, data) {
          return fs.writeFile("src/coffee/controllers/" + _this.view + ".coffee", _this.generate_data(data));
        };
      })(this));
      fs.writeFile("src/jade/views/" + this.view + ".jade", this.jade_data());
      fs.writeFile("src/stylus/views/" + this.view + ".styl", this.stylus_data());
      fs.readFile('src/coffee/routes/routes.coffee', (function(_this) {
        return function(err, data) {
          return fs.appendFile('src/coffee/routes/routes.coffee', _this.route_data());
        };
      })(this));
      return console.log('Generated ' + view + ' view');
    };

    CLI.prototype.generate_data = function(data) {
      return data.toString().replace(/<view>/g, this.capitalize());
    };

    CLI.prototype.capitalize = function() {
      return this.view.charAt(0).toUpperCase() + this.view.slice(1);
    };


    /*
    	DELETE VIEW
     */

    CLI.prototype.delete_view = function(view) {
      if (!view) {
        return console.log('Please pass the name of the view you wish to delete: app del [view_name]');
      }
      this.view = view.toLowerCase();
      fs.unlink('src/coffee/controllers/' + this.view + '.coffee');
      fs.unlink('src/stylus/views/' + this.view + '.styl');
      fs.unlink('src/jade/views' + this.view + '.jade');
      fs.readFile('src/coffee/routes/routes.coffee', (function(_this) {
        return function(err, data) {
          data = data.toString().replace(_this.route_data(), '');
          return fs.writeFile('src/coffee/routes/routes.coffee', data);
        };
      })(this));
      return console.log('Deleted ' + this.view + ' view');
    };


    /*
    	TEMPLATES
     */

    CLI.prototype.route_data = function() {
      var data;
      data = "\r\n \r\n			.when '/" + this.view + "', \r\n				templateUrl : 'templates/views/" + this.view + ".html' \r\n				controller  : '" + this.view + "Controller'";
      return data;
    };

    CLI.prototype.jade_data = function() {
      var data;
      data = "#" + this.view + ".page";
      return data;
    };

    CLI.prototype.stylus_data = function() {
      var data;
      data = "#" + this.view + " \r\n	//";
      return data;
    };

    return CLI;

  })();

  module.exports = new CLI;

}).call(this);

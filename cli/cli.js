#!/usr/bin/env node
(function() {
  var CLI, fs, program,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  program = require('commander');

  fs = require('fs');

  CLI = (function() {
    CLI.prototype.view = null;

    CLI.prototype.route = null;

    function CLI() {
      this.generateData = bind(this.generateData, this);
      this.commands();
    }

    CLI.prototype.commands = function() {
      program.version('0.1.1');
      program.command('gen [view] [route]').description('Generate a new View & Route').action((function(_this) {
        return function(view, route) {
          return _this.generateView(view, route);
        };
      })(this));
      program.command('del [view] [route]').description('Delete an existing View & Route').action((function(_this) {
        return function(view, route) {
          return _this.deleteView(view, route);
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

    CLI.prototype.generateView = function(view, route) {
      if (!view) {
        return console.log('Please give your view a name: app gen [view_name]');
      }
      this.view = view.toLowerCase();
      this.route = route.toLowerCase();
      fs.open('src/coffee/controllers/' + this.view + '.coffee', 'w');
      fs.open('src/stylus/views/' + this.view + '.styl', 'w');
      fs.open('src/jade/views/' + this.view + '.jade', 'w');
      fs.readFile('cli/mvc/controller.coffee', (function(_this) {
        return function(err, data) {
          return fs.writeFile("src/coffee/controllers/views/" + _this.view + ".coffee", _this.generateData(data));
        };
      })(this));
      fs.writeFile("src/jade/views/" + this.view + ".jade", this.jadeData());
      fs.writeFile("src/stylus/views/" + this.view + ".styl", this.stylusData());
      fs.readFile('src/coffee/routes/routes.coffee', (function(_this) {
        return function(err, data) {
          data = data.toString().replace(_this.route404(), '');
          fs.writeFile('src/coffee/routes/routes.coffee', data);
          fs.appendFile('src/coffee/routes/routes.coffee', _this.routeData());
          return fs.appendFile('src/coffee/routes/routes.coffee', _this.route404());
        };
      })(this));
      return console.log('Generated ' + view + ' view');
    };

    CLI.prototype.generateData = function(data) {
      return data.toString().replace(/<view>/g, this.capitalize());
    };

    CLI.prototype.capitalize = function() {
      return this.view.charAt(0).toUpperCase() + this.view.slice(1);
    };


    /*
    	DELETE VIEW
     */

    CLI.prototype.deleteView = function(view, route) {
      if (!view) {
        return console.log('Please pass the name of the view you wish to delete: app del [view_name]');
      }
      this.view = view.toLowerCase();
      this.route = route.toLowerCase();
      fs.unlink('src/coffee/controllers/views/' + this.view + '.coffee');
      fs.unlink('src/stylus/views/' + this.view + '.styl');
      fs.unlink('src/jade/views/' + this.view + '.jade');
      fs.unlink('public/templates/views/' + this.view + '.html');
      fs.readFile('src/coffee/routes/routes.coffee', (function(_this) {
        return function(err, data) {
          data = data.toString().replace(_this.routeData(), '');
          return fs.writeFile('src/coffee/routes/routes.coffee', data);
        };
      })(this));
      return console.log('Deleted ' + this.view + ' view');
    };


    /*
    	TEMPLATES
     */

    CLI.prototype.routeData = function() {
      var data;
      data = "\r\n \r\n			.when '/" + this.route + "', \r\n				templateUrl : 'templates/views/" + this.view + ".html' \r\n				controller  : '" + this.view + "Controller'";
      return data;
    };

    CLI.prototype.route404 = function() {
      var data;
      data = "\r\n \r\n			.otherwise \r\n				templateUrl : 'templates/views/404.html' \r\n				controller  : 'notFound404Controller'";
      return data;
    };

    CLI.prototype.jadeData = function() {
      var data;
      data = "#" + this.view + ".page \r\n \r\n	h1 " + (this.view.toUpperCase());
      return data;
    };

    CLI.prototype.stylusData = function() {
      var data;
      data = "#" + this.view + " \r\n	//";
      return data;
    };

    return CLI;

  })();

  module.exports = new CLI;

}).call(this);

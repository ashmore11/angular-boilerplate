#!/usr/bin/env node
(function() {
  var CLI, fs, program,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  program = require('commander');

  fs = require('fs');

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
      this.generateData = bind(this.generateData, this);
      program.version('0.1.1');
      program.command('gen-view [view] [route]').description('Generate a new View & Route').action((function(_this) {
        return function(view, route) {
          return _this.generateView(view, route);
        };
      })(this));
      program.command('del-view [view] [route]').description('Delete an existing View & Route').action((function(_this) {
        return function(view, route) {
          return _this.deleteView(view, route);
        };
      })(this));
      program.command('*').action(function(env) {
        return console.log(env + ' is not a valid command...');
      });
      program.parse(process.argv);
    }


    /*
    	GENERATE VIEW
     */

    CLI.prototype.generateView = function(view, route) {
      if (!(view && route)) {
        return console.log('Please give your view a name and route: app gen [view_name] [route_name]');
      }
      this.view = view.toLowerCase();
      this.route = route.toLowerCase();
      fs.open(this.paths.coffee + (this.view + ".coffee"), 'w');
      fs.open(this.paths.stylus + (this.view + ".styl"), 'w');
      fs.open(this.paths.jade + (this.view + ".jade"), 'w');
      fs.readFile(this.paths.templates + 'controller.coffee', (function(_this) {
        return function(err, data) {
          return fs.writeFile(_this.paths.coffee + (_this.view + ".coffee"), _this.generateData(data));
        };
      })(this));
      fs.writeFile(this.paths.jade + (this.view + ".jade"), this.jadeData());
      fs.writeFile(this.paths.stylus + (this.view + ".styl"), this.stylusData());
      fs.readFile(this.paths.routes, (function(_this) {
        return function(err, data) {
          data = data.toString().replace(_this.route404(), '');
          fs.writeFile(_this.paths.routes, data);
          fs.appendFile(_this.paths.routes, _this.routeData());
          return fs.appendFile(_this.paths.routes, _this.route404());
        };
      })(this));
      return console.log("Generated " + this.view + " view");
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
      if (!(view && route)) {
        return console.log('Please pass the name and route of the view you wish to delete: app del [view_name] [route_name]');
      }
      this.view = view.toLowerCase();
      this.route = route.toLowerCase();
      fs.unlink(this.paths.coffee + (this.view + ".coffee"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      fs.unlink(this.paths.stylus + (this.view + ".styl"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      fs.unlink(this.paths.jade + (this.view + ".jade"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      fs.unlink(this.paths.html + (this.view + ".html"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      fs.readFile(this.paths.routes, (function(_this) {
        return function(err, data) {
          data = data.toString().replace(_this.routeData(), '');
          return fs.writeFile(_this.paths.routes, data);
        };
      })(this));
      return console.log("Deleted " + this.view + " view");
    };


    /*
    	ERROR MESSAGE
     */

    CLI.prototype.errorMessage = function(error) {
      return console.log("It looks like " + error.path + " wasn't found...");
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

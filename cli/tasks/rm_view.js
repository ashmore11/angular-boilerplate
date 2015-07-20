// Generated by CoffeeScript 1.9.3
(function() {
  var RmView, fs, utils;

  fs = require('fs');

  utils = require('./utils');

  module.exports = RmView = (function() {
    function RmView(name, route) {
      var message;
      this.name = name;
      this.route = route;
      message = 'Please pass the name and route of the view you wish to delete: app del [view_name] [route_name]';
      if (!(this.name && this.route)) {
        return console.log(message);
      }
      console.log('Deleting view...');
      this.deleteFiles();
      this.deleteRoute();
      console.log("Deleted view: [ " + this.name + " ]");
    }

    RmView.prototype.deleteFiles = function() {
      fs.unlink(utils.paths.controller + (this.name + ".coffee"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      fs.unlink(utils.paths.jade + (this.name + ".jade"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      fs.unlink(utils.paths.stylus + (this.name + ".styl"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
      return fs.unlink(utils.paths.html + (this.name + ".html"), (function(_this) {
        return function(err) {
          if (err) {
            return _this.errorMessage(err);
          }
        };
      })(this));
    };

    RmView.prototype.deleteRoute = function() {
      return fs.readFile(utils.paths.routes, (function(_this) {
        return function(err, data) {
          data = data.toString().replace(utils.routeTemplate(_this.name, _this.route), '');
          return fs.writeFile(utils.paths.routes, data);
        };
      })(this));
    };

    RmView.prototype.errorMessage = function(error) {
      return console.log("It looks like " + error.path + " wasn't found...");
    };

    return RmView;

  })();

}).call(this);
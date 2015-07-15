(function() {
  var App;

  App = (function() {
    function App() {
      angular.element(document).ready((function(_this) {
        return function() {
          return _this.start();
        };
      })(this));
      return ['ngRoute', 'ngAnimate', 'ngSanitize'];
    }

    App.prototype.start = function() {
      return angular.bootstrap(document, ['app']);
    };

    return App;

  })();

  angular.module('app', new App());

}).call(this);

(function() {
  var Header;

  Header = (function() {
    function Header($scope) {
      this.$scope = $scope;
      this.$scope.controller = this;
    }

    return Header;

  })();

  angular.module('app').controller('headerController', ['$scope', Header]);

}).call(this);

(function() {
  var Home;

  Home = (function() {
    function Home($scope) {
      this.$scope = $scope;
      this.$scope.controller = this;
    }

    return Home;

  })();

  angular.module('app').controller('homeController', ['$scope', Home]);

}).call(this);

(function() {
  var Reverse;

  Reverse = (function() {
    function Reverse() {
      return function($items) {
        return $items.slice().reverse();
      };
    }

    return Reverse;

  })();

  angular.module('app').filter('reverse', [Reverse]);

}).call(this);

(function() {
  var Routes;

  Routes = (function() {
    function Routes($locationProvider, $routeProvider) {
      $locationProvider.html5Mode(true);
      $routeProvider.otherwise({
        templateUrl: 'templates/views/home.html',
        controller: 'homeController'
      }).when('/', {
        templateUrl: 'templates/views/home.html',
        controller: 'homeController'
      });
    }

    return Routes;

  })();

  angular.module('app').config(['$locationProvider', '$routeProvider', Routes]);

}).call(this);

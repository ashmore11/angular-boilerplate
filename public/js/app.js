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
  var notFound404;

  notFound404 = (function() {
    function notFound404($scope) {
      this.$scope = $scope;
      this.$scope.controller = this;
    }

    return notFound404;

  })();

  angular.module('app').controller('notFound404Controller', ['$scope', notFound404]);

}).call(this);

(function() {
  var Examplepage;

  Examplepage = (function() {
    function Examplepage($scope) {
      this.$scope = $scope;
      this.$scope.controller = this;
    }

    return Examplepage;

  })();

  angular.module('app').controller('examplepageController', ['$scope', Examplepage]);

}).call(this);

(function() {
  var Footer;

  Footer = (function() {
    function Footer($scope) {
      this.$scope = $scope;
      this.$scope.controller = this;
    }

    return Footer;

  })();

  angular.module('app').controller('footerController', ['$scope', Footer]);

}).call(this);

(function() {
  var Header;

  Header = (function() {
    function Header($scope, $route) {
      this.$scope = $scope;
      this.$route = $route;
      this.$scope.controller = this;
    }

    return Header;

  })();

  angular.module('app').controller('headerController', ['$scope', '$route', Header]);

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
  var Routes;

  Routes = (function() {
    function Routes($locationProvider, $routeProvider) {
      $locationProvider.html5Mode(true);
      $routeProvider.when('/', {
        templateUrl: 'templates/views/home.html',
        controller: 'homeController'
      }).when('/example-page', {
        templateUrl: 'templates/views/examplepage.html',
        controller: 'examplepageController'
      }).otherwise({
        templateUrl: 'templates/views/404.html',
        controller: 'notFound404Controller'
      });
    }

    return Routes;

  })();

  angular.module('app').config(['$locationProvider', '$routeProvider', Routes]);

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
  var ImageLoader;

  ImageLoader = (function() {
    function ImageLoader() {
      this.load = function(src) {
        var dfd, img;
        dfd = $.Deferred();
        img = new Image();
        img.onload = (function(_this) {
          return function() {
            return dfd.resolve(img);
          };
        })(this);
        img.src = src;
        return dfd;
      };
      this.loadSet = function(set) {
        var i, j, len, loaders;
        loaders = [];
        for (j = 0, len = set.length; j < len; j++) {
          i = set[j];
          loaders.push(ImageLoader.load(i).promise());
        }
        return $.when.apply(null, loaders);
      };
    }

    return ImageLoader;

  })();

  angular.module('app').service('imageLoaderService', [ImageLoader]);

}).call(this);

(function() {
  var Sharer;

  Sharer = (function() {
    function Sharer() {
      var genericUrl;
      genericUrl = document.URL;
      this.openWin = (function(_this) {
        return function(url, w, h) {
          var left, top;
          left = (screen.availWidth - w) >> 1;
          top = (screen.availHeight - h) >> 1;
          return window.open(url, '', 'top=' + top + ',left=' + left + ',width=' + w + ',height=' + h + ',location=no,menubar=no');
        };
      })(this);
      this.plus = (function(_this) {
        return function(url) {
          url = encodeURIComponent(url || genericUrl);
          return _this.openWin("https://plus.google.com/share?url=" + url, 650, 385);
        };
      })(this);
      this.pinterest = (function(_this) {
        return function(url, media, descr) {
          url = encodeURIComponent(url || genericUrl);
          media = encodeURIComponent(media);
          descr = encodeURIComponent(descr);
          return _this.openWin("http://www.pinterest.com/pin/create/button/?url=" + url + "&media=" + media + "&description=" + descr, 735, 310);
        };
      })(this);
      this.tumblr = (function(_this) {
        return function(url, media, descr) {
          url = encodeURIComponent(url || genericUrl);
          media = encodeURIComponent(media);
          descr = encodeURIComponent(descr);
          return _this.openWin("http://www.tumblr.com/share/photo?source=" + media + "&caption=" + descr + "&click_thru=" + url, 450, 430);
        };
      })(this);
      this.facebook = (function(_this) {
        return function(url, copy) {
          var decsr;
          if (copy == null) {
            copy = '';
          }
          url = encodeURIComponent(url || genericUrl);
          decsr = encodeURIComponent(copy);
          return _this.openWin("http://www.facebook.com/share.php?u=" + url + "&t=" + decsr, 600, 300);
        };
      })(this);
      this.twitter = (function(_this) {
        return function(url, copy) {
          var descr;
          if (copy == null) {
            copy = '';
          }
          url = encodeURIComponent(url || genericUrl);
          if (copy === '') {
            copy = _this.__NAMESPACE__().locale.get('seo_twitter_card_description');
          }
          descr = encodeURIComponent(copy);
          return _this.openWin("http://twitter.com/intent/tweet/?text=" + descr + "&url=" + url, 600, 300);
        };
      })(this);
      this.renren = (function(_this) {
        return function(url) {
          url = encodeURIComponent(url || genericUrl);
          return _this.openWin("http://share.renren.com/share/buttonshare.do?link=" + url, 600, 300);
        };
      })(this);
      this.weibo = (function(_this) {
        return function(url) {
          url = encodeURIComponent(url || genericUrl);
          return _this.openWin("http://service.weibo.com/share/share.php?url=" + url + "&language=zh_cn", 600, 300);
        };
      })(this);
    }

    return Sharer;

  })();

  angular.module('app').service('sharerService', [Sharer]);

}).call(this);

# Angular Boilerplate

Super simple Angular app using CoffeeScript, Jade and Stylus. Also has a easy to use cli for generating and deleting views. Everything is compiled using Gulp. BrowserSync will automatically inject css changes and reload your browser when editing your coffee and jade files.

All dependencies and libraries gathered using bower and then compiled into a single vendor.js file. If you require more dependencies or libraries, just run `bower install [library you want] --save`, then run `gulp vendor` from the command line and refresh your browser.

---

#### ngClassify
This app skeleton heavily relies on ngClassify. You will need to understand how it works in order to use this project. It is actually very simple and should only take a few minutes to start understanding the basics. It really makes the app super clean an organised.

For more info visit:
  * [ngClassify](https://github.com/CaryLandholt/ng-classify)

---

#### css
Along with Stylus I've added Jeet and Rupture to make media queries and grids much easier. You dont have to use these but I would highly recommend it.

For more info visit:
  * [Stylus](https://learnboost.github.io/stylus/)
  * [Rupture](https://github.com/jenius/rupture)
  * [Jeet](http://jeet.gs/)

---

##### Generating Spritesheets

If you would like to create a spritesheet from a set of images, just add images to the `src/assets` directory and run `gulp sprites`. All images must be png format. A stylus file and corresponding sprite.png will be generated for you. To display any icon just write out `.icon-[image name]` in any of your jade templates.

For more info visit:
  * [Sprity](https://github.com/aslansky/css-sprite)

---

##### Other Vendors
I've included some other libraries that I think are very useful
  * [GSAP](http://greensock.com/gsap)
  * [jQuery](http://jquery.com/)
  * [lodash](https://lodash.com/)

## Getting Setup

Just run the following from your command line
  * `git clone git@github.com:ashmore11/angular-boilerplate.git` into your preferred directory
  * `cd angular-boilerplate`
  * `make setup`
  * `make watch`

When gulp is up and running, open `http://localhost:3000` in your browser. You should now be able to start working on your app and see updates in your browser automatically thnaks to BroserSync.

## Using the cli

The cli is still very much a work in progress but so far can be used to simultaneously generate a new controller, template and route with some boilerplate. The idea was to save time rather than waste it creating all the files manually.

Initial setup
  * `npm install -g shelljs`
  * `make cli_compile`

To generate or delete a view just run the following from your command line
  * `app mk-view [view name] [route name]`
  * `app rm-view [view name] [route name]`

---

## Ready for Production?

Just run the following from your command line
  * `make release`

---

Many thanks to all the following for making life so much easier!
  * [Gulp](http://gulpjs.com/)
  * [BrowserSync](http://www.browsersync.io/)
  * [Angular](http://angularjs.org/)
  * [CoffeeScript](http://coffeescript.org/)
  * [ngClassify](https://github.com/CaryLandholt/ng-classify)
  * [Stylus](https://learnboost.github.io/stylus/)
  * [Rupture](https://github.com/jenius/rupture)
  * [Jeet](http://jeet.gs/)
  * [GSAP](http://greensock.com/gsap)
  * [jQuery](http://jquery.com/)
  * [lodash](https://lodash.com/)
  * [Sprity](https://github.com/aslansky/css-sprite)
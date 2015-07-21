# Angular Boilerplate

Super simple Angular app using coffeescript, jade and stylus. Also has a easy to use CLI for generating new views. Everything is compiled using Gulp.

All dependencies and vendors gathered using bower and then compiled into a single vendor.js file. If you require more vendors just run `bower install [vendor you want] --save` and then run `make watch` again from the command line.

The CLI is still very much a work in progress but so far can be used to simultaneously generate a new controller, template and route with some boilerplate. The idea was to save time rather than waste it creating all the files manually.

#### ngClassify

This app skeleton heavily relies on CoffeeScript and ngClassify. You will need to understand how both work in order to use this project. ngClassify is actually very simple and should only take a few minutes to start understanding the basics. It really makes the app super clean an organised.

For more info visit:
	* [CoffeeScript](http://coffeescript.org/)
	* [ngClassify](https://github.com/CaryLandholt/ng-classify)

#### css
Along with Stylus I've added Jeet and Rupture to make media queries and grids much easier. you dont have to use these but I would highly recommend it.

For more info visit:
	* [Stylus](https://learnboost.github.io/stylus/)
  * [Rupture](https://github.com/jenius/rupture)
  * [Jeet](http://jeet.gs/)

##### Other Vendors
I've included some other libraries that I think are very useful
	* [GSAP](http://greensock.com/gsap)
	* [jQuery](http://jquery.com/)
	* [lodash](https://lodash.com/)

## Getting Setup

Just run the following from your command line

```
make setup
make watch
```

When gulp is up and running, open `http://localhost:3000` in your browser. You should now be able to start working on your app and Browser Sync will automatically inject css changes and reload your browser when editing your coffee and jade files.

## Using the CLI

Initial setup

```
make cli_compile
```

To generate or delete a view just run the following from your command line

```
app mk-view [view name] [route name]
app rm-view [view name] [route name]
```

## Ready for Production?

Just run the following from your command line

```
make release
```

List of Dependencies
	* [Angular](http://angularjs.org/)
	* [CoffeeScript](http://coffeescript.org/)
	* [ngClassify](https://github.com/CaryLandholt/ng-classify)
	* [Stylus](https://learnboost.github.io/stylus/)
  * [Rupture](https://github.com/jenius/rupture)
  * [Jeet](http://jeet.gs/)
  * [GSAP](http://greensock.com/gsap)
	* [jQuery](http://jquery.com/)
	* [lodash](https://lodash.com/)
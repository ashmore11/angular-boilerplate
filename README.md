# Angular Boilerplate

Super simple Angular app using coffeescript, jade and stylus. Also has a easy to use CLI for generating new views. Everything is compiled using Gulp.

### CSS
I've added Jeet and Rupture to make media queries and grids much easier. you dont have to use these but I would highly recommend it.

For more info visit: 
`https://github.com/jenius/rupture`
`http://jeet.gs/`

All dependencies and vendors gathered using bower and then compiled into a single vendor.js file. If you require more vendors just run `bower install [vendor you want] --save` and then run `make watch` again.

The CLI is still very much a work in progress but so far can be used to simultaneously generate a new controller, template and route with some boilerplate. The idea was to save time rather than waste it creating all the files manually.

This app skeleton heavily relies on ngClassify and you will need to understand how that works in order to use this project. Its actually very simple and should only take a few minutes to start understanding the basics. It really makes the app super clean an organised.

`https://github.com/CaryLandholt/ng-classify`

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
# Angular Boilerplate

Super simple Angular app using coffeescript, jade and stylus. Also has a easy to use CLI for generating new views. Everything is compiled using Gulp.

Also using Jeet and Rupture to make media queries and grids much easier.

All dependencies and vendors gathered using bower and then compiled into a single vendor.js file.

CLI is still very much a work in progress but so far can be used to simultaneously generate a new controller, template and route with some boilerplate. The idea was to save time rather than waste it creating all the files manually.

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
# Angular Boilerplate

Super simple Angular app using coffeescript, jade and stylus. Also has a easy to use CLI for generating new views. Everything is compiled using Gulp.

Also using Jeet and Rupture to make media queries and grids easier.

## Setup

```
make setup
```

## Development

```
make watch
```

## Release

```
make release
```

## Using the CLI

To generate or delete a view just call 'ngapp gen-view', 'ngapp del-view' from your command line passing a name for the view and a name for the route of your new view

```
ngapp gen-view [view name] [route name]

ngapp del-view [view name] [route name]
```
# Ember.js, Ember-Data, Sprockets, Handlebars Example App / Start-Kit

This is a fork of another modest project that aimed to make it easy to get started with Ember and CoffeeScript. I've expanded on it here so that I have a working example/bootstrap for getting started with Ember while making use of existing tools like CoffeeScript, Sass, and Handlebars. The original fork had removed `handlebars_assets` but it is working again so I've added it back, and added a Post resource with show/index views for example. This makes use of Ember-Data.

Ember.js already has a simple [start kit](https://github.com/emberjs/starter-kit) for JavaScript developers. Unfortunately starting with Ember.js and CoffeeScript is a little harder.

It is possible to create a new Rails application with [ember-rails](https://github.com/emberjs/ember-rails) and let the asset pipeline handle the CoffeeScript. But when you start out with Ember.js you probably don't want an entire Rails application to start with.

Therefore the Ember.js CoffeeScript Start Kit exists. You get the great asset pipeline to handle CoffeeScript and SASS out of the box in a simple and small rack app. The directory structure mirrors the structure of a Rails application so a future switch to a full blown application is just a copy & paste away.

## Getting Started
1. Download or clone this repository.
2. Run `bundle install` to install the dependencies.
3. Start the server with `rake sever` or `rake s`.
4. Go to [localhost:3000](http://localhost:3000)

Out of the box this app is set up to use ember-data and assumes you have a service running at localhost:9292.

```coffee
# app.js.coffee

window.App = Ember.Application.create()

window.App.Store = DS.Store.extend(
  revision: 12
  adapter: DS.RESTAdapter.extend(url: "http://localhost:9292")
)
```

The existing post resource assumes that your service on 9292 responds to `/posts` with json returning an array of posts like so:

```js
{ 
  "posts": [
    {"id": 1, "title": "my first post"}, 
    {"id": 2, "title": "my second post"}
  ]
}
```

And `/posts/:id` expects a response like:

```js
{
  "post": {"id": 1, "title": "my first post"}
}
```

## FAQ
**Is [Pow](http://pow.cx/) supported?**
Yes.
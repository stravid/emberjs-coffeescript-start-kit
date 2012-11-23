# Ember.js CoffeeScript Start Kit
Ember.js already has a simple [start kit](https://github.com/emberjs/starter-kit) for JavaScript developers. Unfortunately starting with Ember.js and CoffeeScript is a little harder. It is possible to create a new Rails application with [ember-rails](https://github.com/emberjs/ember-rails) and let the asset pipeline handle the CoffeeScript. But when you start out with Ember.js you probably don't want an entire Rails application to start with.

Therefore the Ember.js CoffeeScript Start Kit exists. You get the great asset pipeline to handle CoffeeScript and SASS out of the box in a simple and small rack app. The directory structure mirrors the structure of a Rails application so a future switch to a full blown application is just a copy & paste away.

## Getting Started
1. Download or clone this repository.
2. Run `bundle install` to install the dependencies.
3. Start the server with `bundle exec rackup -p 3000`.
4. Go to [localhost:3000](http://localhost:3000) and start developing.

## FAQ
**Is [Pow](http://pow.cx/) supported?**
Yes.
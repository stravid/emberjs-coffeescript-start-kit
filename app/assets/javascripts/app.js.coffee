window.App = Ember.Application.create()

window.App.Store = DS.Store.extend(
  revision: 12
  adapter: DS.RESTAdapter.extend(url: "http://localhost:9292")
)
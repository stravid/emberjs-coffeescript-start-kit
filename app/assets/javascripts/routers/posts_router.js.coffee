App.PostsRoute = Ember.Route.extend(
  model: ->
    App.Post.find();
)
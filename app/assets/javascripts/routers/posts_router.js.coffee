App.PostsIndexRoute = Ember.Route.extend
  model: ->
    App.Post.find()

App.PostsShowRoute = Ember.Route.extend
  model: (params) ->
    App.Post.find(params.post_id)
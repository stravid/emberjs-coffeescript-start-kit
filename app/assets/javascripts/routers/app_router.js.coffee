App.Router.map ->
  @resource "posts", ->
    @route "index",
    @route "show"
      path: ":id"
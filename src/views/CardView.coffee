class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src=\'img/<% if(revealed) { %>cards/<%= rankName %>-<%= suitName %><% } else { %>card-back<% } %>.png\'>'

  initialize: (params) ->
    @isNew = params.isNew
    @render()

  render: ->
    @$el.children().detach()
    if(@isNew)
      @$el.html(@template @model.attributes).fadeIn(1000)
    else
      @$el.html(@template @model.attributes)
    @$el.addClass 'covered' unless @model.get 'revealed'


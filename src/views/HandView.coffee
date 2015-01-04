class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', (card) =>
      console.log(@)
      @render(card)
    @render()

  render: (addedCard) ->
    console.log(@)
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card, isNew: card==addedCard).$el
    if !@collection.at(0).get('revealed') and @collection.isDealer
      @$('.score').text @collection.at(1).get 'value'
      console.log('there');
    else
      @$('.score').text @collection.bestScore()
      console.log('here');



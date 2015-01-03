class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()
    @dealerRevealed = false
    @collection.at(0).on 'change:revealed', => @dealerRevealed = true

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if !@dealerRevealed and @collection.isDealer
      @$('.score').text @collection.at(1).get 'value'
    else
      @$('.score').text @collection.bestScore()



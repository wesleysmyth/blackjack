class window.AppView extends Backbone.View
  template: _.template '
    <button class="newgame-button">New Game</button>
    <div class="game-container"></div>
  '

  events:
    'click .newgame-button': ->
      @model.newGame()
      @render()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.game-container').html new GameView(model: @model.get 'game').el


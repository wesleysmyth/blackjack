# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'winner', null

    if (@get 'playerHand').scores()[0] > 21 then @set 'winner', 'dealer'
    if (@get 'playerHand').scores()[0] is 21 then (@get 'playerHand').stand()

    (@get 'playerHand').on 'stand', =>
      #dealer.takeTurn();






# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'winner', null

    if (@get 'playerHand').scores()[1] is 21 then (@get 'playerHand').stand()

    (@get 'playerHand').on 'stand', =>
      @takeDealerTurn()

    (@get 'playerHand').on 'add', =>
      if (@get 'playerHand').bestScore() == 21
        (@get 'playerHand').stand();
      if (@get 'playerHand').scores[0] > 21
        @set 'winner', 'dealer'

    (@get 'dealerHand').on 'stand', =>
      if (@get 'dealerHand').bestScore() > (@get 'playerHand').bestScore()
        @set 'winner', 'dealer'
      else if (@get 'dealerHand').bestScore() < (@get 'playerHand').bestScore()
        @set 'winner', 'player'
      else  #push
        @set 'winner', 'push'


    (@get 'dealerHand').on 'add', =>
      @takeDealerTurn();

  takeDealerTurn: ->

    if (@get 'dealerHand').bestScore() > 21
      @set 'winner', 'player'
    else if (@get 'dealerHand').bestScore() >= 17
      (@get 'dealerHand').stand()
    else
      (@get 'dealerHand').hit()





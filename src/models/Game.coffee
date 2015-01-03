# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'winner', null

    @on 'change:winner', =>
      console.log("#{@get 'winner'} won")

    (@get 'playerHand').on 'stand', =>
      @takeDealerTurn()

    (@get 'playerHand').on 'add', =>
      if (@get 'playerHand').bestScore() == 21
        (@get 'playerHand').stand();
      else if (@get 'playerHand').scores()[0] > 21
        (@get 'dealerHand').at(0).flip()
        @set 'winner', 'dealer'

    (@get 'dealerHand').on 'stand', =>
      if (@get 'dealerHand').bestScore() > (@get 'playerHand').bestScore()
        @set 'winner', 'dealer'
      else if (@get 'dealerHand').bestScore() < (@get 'playerHand').bestScore()
        @set 'winner', 'player'
      else  #push
        @set 'winner', 'you both '

    (@get 'dealerHand').on 'add', =>
      @takeDealerTurn()

    if (@get 'playerHand').scores()[1] is 21 then (@get 'playerHand').stand()

  takeDealerTurn: ->
    (@get 'dealerHand').at(0).set('revealed', true)

    if (@get 'dealerHand').bestScore() > 21
      @set 'winner', 'player'
    else if (@get 'dealerHand').bestScore() >= 17
      (@get 'dealerHand').stand()
    else
      (@get 'dealerHand').hit()




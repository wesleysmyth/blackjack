class window.Card extends Backbone.Model
  initialize: (params) ->
    @set
      revealed: true
      value: if !params.rank or params.rank > 10 then 10 else params.rank #Ace is assigned value 1. Remember later that it could be considered 11.
      suitName: ['Spades', 'Diamonds', 'Clubs', 'Hearts'][params.suit]
      rankName: switch params.rank
        when 0 then 'King'
        when 1 then 'Ace'
        when 11 then 'Jack'
        when 12 then 'Queen'
        else params.rank

  flip: ->
    @set 'revealed', !@get 'revealed'
    @


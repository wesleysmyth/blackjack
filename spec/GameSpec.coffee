assert = chai.assert
expect = chai.expect

createTestGame = (p1,p2,d1,d2) ->
  if p1 == 10
    p1 = 0
  new Game(playerHand: new Hand([new Card(rank:p1, suit:1), new Card(rank:p2,suit:1)], new Deck()), dealerHand: new Hand([new Card(rank:d1, suit:1).flip(), new Card(rank:d2,suit:1)], new Deck(), true))

describe 'game', ->
  game=null

  beforeEach ->
    game = new Game()

  describe 'blah', ->
    it 'should have a deck', ->
      #assert.exists(game.get('deck'))
      expect(game.get('deck')).to.exist

    it 'should have a playerhand', ->
      expect(game.get('playerHand')).to.exist

    it 'should have a dealerHand', ->
      expect(game.get('dealerHand')).to.exist

    it 'deck length should start at 48', ->
      expect(game.get('deck').models.length).to.equal(48)

    it 'should have a winner property set to null', ->
      expect(game.get('winner')).to.equal(null)
      game.set('winner', 'dealer')
      expect(game.get('winner')).to.equal('dealer')

  describe 'takeDealerTurn', ->
    it 'dealer stand and win on p[5,5], d[10,7]', ->
      game = createTestGame(5,5,10,7)
      game.takeDealerTurn()
      expect(game.get('winner')).to.equal('dealer')

    it 'p[5,5] d[10,4] dealer should hit', ->
      game = createTestGame(5,5,10,4)
      game.takeDealerTurn()

      expect(game.get('dealerHand').length).to.be.greaterThan(2)

    it 'p[10,11] d[10,8] dealer should take turn and hit automatically', ->
      game = createTestGame(10,1,10,8)
      expect(game.get('dealerHand').length).to.be.greaterThan(2)
      expect(game.get('dealerHand').at(0).get('revealed')).to.equal(true)

    it 'p[10,10] d[10,10,3] player should win', ->
      game = createTestGame(10,10,10,10)
      game.get('dealerHand').add(new Card(rank: 3, suit:1))
      game.takeDealerTurn()

    it 'p[10,8], d[10,9] dealer should stand and win', ->
      game = createTestGame(10,8,10,9)
      game.takeDealerTurn()





  ###
    it 'dealer takes a turn after user hits 21'
      playerHand = game.get('playerHand')
      playerHand.add(21 - playerHand.minScore())
      expect(playerHand.minScore()).to.equal(21)


    it 'if the user goes over 21, user loses'

    it 'if the user stands, the dealer takes a turn'

  describe 'dealer actions', ->
    it 'if the dealer\'s under 17, he hits'

    it 'if the dealer\'s over 16 he stands'

    it 'if dealer stands, we compare and declare a winner or tie'

    it 'if dealer goes over 21, dealer loses'

    it 'if dealer hits 21, we compare and declare a winner or tie'


  describe 'comparison', ->
    it 'accurately decides the winner or tie'
  ###


  #expect(card.get('value')).to.be.within(0,10)


assert = chai.assert
expect = chai.expect

describe 'card', ->
  card=null
  deck = null

  beforeEach ->
    deck = new Deck()
    card = deck.pop()

  describe 'blah', ->
    it 'should have a value that is a number', ->
      assert.isNumber(card.get('value'))

    it 'should have a value between 0 and 10', ->
      expect(card.get('value')).to.be.within(0,10)

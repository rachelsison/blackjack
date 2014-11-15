# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    #console.log(@get('dealerHand').models[0])#, deck[0].flip())
    @get('playerHand').on 'stand', @dealerTurn, @
    @get('playerHand').on 'hit', @isBusted, @



  isBusted: ->
    score = @get('playerHand').scores()[0]
    minScore = @get('playerHand').scores()[1]
    #console.log @get('playerHand').scores()
    #check if dealer, if so, set str var to
    #"Dealer" otherwise set it to "Player"
    # %s into alert str.
    if score > 21
      console.log "calling isBusted"
      alert "Busted!"
    if score == 21
      alert "BlackJack!"
    if minScore == 21
      alert "BlackJack!"

  DealerBusted: ->
    score = @get('dealerHand').scores()[0]
    minScore = @get('dealerHand').scores()[1]
    #console.log @get('playerHand').scores()
    #check if dealer, if so, set str var to
    #"Dealer" otherwise set it to "Player"
    # %s into alert str.
    if score > 21
      console.log "calling Dealer isBusted"
      alert "Dealer Busted!"
    if score == 21
      alert "Dealer Won BlackJack!"
    if minScore == 21
      alert "Dealer Won BlackJack!"

  dealerTurn: ->
    @get('dealerHand').models[0].flip()
    #dealerScore = @get('dealerHand').scores()[0]
    #dealerMinScore = @get('playerHand').scores()[1]
    while @get('dealerHand').scores()[0] <= 17
      @get('dealerHand').hit()
      console.log "calling DealerBusted"
      @DealerBusted()

    playerScore = 21 - @get('playerHand').scores()[0]
    dealerScore = 21 - @get('dealerHand').scores()[0]

    playerMinScore = 21 - @get('playerHand').scores()[1]
    dealerMinScore = 21 - @get('dealerHand').scores()[1]

    scoreArr =
      [
        {name: 'player', value: playerScore},
        {name: 'player', value: playerMinScore},
        {name: 'dealer', value: dealerScore},
        {name: 'dealer', value: dealerMinScore}
      ]

    scoreArr.sort( (a, b) ->
      return 1  if a.value> b.value
      return -1  if a.value < b.value
      return 0)

    console.log scoreArr[0]




















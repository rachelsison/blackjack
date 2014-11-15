class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/ponyCards/<%= rankName %> of <%= suitName %>.png" height="140*1.5" width="150">'
  coveredTemplate: _.template  '<img src="img/ponyCards/Card Backs.png" height="140*1.5" width="150">'
  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.html @coveredTemplate unless @model.get 'revealed'
    #@$el.addClass 'covered' unless @model.get 'revealed'

  ponyRender: ->
    newSuit = ""
    #['Spades', 'Diamonds', 'Clubs', 'Hearts']
    if suitName == 'Spades'
      newSuit = 'bolts'
    if suitName == 'Diamonds'
      newSuit = 'gems'
    if suitName == 'Clubs'
      newSuit = 'balloons'
    if suitName == 'Hearts'
      newSuit = 'apples'
    link = '<img src="img/ponyCards/<%= rankName %> of <%= newSuit %>.png" height="142" width="102">'
    link

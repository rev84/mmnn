class CharacterPalletManager
  @ID = 'character_pallet'
  @POS_X = 0
  @POS_Y = 0

  @SIZE_X = 400
  @SIZE_Y = 800

  @characters = []
  @panels = []

  @init:->
    @div = $('<div>').attr('id', @ID).addClass('no_display').css({
      width: @SIZE_X
      height: @SIZE_Y
    }).appendTo($('body'))
    
  @show:->
    $(@div).removeClass('no_display')

  @hide:->
    $(@div).addClass('no_display')

  @addCharacter:(characterObject)->
    @characters.push characterObject
    @draw()

  @draw:->
    @characters.sort (a, b)->
      Number(a.constructor.characterId) - Number(b.constructor.characterId)
    
    @panels = []
    $('#'+@ID+' > .'+Panel.CLASSNAME).remove()
    for c, index in @characters
      top = index * Panel.SIZE_Y
      @panels.push(new Panel(@div, c, top))


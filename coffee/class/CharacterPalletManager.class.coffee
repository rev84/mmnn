class CharacterPalletManager
  @ID = 'character_pallet'

  @SIZE_X = 400
  @SIZE_Y = 800

  @characters = []
  @panels = []

  @init:(@parentElement, @posX, @posY)->
    @divObject = $('<div>').attr('id', @ID)
    .addClass('no_display').css({
      width: @SIZE_X
      height: @SIZE_Y
      left: @posX
      top: @posY
    }).appendTo(@parentElement)
    
  @show:->
    $(@divObject).removeClass('no_display')

  @hide:->
    $(@divObject).addClass('no_display')

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
      @panels.push(new Panel(@divObject, c, top))


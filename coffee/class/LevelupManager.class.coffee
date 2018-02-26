class LevelupManager
  @ID:'levelup'
  @SIZE_X = 1050
  @SIZE_Y = 600

  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: @SIZE_X
      height: @SIZE_Y
    }).appendTo(@parentElement)

    @characters = []

  @addCharacter:(characterObject)->
    @characters.push characterObject

  @draw:->
    @characters.sort (a, b)->
      Number(a.getId()) - Number(b.getId())
    
    @panels = []
    $('#'+@ID+' > .'+LevelupPanel.CLASSNAME).remove()
    for c, index in @characters
      top = index * LevelupPanel.SIZE_Y
      @panels.push(new LevelupPanel(@divObject, c, top))

  @show:->
    @divObject.addClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

class LevelupManager
  @ID:'levelup'
  @SIZE_X = 1320
  @SIZE_Y = 585

  @init:(@parentElement)->
    @spaceObject = $('<div>').attr('id', @ID).css({
      width: @SIZE_X
      height: @SIZE_Y
    }).appendTo(@parentElement)

    @divObject = $('<div>').addClass('levelup_main').appendTo(@spaceObject)

    $('<div>').addClass('levelup_back').appendTo(@spaceObject)

    @characters = []
    for k, cObj of GameManager.characters
      @characters.push cObj

  @draw:->
    @characters.sort (a, b)->
      Number(a.getId()) - Number(b.getId())
    
    @panels = []
    $('#'+@ID+' .'+LevelupPanel.CLASSNAME).remove()
    y = 0
    for c, index in @characters
      continue unless c.isJoined()
      top = y * LevelupPanel.SIZE_Y
      @panels.push(new LevelupPanel(@divObject, c, top))
      y++

  @show:->
    @divObject.addClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

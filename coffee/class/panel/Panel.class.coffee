class Panel
  @SIZE_X = 400
  @SIZE_Y = 100

  @CLASSNAME = 'panel'

  constructor:(@parentElement, @object, @posY = 0, @posX = 0)->
    @div = $('<div>').addClass(@constructor.CLASSNAME).css({
      width: @constructor.SIZE_X
      height: @constructor.SIZE_Y
      top : @posY
      left : @posX
    })
    @parentElement.append @div
    @draw()

  draw:->
    $(@div).html(@object.constructor.characterName)


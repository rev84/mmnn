class LevelupPanel
  @SIZE_X : Panel.SIZE_X*2 + 200
  @SIZE_Y : 120

  @CLASSNAME : 'levelup_panel'

  constructor:(@parentElement, @object, @posY = 0, @posX = 0)->
    @divObject = $('<div>').addClass(@constructor.CLASSNAME).css({
      width: @constructor.SIZE_X
      height: @constructor.SIZE_Y
      top : @posY
      left : @posX
    }).appendTo(@parentElement)
    @draw()

  draw:->
    $(@divObject).find('*').remove()
    @leftPanel = new Panel(@divObject, @object, 0, 0)
    @rightPanel = new Panel(@divObject, @object, 0, Panel.SIZE_X + 200)
    @centerController = new LevelupController @, @divObject

  setLevel:(levelup)->
    @rightPanel.draw(@object.getLevel() + levelup)

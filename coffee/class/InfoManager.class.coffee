class InfoManager
  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: Panel.SIZE_X
      height: Panel.SIZE_Y
    }).appendTo(@parentElement)
 
    @panel = new Panel(@divObject, null, null, null, false, false, true)

  @setObject:(object = null)->
    # 切り替わった時は音を出す
    if object isnt null and (@panel.object is null or @panel.object.getObjectType() isnt object.getObjectType() or @panel.object.getId() isnt object.getId())
      SoundManager.play 'cell_hover'
    @panel.object = object
    @panel.draw()


  @show:->
    @divObject.addClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

class InfoManager
  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: Panel.SIZE_X
      height: Panel.SIZE_Y
      "background-color" : '#000000'
    }).appendTo(@parentElement)
 
    @panel = new Panel(@divObject, null, null, null, false, false, true)

  @setObject:(object = null)->
    @panel.object = object
    @panel.draw()

  @show:->
    @divObject.addClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

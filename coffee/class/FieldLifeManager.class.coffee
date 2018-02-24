class FieldLifeManager
  @ID:'field_life'
  @SIZE_X : 200
  @SIZE_Y : 120

  @init:(@parentElement, @life)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: @SIZE_X
      height: @SIZE_Y
    })
    
    @amountObject = $('<span>').css({
      left:0
      top:0
    }).appendTo(@divObject)

    @draw()
    @divObject.appendTo @parentElement

  @setLife:(life)->
    @life = life
    @draw()
    @life

  @decrease:->
    @life--
    @life = 0 if @life < 0
    @draw()
    @life

  @draw:->
    @amountObject.html '&#9829;'+@life

  @show:->
    @divObject.addClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

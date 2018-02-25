class EnvManager
  @ID = 'env'
  @SIZE_X : 200
  @SIZE_Y : 120

  @exp = 0
  @floor = 1
  @life = 5

  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: @SIZE_X
      height: @SIZE_Y
    })
    
    @lifeObject = $('<div>').css({
      left:0
      top:2
      height:35
      width:@SIZE_X-10
    }).appendTo(@divObject)

    @expObject = $('<div>').css({
      left:0
      top:40
      height:35
      width:@SIZE_X-10
    }).appendTo(@divObject)

    @floorObject = $('<div>').css({
      left:0
      top:77
      height:35
      width:@SIZE_X-10
    }).appendTo(@divObject)

    @draw()
    @divObject.appendTo @parentElement

  @draw:->
    @lifeObject.html '&#9829;'+@life
    @expObject.html 'EXP:'+@exp
    @floorObject.html ''+@floor+'階'

  @increaseExp:(amount)->
    return false if amount < 1
    @exp += amount
    @draw()
    @exp


  @decreaseExp:(amount)->
    return false if amount < 1
    return false if @exp < amount
    @exp -= amount
    @draw()
    @exp

  @getExp:->
    @exp

  @setExp:(exp)->
    return false if exp < 0
    @exp = exp
    @draw()
    @exp

  @increaseFloor:(amount = 1)->
    return false if amount < 1
    @floor += amount
    @draw()
    @floor

  @decreaseFloor:(amount)->
    return false if amount < 1
    return false if @floor - amount < 1
    @floor -= amount
    @floor = 1 if @floor < 1
    @draw()
    @floor

  @getFloor:->
    @floor

  @setFloor:(floor)->
    return false if floor < 1
    @floor = floor
    @draw()
    @floor

  @increaseLife:(amount = 1)->
    return false if amount < 1
    @life += amount
    @draw()
    @life

  @decreaseLife:(amount = 1)->
    return false if amount < 1
    return false if @life < amount
    @life -= amount
    @life = 0 if @life < 0
    @draw()
    @life

  @getLife:->
    @life

  @setLife:(life)->
    return false if life < 0
    @life = life
    @draw()
    @life

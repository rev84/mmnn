class EnvManager
  @ID = 'env'

  @exp = 0
  @floor = 1
  @life = 5
  @juwel = 0

  @init:(@parentElement)->
    @lifeObject = $('<div>').attr('id', 'life').appendTo(@parentElement)
    @floorObject = $('<div>').attr('id', 'floor').appendTo(@parentElement)
    @expObject = $('<div>').attr('id', 'exp').appendTo(@parentElement)
    @juwelObject = $('<div>').attr('id', 'juwel').appendTo(@parentElement)

    @draw()

  @draw:->
    @lifeObject.html '&#9829;'+@life
    @expObject.html @exp
    $('<span>').html('EXP').css({
      left:0
      height: 60
      position: 'absolute'
    }).appendTo(@expObject)
    @floorObject.html '公演'+@floor+'日目'
    @juwelObject.html @juwel
    $('<img>').attr('src', './img/juwel.png').css({
      left:0
      height: 60
      position: 'absolute'
    }).appendTo(@juwelObject)

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

  @increaseJuwel:(amount)->
    return false if amount < 1
    @juwel += amount
    @draw()
    @juwel

  @decreaseJuwel:(amount)->
    return false if amount < 1
    return false if @juwel < amount
    @juwel -= amount
    @juwel = 0 if @juwel < 0
    @draw()
    @juwel

  @getJuwel:->
    @juwel

  @setJuwel:(juwel)->
    return false if juwel < 0
    @juwel = juwel
    @draw()
    @juwel

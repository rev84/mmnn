class EnvManager
  @ID = 'env'

  @exp = 0
  @floor = 1
  @lifeMax = 5
  @life = 5
  @jewel = 0

  @DEATH_PENALTY_CLOSED = true

  @init:(@parentElement)->
    @lifeObject = $('<div>').attr('id', 'life').appendTo(@parentElement)
    @floorObject = $('<div>').attr('id', 'floor').appendTo(@parentElement)
    @expObject = $('<div>').attr('id', 'exp').appendTo(@parentElement)
    @jewelObject = $('<div>').attr('id', 'jewel').appendTo(@parentElement)

    # デスペナルティのウインドウ
    @deathPenaltyWindow = $('#death_penalty_window').on('hidden.bs.modal', @onCloseDeathPenaltyWindow.bind(@))
    @deathPenaltyFloor = $('#death_penalty_decrease_floor')

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
    @jewelObject.html @jewel
    $('<img>').attr('src', './img/jewel.png').css({
      left:0
      height: 60
      position: 'absolute'
    }).appendTo(@jewelObject)

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

  @resetLife:->
    @life = @lifeMax

  @getLife:->
    @life

  @setLife:(life)->
    return false if life < 0
    @life = life
    @draw()
    @life

  @increaseJewel:(amount)->
    return false if amount < 1
    @jewel += amount
    @draw()
    @jewel

  @decreaseJewel:(amount)->
    return false if amount < 1
    return false if @jewel < amount
    @jewel -= amount
    @jewel = 0 if @jewel < 0
    @draw()
    @jewel

  @getJewel:->
    @jewel

  @setJewel:(jewel)->
    return false if jewel < 0
    @jewel = jewel
    @draw()
    @jewel

  # ライフが0になった時の処理
  @deathPenalty:->
    return false if @getLife() > 0

    await Utl.sleep(2000)

    @DEATH_PENALTY_CLOSED = false

    # 戻す日数
    decreaseFloor = Math.ceil(@getFloor() * 0.1)
    decreaseFloor = 100 if 100 < decreaseFloor
    decreaseFloor = 0 if @getFloor() - decreaseFloor < 1

    @deathPenaltyFloor.html(@getFloor() - decreaseFloor)

    @deathPenaltyWindow.modal('show')

    @DEATH_PENALTY_CLOSED = false
    
    await Utl.sleep(1000) while !@DEATH_PENALTY_CLOSED

    for t in [0...decreaseFloor]
      @decreaseFloor(1)
      await Utl.sleep(10)

    # 全消去
    FieldManager.removeAllObject()
    FieldManager.removeAllKnockout()
    FieldManager.removeAllWayStack()
    FieldManager.draw()
    # 全キャラ復活
    for cId, cObj of GameManager.characters
      cObj.setComebackTurn 0
      cObj.setInField false
      cObj.hp = null
    # 移動・攻撃・戻るモードを解除
    GameManager.flags.movePickCell = null
    GameManager.flags.moveToCell = null
    GameManager.flags.waitAttackCell = null
    # ライフを復活
    @resetLife()
    
    true

  @onCloseDeathPenaltyWindow:->
    @DEATH_PENALTY_CLOSED = true

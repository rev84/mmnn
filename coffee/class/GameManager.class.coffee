class GameManager
  @DEBUG_CONFIG = 
    # 右クリックでメニューをでなくする
    DISABLE_RIGHT_CLICK_MENU : false

  @ID:'game'

  @contorollable = false
  @mousePos = {x:0, y:0}
  @gameElement = null
  @characters = []
  @initialized = 
    characters:false
    field:false
    menu:false
    enemys:false
  @flags = 
    # セルのオブジェクトのアニメーションを有効にするか
    isCellObjectAnimation : true
    # キャラクター出撃モードに遷移していい状態であるか
    isEnableCharacterPick : true
    # 現在、キャラクター出撃モードであるか
    isCharacterPick : false
    # キャラクター出撃をしている場合、現在ドラッグされているキャラクターオブジェクト
    pickedCharacterObject : null
    # キャラクター出撃をしている場合、現在ドラッグされているキャラクターの要素
    pickedCharacterElement : null
    # 戦闘モードに遷移していい状態であるか
    isEnableBattle : true
    # 現在、戦闘モードであるか
    isBattle : false
    # 戦闘モードでキャラクターを動かしている場合、現在対象になっているセル
    movePickCell : null
    # 「元に戻す」で戻れるセルのオブジェクト
    # [0]元のセル [1]移動先のセル
    moveToCell : null
    # 戦闘モードで攻撃待ちの場合、現在対象になっているセル
    waitAttackCell : null

  # アニメーション関係
  @POSITION =
    BATTLE:
      menu:[0,0]
      character_pallet:null
      field:[0,50]
      left_info:[0,660]
      right_info:[400,660]
    CHARACTER_PICK:
      menu:[0,0]
      character_pallet:[0,50]
      field:[400,50]
      left_info:null
      right_info:null
  @ANIMATION_MSEC = 500

  @onMouseMiddleDown:(evt)->
    return unless @isControllable()
    true

  @onMouseMiddleUp:(evt)->
    return unless @isControllable()
    true

  @onMouseRightDown:(evt)->
    return unless @isControllable()
    true

  @onMouseRightUp:(evt)->
    return unless @isControllable()
    true

  @onMouseLeftDown:(evt)->
    return unless @isControllable()
    true

  @onMouseLeftUp:(evt)->
    return unless @isControllable()
    console.log('game mouseup')
    # 出撃選択を解除
    if @flags.pickedCharacterObject isnt null
      @flags.pickedCharacterObject = null
    if @flags.pickedCharacterElement isnt null
      @flags.pickedCharacterElement.remove()
      @flags.pickedCharacterElement = null
    true

  @onMouseLeave:(evt)->
    return unless @isControllable()
    true

  @onMouseMove:(evt)->
    return unless @isControllable()
    # マウスの位置は常に記録
    [@mousePos.x, @mousePos.y] = Utl.e2localPos evt

    # キャラクター出撃モードで、キャラクターがピックされている場合
    if @flags.pickedCharacterElement isnt null
      @followPickedCharacterElement(evt)

    true

  # キャラクターの絵をマウスに追随させる
  @followPickedCharacterElement:(evt)->
    # キャラクター出撃モードで、キャラクターがピックされている場合
    if @flags.pickedCharacterElement isnt null
    # そのキャラクターの絵をマウスに追随させる
      @flags.pickedCharacterElement.css({
        left: @mousePos.x - 90/2
        top: @mousePos.y - 90/2
      }).removeClass('no_display')

  # 戦闘に移行
  @doBattle:(isSoon = false)->
    # 戦闘モードに遷移可能な状態ではない
    return unless @flags.isEnableBattle

    @partsAnimation @POSITION.BATTLE, isSoon

    # キャラクター出撃モードを切る
    @flags.isCharacterPick = false
    @flags.pickedCharacterObject = null
    @flags.pickedCharacterElement.remove() if @flags.pickedCharacterElement isnt null
    @flags.pickedCharacterElement = null
    @switchTempAll()

    # 戦闘モードにする
    @flags.isBattle = true

  # キャラクター出撃に移行
  @doCharacterPick:(isSoon = false)->
    # キャラクター出撃モードに遷移可能な状態ではない
    return unless @flags.isEnableCharacterPick

    @partsAnimation @POSITION.CHARACTER_PICK, isSoon

    # キャラクター出撃モードにする
    @flags.isCharacterPick = true
    @flags.pickedCharacterObject = null
    @flags.pickedCharacterElement.remove() if @flags.pickedCharacterElement isnt null
    @flags.pickedCharacterElement = null
    @switchTempAll()

    # 戦闘モードを切る
    @flags.isBattle = false
    

  @partsAnimation:(ary, isSoon = false)->
    # 操作不能にする
    @changeControllable false

    animationMsec = if isSoon then 0 else @ANIMATION_MSEC

    # アニメーション登録
    for id, pos of ary
      # 消す
      if pos is null
        $('#'+id).slideUp(animationMsec)
        ###
        if isSoon
          $('#'+id).css('display', 'none')
        else
          $('#'+id).slideUp(@ANIMATION_MSEC)
        ###

      # 表す
      else
        $('#'+id).animate({left: pos[0], top: pos[1]}, animationMsec).slideDown(animationMsec)
        ###
        if isSoon
          $('#'+id).css('display', 'block').css({left: pos[0], top: pos[1]})
        else
          $('#'+id).slideDown(@ANIMATION_MSEC).css({left: pos[0], top: pos[1]})
        ###

    # 指定時間後に操作可能
    setTimeout =>
      @changeControllable true
    , animationMsec

  @init:->
    # 右クリック禁止
    $(document).on 'contextmenu', ->
      !GameManager.DEBUG_CONFIG.DISABLE_RIGHT_CLICK_MENU

    @gameElement = $('<div>').attr('id', @ID)
                   .on('mousemove', @onMouseMove.bind(@))
                   .on('mouseup', (evt)=>
                      switch evt.which
                        when 1 then @onMouseLeftUp.bind(@)(evt)
                        when 2 then @onMouseMiddleUp.bind(@)(evt)
                        when 3 then @onMouseRightUp.bind(@)(evt)
                    )
                   .on('mousedown', (evt)=>
                      switch evt.which
                        when 1 then @onMouseLeftDown.bind(@)(evt)
                        when 2 then @onMouseMiddleDown.bind(@)(evt)
                        when 3 then @onMouseRightDown.bind(@)(evt)
                    )
                   .on('mouseleave', @onMouseLeave.bind(@))
                   .css({
                      width: 1200
                      height: 800
                    })

    @initField(null)
    @initExp(null)
    @initMenu(null)
    @initPanels(null)
    @initCharacters(null)
    @initEnemys(null)

    @gameElement.appendTo('body')

    @doBattle(true)

  @initMenu:(savedata)->
    return if @initialized.menu
    @initialized.menu = true

    MenuManager.init(@gameElement, 0, 0)

  @initField:(savedata)->
    return if @initialized.field
    @initialized.field = true

    FieldManager.init(@gameElement, 400, 50)

  @initExp:(savedata)->
    return if @initialized.exp
    @initialized.exp = true

    ExpManager.init(@gameElement, 0, 0)

  @initPanels:(savedata)->
    return if @initialized.panels
    @initialized.panels = true

    LeftInfoManager.init(@gameElement)
    RightInfoManager.init(@gameElement)


  # キャラ初期化
  @initCharacters:(savedata)->
    return if @initialized.characters
    @initialized.characters = true

    CharacterPalletManager.init(@gameElement, 0, 50)

    @characters = {}
    for characterId, className of window.CharacterList
      if savedata? and 'characters' of savedata and characterId of savedata.characters
        params = savedata.characters[characterId]
      else
        params = 
          joined : null
          level : 1
          hp : null
          items : []
          inField : false
          moved: false

      @characters[characterId] = new window.CharacterList[characterId](params)
    for characterId, characterObject of @characters
      CharacterPalletManager.addCharacter(characterObject)
    CharacterPalletManager.show()

  # キャラ初期化
  @initEnemys:(savedata)->
    return if @initialized.enemys
    @initialized.enemys = true

    #### デバッグ
    FieldManager.cells[5][5].object = new Akui({
      level : 1
      hp : null
      inField : false
      moved: false      
    })

  @isControllable:->
    @controllable

  @changeControllable:(bool)->
    @controllable = !!bool

  @switchTempAll:->
    $.each FieldManager.cells, ->
      $.each @, ->
        @switchTemp()

  @movePick:(cell)->
    FieldManager.removeAllWayStack()
    FieldManager.removeAllKnockout()

    # 移動可能モード
    @flags.movePickCell = cell
    # 攻撃可能モード
    @flags.waitAttackCell = cell

    movableMap = Utl.array2dFill(FieldManager.CELL_X, FieldManager.CELL_Y, null)
    movableMap[cell.xIndex][cell.yIndex] = []
    while !allCellChecked
      Utl.dumpNumArray2d movableMap
      allCellChecked = true
      for body, x in movableMap
        for wayStack, y in body
          # まだ未調査のマス
          if wayStack is null
            # 進入不可でないなら、未調査であっては終われない
            if FieldManager.cells[x][y].isEnterable()
              allCellChecked = false
          # 調査済みのマス
          else
            for [xPlus, yPlus] in [[-1, 0], [1, 0], [0, -1], [0, 1]]
              # 調査する
              continue unless 0 <= x+xPlus < FieldManager.cells.length
              continue unless 0 <= y+yPlus < FieldManager.cells[0].length
              if FieldManager.cells[x+xPlus][y+yPlus].isEnterable() and (movableMap[x+xPlus][y+yPlus] is null or wayStack.length+1 < movableMap[x+xPlus][y+yPlus].length)
                movableMap[x+xPlus][y+yPlus] = wayStack.concat([FieldManager.cells[x+xPlus][y+yPlus]])
    # 移動可能判定
    for body, x in movableMap
      for wayStack, y in body
        if wayStack isnt null and 0 < wayStack.length <= cell.object.getMove()
          FieldManager.cells[x][y].setMovable(wayStack)
        else
          FieldManager.cells[x][y].setMovable(null)
    # 攻撃可能判定
    attackables = FieldManager.getAttackableCell cell
    for attackableCell in attackables
      attackableCell.knockout = cell

    FieldManager.drawMovable()
    FieldManager.drawKnockout()

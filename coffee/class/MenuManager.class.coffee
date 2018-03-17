class MenuManager
  @ID = 'menu'

  @SIZE_X : 1320
  @SIZE_Y : 80

  @elements =
    pickCharacter: null

  @init:(@parentElement, @posX, @posY)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: @SIZE_X
      height: @SIZE_Y
      left: @posX
      top: @posY
    })

    # 戦闘
    @battle = $('<button>').addClass('menu live left')
    .on('click', @onClickBattle.bind(@))
    .appendTo(@divObject)

    # 出撃
    @pickCharacter = $('<button>').addClass('menu performance left')
    .on('click', @onClickCharacterPick.bind(@))
    .appendTo(@divObject)

    # レベルアップ
    @turnEnd = $('<button>').addClass('menu training left')
    .on('click', @onClickLevelup.bind(@))
    .appendTo(@divObject)

    # アイテム
    @item = $('<button>').addClass('menu item left')
    .on('click', @onClickItem.bind(@))
    .appendTo(@divObject)

    # ガチャ
    @gacha = $('<button>').addClass('menu gacha left')
    .on('click', @onClickGacha.bind(@))
    .appendTo(@divObject)

    # 遊び方
    @help = $('<button>').addClass('menu help left')
    .on('click', -> window.open('./help.html'))
    .appendTo(@divObject)

    # 前進
    @walk = $('<button>').addClass('menu next_day right')
    .on('click', @onClickWalk.bind(@))
    .appendTo(@divObject)

    # ターン終了
    @turnEnd = $('<button>').addClass('menu turn_end right')
    .on('click', @onClickTurnEnd.bind(@))
    .appendTo(@divObject)

    # やりなおし
    @undo = $('<button>').addClass('menu redo right')
    .on('click', @onClickUndo.bind(@))
    .appendTo(@divObject)

    @divObject.appendTo(@parentElement)

  # 出撃
  @onClickCharacterPick:(evt)->
    return unless GameManager.isControllable()
    # 出撃できないモードなら返る
    return unless GameManager.isEnable.characterPick

    # コントロール禁止
    GameManager.changeControllable false

    # キャラクター出撃モードにする
    GameManager.resetFlags()
    GameManager.isMode.characterPick = true
    # 遷移可能
    GameManager.isEnable.characterPick = false
    GameManager.isEnable.levelup = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.turnEnd = false
    GameManager.isEnable.walk = false
    GameManager.isEnable.undo = false
    GameManager.isEnable.item = true
    GameManager.isEnable.gacha = true
    GameManager.isEnable.leftPanel = false
    GameManager.isEnable.rightPanel = false
    @reflectEnable()
    GameManager.flags.isCellObjectAnimation = false

    # コストをセット
    CostManager.updateCostNow()

    # パネル再描画
    CharacterPalletManager.draw()

    GameManager.doCharacterPick()

    true

  # 戦闘
  @onClickBattle:(evt)->
    return unless GameManager.isControllable()
    # 戦闘にできないモードなら返る
    return unless GameManager.isEnable.battle

    # コントロール禁止
    GameManager.changeControllable false

    # 戦闘モードにする
    GameManager.resetFlags()
    GameManager.isMode.battle = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.turnEnd = true
    GameManager.isEnable.walk = true
    GameManager.isEnable.undo = true
    GameManager.isEnable.leftPanel = true
    GameManager.isEnable.rightPanel = true
    GameManager.isEnable.item = true
    GameManager.isEnable.gacha = true
    @reflectEnable()
    GameManager.flags.isCellObjectAnimation = true

    GameManager.doBattle()
    true

  # ターン終了
  @onClickTurnEnd:(evt)->
    return unless GameManager.isControllable()
    # 前進できないモードなら返る
    return unless GameManager.isEnable.turnEnd

    # コントロール禁止
    GameManager.changeControllable false

    GameManager.doTurnEnd()
    true

  # レベルアップ
  @onClickLevelup:(evt)->
    return unless GameManager.isControllable()
    # 前進できないモードなら返る
    return unless GameManager.isEnable.levelup

    # コントロール禁止
    GameManager.changeControllable false

    # レベルアップモードにする
    GameManager.resetFlags()
    GameManager.isMode.levelup = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.levelup = false
    GameManager.isEnable.battle = true
    GameManager.isEnable.turnEnd = false
    GameManager.isEnable.walk = false
    GameManager.isEnable.undo = false
    GameManager.isEnable.item = true
    GameManager.isEnable.gacha = true
    GameManager.isEnable.leftPanel = false
    GameManager.isEnable.rightPanel = false
    @reflectEnable()
    GameManager.flags.isCellObjectAnimation = false

    LevelupManager.draw()

    GameManager.doLevelup()
    true

  # 前進
  @onClickWalk:(evt)->
    return unless GameManager.isControllable()
    # 前進できないモードなら返る
    return unless GameManager.isEnable.walk

    # コントロール禁止
    GameManager.changeControllable false

    GameManager.doWalk()
    true

  # 移動やりなおし
  @onClickUndo:(evt)->
    return unless GameManager.isControllable()
    # やりなおし不可能なら返る
    return if GameManager.flags.moveToCell is null
    # やりなおしできないモードなら返る
    return unless GameManager.isEnable.undo

    # コントロール禁止
    GameManager.changeControllable false

    GameManager.doUndo()
    true

  # アイテム画面へ
  @onClickItem:(evt)->
    return unless GameManager.isControllable()
    # アイテムモードにできないなら返る
    return unless GameManager.isEnable.item

    # コントロール禁止
    GameManager.changeControllable false

    # 描画
    ItemManager.repick()
    ItemManager.calcUsedItemCount()
    ItemCharacterPicker.draw()
    ItemEditor.draw()

    # アイテムモードにする
    GameManager.resetFlags()
    GameManager.isMode.item = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.turnEnd = false
    GameManager.isEnable.walk = false
    GameManager.isEnable.undo = false
    GameManager.isEnable.item = false
    GameManager.isEnable.gacha = true
    GameManager.isEnable.leftPanel = false
    GameManager.isEnable.rightPanel = false
    @reflectEnable()
    GameManager.flags.isCellObjectAnimation = false

    GameManager.doItem()
    true

  # ガチャ画面へ
  @onClickGacha:(evt)->
    return unless GameManager.isControllable()
    # ガチャモードにできないなら返る
    return unless GameManager.isEnable.gacha

    # コントロール禁止
    GameManager.changeControllable false

    # ガチャモードにする
    GameManager.resetFlags()
    GameManager.isMode.gacha = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.turnEnd = false
    GameManager.isEnable.walk = false
    GameManager.isEnable.undo = false
    GameManager.isEnable.item = true
    GameManager.isEnable.gacha = false
    GameManager.isEnable.leftPanel = false
    GameManager.isEnable.rightPanel = false
    @reflectEnable()
    GameManager.flags.isCellObjectAnimation = false

    GameManager.doGacha()
    true
  
  @reflectEnable:->
    $('button.menu').prop('disabled', false)
    $('button.menu').removeClass('hover')
    for key, isEnable of GameManager.isEnable
      $('button.'+@enableKey2class(key)).prop('disabled', !isEnable)
    for key, mode of GameManager.isMode
      $('button.'+@enableKey2class(key)).addClass('hover') if mode

  @enableKey2class:(enableKey)->
    switch enableKey
      when 'battle' then 'live'
      when 'characterPick' then 'performance'
      when 'levelup' then 'training'
      when 'turnEnd' then 'turn_end'
      when 'walk' then 'next_day'
      when 'undo' then 'redo'
      when 'item' then 'item'
      when 'gacha' then 'gacha'
      else enableKey

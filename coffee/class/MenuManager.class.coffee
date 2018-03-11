class MenuManager
  @ID = 'menu'

  @SIZE_X : 1200
  @SIZE_Y : 50

  @elements =
    pickCharacter: null

  @init:(@parentElement, @posX, @posY)->
    @divObject = $('<div>').attr('id', @ID).css({
      width: @SIZE_X
      height: @SIZE_Y
      left: @posX
      top: @posY
    })

    # 出撃
    @pickCharacter = $('<div>').html('出撃').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickCharacterPick.bind(@))
    .appendTo(@divObject)

    # 戦闘
    @battle = $('<div>').html('戦闘').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickBattle.bind(@))
    .appendTo(@divObject)

    # ターン終了
    @turnEnd = $('<div>').html('ターン終了').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickTurnEnd.bind(@))
    .appendTo(@divObject)

    # レベルアップ
    @turnEnd = $('<div>').html('レベルアップ').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickLevelup.bind(@))
    .appendTo(@divObject)

    # 前進
    @turnEnd = $('<div>').html('前進').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickWalk.bind(@))
    .appendTo(@divObject)

    # やりなおし
    @undo = $('<div>').html('移動やりなおし').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickUndo.bind(@))
    .appendTo(@divObject)

    # アイテム
    @item = $('<div>').html('アイテム').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickItem.bind(@))
    .appendTo(@divObject)

    # ガチャ
    @item = $('<div>').html('ガチャ').css({
      border: '1px solid #000000'
      width: 100
      height: 40
      "font-size": '30px'
    })
    .on('click', @onClickGacha.bind(@))
    .appendTo(@divObject)

    @divObject.appendTo(@parentElement)

  # 出撃
  @onClickCharacterPick:(evt)->
    return unless GameManager.isControllable()
    # 出撃できないモードなら返る
    return unless GameManager.isEnable.characterPick

    # キャラクター出撃モードにする
    GameManager.resetFlags()
    GameManager.isMode.characterPick = true
    # 戦闘・レベルアップに遷移可能
    GameManager.isEnable.battle = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.item = true
    GameManager.flags.isCellObjectAnimation = false
    # パネル再描画
    CharacterPalletManager.draw()


    GameManager.doCharacterPick()
    true

  # 戦闘
  @onClickBattle:(evt)->
    return unless GameManager.isControllable()
    # 戦闘にできないモードなら返る
    return unless GameManager.isEnable.battle

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
    GameManager.flags.isCellObjectAnimation = true

    GameManager.doBattle()
    true

  # ターン終了
  @onClickTurnEnd:(evt)->
    return unless GameManager.isControllable()
    # 前進できないモードなら返る
    return unless GameManager.isEnable.turnEnd

    GameManager.doTurnEnd()
    true

  # レベルアップ
  @onClickLevelup:(evt)->
    return unless GameManager.isControllable()
    # 前進できないモードなら返る
    return unless GameManager.isEnable.levelup

    # レベルアップモードにする
    GameManager.resetFlags()
    GameManager.isMode.levelup = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.item = true
    GameManager.isEnable.gacha = true
    GameManager.flags.isCellObjectAnimation = false

    GameManager.doLevelup()
    true

  # 前進
  @onClickWalk:(evt)->
    return unless GameManager.isControllable()
    # 前進できないモードなら返る
    return unless GameManager.isEnable.walk

    GameManager.doWalk()
    true

  # 移動やりなおし
  @onClickUndo:(evt)->
    return unless GameManager.isControllable()
    # やりなおし不可能なら返る
    return if GameManager.flags.moveToCell is null
    # やりなおしできないモードなら返る
    return unless GameManager.isEnable.undo

    GameManager.doUndo()
    true

  # アイテム画面へ
  @onClickItem:(evt)->
    return unless GameManager.isControllable()
    # アイテムモードにできないなら返る
    return unless GameManager.isEnable.item

    # 描画
    ItemManager.repick()
    ItemManager.calcUsedItemCount()
    ItemCharacterPicker.draw()
    ItemEditor.draw()

    # レベルアップモードにする
    GameManager.resetFlags()
    GameManager.isMode.item = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.gacha = true
    GameManager.flags.isCellObjectAnimation = false

    GameManager.doItem()
    true

  # ガチャ画面へ
  @onClickGacha:(evt)->
    return unless GameManager.isControllable()
    # ガチャモードにできないなら返る
    return unless GameManager.isEnable.gacha

    # ガチャモードにする
    GameManager.resetFlags()
    GameManager.isMode.gacha = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.item = true
    GameManager.flags.isCellObjectAnimation = false

    GameManager.doGacha()
    true
                
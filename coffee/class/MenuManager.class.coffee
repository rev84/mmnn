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

    @divObject.appendTo(@parentElement)

  # 出撃
  @onClickCharacterPick:(evt)->
    return unless GameManager.isControllable()

    GameManager.doCharacterPick()
    true

  # 戦闘
  @onClickBattle:(evt)->
    return unless GameManager.isControllable()

    GameManager.doBattle()
    true

  # ターン終了
  @onClickTurnEnd:(evt)->
    return unless GameManager.isControllable()

    GameManager.doTurnEnd()
    true

  # レベルアップ
  @onClickLevelup:(evt)->
    return unless GameManager.isControllable()

    GameManager.doLevelup()
    true
    
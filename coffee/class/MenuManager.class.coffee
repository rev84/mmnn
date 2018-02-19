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

    @divObject.appendTo(@parentElement)

  # 出撃
  @onClickCharacterPick:(evt)->
    return unless GameManager.isControllable()

    GameManager.doCharacterPick()

  # 出撃
  @onClickBattle:(evt)->
    return unless GameManager.isControllable()

    GameManager.doBattle()
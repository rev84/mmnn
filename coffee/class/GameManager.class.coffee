class GameManager
  @ID = 'game'

  @contorollable = false
  @mousePos = {x:0, y:0}
  @gameElement = null
  @characters = []
  @initialized = 
    characters:false
    field:false
    menu:false
  @flags = 
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
    # 現在、キャラクター出撃モードであるか
    isBattle : false

  # アニメーション関係
  @POSITION =
    BATTLE:
      menu:[0,0]
      character_pallet:null
      field:[0,50]
    CHARACTER_PICK:
      menu:[0,0]
      character_pallet:[0,50]
      field:[400,50]
  @ANIMATION_MSEC = 500

  @onMouseMiddleDown:(evt)->
    return true unless @isControllable()
    true

  @onMouseMiddleUp:(evt)->
    return true unless @isControllable()
    true

  @onMouseRightDown:(evt)->
    return true unless @isControllable()
    true

  @onMouseRightUp:(evt)->
    return true unless @isControllable()
    true

  @onMouseLeftDown:(evt)->
    return true unless @isControllable()
    true

  @onMouseLeftUp:(evt)->
    return true unless @isControllable()
    console.log('game mouseup')
    # 出撃選択を解除
    if @flags.pickedCharacterObject isnt null
      @flags.pickedCharacterObject = null
    if @flags.pickedCharacterElement isnt null
      @flags.pickedCharacterElement.remove()
      @flags.pickedCharacterElement = null
    true

  @onMouseLeave:(evt)->
    return true unless @isControllable()
    true

  @onMouseMove:(evt)->
    return true unless @isControllable()
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
      false
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

    @initCharacters(null)
    @initField(null)
    @initMenu(null)

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

      @characters[characterId] = new window[className](params)
    for characterId, characterObject of @characters
      CharacterPalletManager.addCharacter(characterObject)
    CharacterPalletManager.show()

  @isControllable:->
    @controllable

  @changeControllable:(bool)->
    @controllable = !!bool

  @switchTempAll:->
    $.each @cells, ->
      $.each @, ->
        @switchTemp()
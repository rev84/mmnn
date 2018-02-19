class Cell
  @SIZE_X : 100
  @SIZE_Y : 100
  # キャラ出撃で置けるxIndex
  @PUT_FIELD_MAX_X = 1

  constructor:(@parentElement, @xIndex, @yIndex, borderSize)->
    @elements =
      mother:null
      collision:null
      base:null
      object:null
      attackable:null
    @object = null
    @tempObject = null

    @initElements(borderSize)

  onMouseMiddleUp:(evt)->
    return unless GameManager.isControllable()
    true

  onMouseRightUp:(evt)->
    return unless GameManager.isControllable()
    true

  onMouseLeftUp:(evt)->
    return unless GameManager.isControllable()

    # キャラを仮置きするトライ
    @tryCharacterPut(evt)
    # キャラを移動させるトライ
    @tryMovePick(evt)

  onMouseLeftDown:(evt)->
    return unless GameManager.isControllable()
    # 仮置きがあった場合はつかむ
    if @tempObject isnt null
      CharacterPalletManager.pickCharacter @tempObject
      @tempObject = null

  onMouseMiddleDown:(evt)->
    return unless GameManager.isControllable()

  onMouseRightDown:(evt)->
    return unless GameManager.isControllable()
    true

  onMouseMove:(evt)->
    return unless GameManager.isControllable()
    true

  onMouseLeave:(evt)->
    return unless GameManager.isControllable()
    true

  setTempObject:(object)->
    # 仮置きに置く
    @tempObject = object
    # 出撃中にする
    object.setInField(true)
    # マスの再描画
    @draw()

  setObject:(object)->
    @object = object
    @tempObject = null
    @draw()

  switchTemp:->
    if @tempObject isnt null
      @object = @tempObject
      @tempObject = null
      @draw()

  initElements:(borderSize)->
    @elements.mother = $('<div>').addClass('cell cell_mother').css({
      left: @xIndex * @constructor.SIZE_X + borderSize * (@xIndex + 1)
      top : @yIndex * @constructor.SIZE_Y + borderSize * (@yIndex + 1)
      width:@constructor.SIZE_X
      height:@constructor.SIZE_Y
    })

    cssPos = 
      left:0
      top:0
    cssSize = 
      width:@constructor.SIZE_X
      height:@constructor.SIZE_Y
    @elements.collision  = $('<div>').addClass('cell cell_collision')
                           .css(cssPos).css(cssSize)
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
                           .appendTo(@elements.mother)
    @elements.collision.get(0).addEventListener("mouseup", @onMouseLeftUp.bind(@), false)
    @elements.base       = $('<img>').addClass('cell cell_base')
                           .css(cssPos).css(cssSize)
                           .appendTo(@elements.mother)
    @elements.object     = $('<img>').addClass('cell cell_object')
                           .css(cssPos).css(cssSize)
                           .appendTo(@elements.mother)
    @elements.attackable = $('<img>').addClass('cell cell_attackable')
                           .css(cssPos)
                           .appendTo(@elements.mother)

    $(@elements.mother).appendTo(@parentElement)

  # 背景画像の変更
  changeBase:(imagePath)->
    @elements.base.attr('src', imagePath)

  # 描画
  draw:->
    if @object isnt null
      @elements.object.attr('src', @object.getBaseImage()).removeClass('no_display')
    else if @tempObject isnt null
      @elements.object.attr('src', @tempObject.getBaseImage()).removeClass('no_display')
    else
      @elements.object.addClass('no_display')

  isDroppableCharacter:->
    @xIndex <= @constructor.PUT_FIELD_MAX_X and @object is null

  # 進入可能か
  isEnterable:->
    @object is null

  tryCharacterPut:(evt)->
    return if GameManager.flags.pickedCharacterObject is null and GameManager.flags.pickedCharacterElement is null

    # キャラクター出撃モードで、キャラクターがピックされている場合
    if GameManager.flags.pickedCharacterObject isnt null and @isDroppableCharacter()
      # ここに置いてあった仮キャラを全削除
      FieldManager.removeAllTempObject @tempObject
      # このセルに仮キャラを配置する
      @setTempObject GameManager.flags.pickedCharacterObject
    # 出撃選択を解除
    GameManager.flags.pickedCharacterObject = null
    if GameManager.flags.pickedCharacterElement isnt null
      GameManager.flags.pickedCharacterElement.remove()
      GameManager.flags.pickedCharacterElement = null
    CharacterPalletManager.redraw()

  tryMovePick:(evt)->
    # 戦闘モード時のみ
    return unless GameManager.flags.isBattle
    # 既に移動させたいキャラを選んでいる場合はダメ
    return if GameManager.flags.movePickCell isnt null
    # キャラクターが置かれている場合のみ
    return unless @object.isCharacterObject()
    # 行動済みでない場合のみ
    return if @object.isMoved()

    GameManager.movePick @

  viewMovable:->
    @elements.base.css({
      'background-color': '#ff0000'
    })
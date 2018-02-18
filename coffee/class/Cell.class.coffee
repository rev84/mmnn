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

    @initElements(borderSize)

  onMouseUp:(evt)->
    console.log('cell mouseup')
    # キャラクター出撃モードで、キャラクターがピックされている場合
    if GameManager.flags.pickedCharacterObject isnt null and @isDroppableCharacter()
      # キャラを出撃中にする
      GameManager.flags.pickedCharacterObject.setInField(true)
      # このセルにキャラを配置する
      @setObject GameManager.flags.pickedCharacterObject
    # 出撃選択を解除
    GameManager.flags.pickedCharacterObject = null
    if GameManager.flags.pickedCharacterElement isnt null
      GameManager.flags.pickedCharacterElement.remove()
      GameManager.flags.pickedCharacterElement = null
    CharacterPalletManager.redraw()
  onMouseDown:(evt)->
  onMouseMove:(evt)->
  onMouseLeave:(evt)->

  setObject:(object)->
    @object = object
    @draw()

  initElements:(borderSize)->
    @elements.mother     = $('<div>').addClass('cell cell_mother').css({
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
                           .appendTo(@elements.mother).css(cssPos).css(cssSize)
                           .on('mousemove', @onMouseMove.bind(@))
                           .on('mouseup', @onMouseUp.bind(@))
                           .on('mousedown', @onMouseDown.bind(@))
                           .on('mouseleave', @onMouseLeave.bind(@))
    @elements.base       = $('<img>').addClass('cell cell_base')
                           .appendTo(@elements.mother).css(cssPos).css(cssSize)
    @elements.object     = $('<img>').addClass('cell cell_object')
                           .appendTo(@elements.mother).css(cssPos).css(cssSize)
    @elements.attackable = $('<img>').addClass('cell cell_attackable')
                           .appendTo(@elements.mother).css(cssPos)

    $(@elements.mother).appendTo(@parentElement)

  # 背景画像の変更
  changeBase:(imagePath)->
    @elements.base.attr('src', imagePath)

  # 描画
  draw:->
    if @object isnt null
      @elements.object.attr('src', @object.getBaseImage())

  isDroppableCharacter:->
    @xIndex <= @constructor.PUT_FIELD_MAX_X and @object is null
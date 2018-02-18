class Cell
  @SIZE_X : 100
  @SIZE_Y : 100

  constructor:(@parentElement, @xIndex, @yIndex, borderSize)->
    @elements =
      mother:null
      collision:null
      base:null
      object:null
      attackable:null

    @initElements(borderSize)

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

  # 

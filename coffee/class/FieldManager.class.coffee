class FieldManager
  @ID = 'field'

  @CELL_X = 10
  @CELL_Y = 6
  @BORDER_SIZE = 1

  @divObject = null
  @cells = []
  @nextField = []

  @init:(@parentElement, @posX, @posY)->
    @divObject = $('<div>').attr('id', @ID).css({
      top: @posY
      left: @posX
      width: @CELL_X * Cell.SIZE_X + @BORDER_SIZE * (@CELL_X + 1)
      height: @CELL_Y * Cell.SIZE_Y + @BORDER_SIZE * (@CELL_Y + 1)
      "background-color" : '#000000'
    }).appendTo(@parentElement)
 
    # フィールド初期化
    @cells = []
    for x in [0...@CELL_X]
      @cells[x] = []
      for y in [0...@CELL_Y]
        @cells[x][y] = new Cell(@divObject, x, y, @BORDER_SIZE)

    # 次の列
    @nextField = []
    for y in [0...@CELL_Y]
      @nextField[y] = null

  @generateNextField:->

    
  @show:->
    $(@divObject).removeClass('no_display')

  @hide:->
    $(@divObject).addClass('no_display')
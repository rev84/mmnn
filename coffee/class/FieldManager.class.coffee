class FieldManager
  @isInit = false
  @field = null
  @nextField = null
  @cellRate = null
  @divObject = null

  @init:->
    return if @isInit
    @isInit = true

    @divObject = $('<div>')
 
    # フィールド初期化
    @field = []
    for x in [0...Const.FIELD.SIZE.X]
      @field[x] = []
      for y in [0...Const.FIELD.SIZE.Y]
        @field[x][y] = null

    # 次の列
    @nextField = []
    for y in [0...Const.FIELD.SIZE.Y]
      @field[y] = null

  @generateNextField:->


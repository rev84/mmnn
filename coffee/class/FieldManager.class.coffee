class FieldManager
  @ID = 'field'

  @CELL_X = 18
  @CELL_Y = 8
  @BORDER_SIZE = 1
  # キャラが移動する時のmsec/マス
  @MOVE_SPEED = 200

  @divObject = null
  @cells = []
  @nextField = []
  @cellAnimationTimer = false

  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).css({
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

    # アニメーションスタート
    @startCellAnimation()

  @generateNextField:->

  # このキャラオブジェクトに該当する仮置きを全削除
  @removeAllTempObject:(characterObject)->
    return if characterObject is null
    $.each @cells, ->
      $.each @, ->
        if @tempObject isnt null and @tempObject.isCharacterObject() and @tempObject.getId() is characterObject.getId()
          # 出撃中を解除
          @tempObject.setInField false
          # 仮オブジェクトを削除
          @tempObject = null
          # セルの再描画
          @draw()
    
  @removeAllWayStack:->
    $.each @cells, ->
      $.each @, ->
        @wayStack = null    

  @removeAllKnockout:->
    $.each @cells, ->
      $.each @, ->
        @knockout = null    

  @resetAllMoved:->
    $.each @cells, ->
      $.each @, ->
        if @object isnt null and (@object.isCharacterObject() or @object.isEnemyObject())
          @object.setMoved false


  @drawMovable:->
    $.each @cells, ->
      $.each @, ->
        @drawMovable()

  @drawKnockout:->
    $.each @cells, ->
      $.each @, ->
        @drawKnockout()

  @drawFin:->
    $.each @cells, ->
      $.each @, ->
        @drawFin()

  @show:->
    $(@divObject).removeClass('no_display')

  @hide:->
    $(@divObject).addClass('no_display')

  @startCellAnimation:=>
    @stopObjectAnimation()
    @cellAnimationTimer = setInterval =>
      return unless GameManager.flags.isCellObjectAnimation
      $.each @cells, ->
        $.each @, ->
          @stepObjectAnimation()
    , Cell.OBJECT_ANIMATION_MSEC
  @stopObjectAnimation:=>
    clearInterval @cellAnimationTimer if @cellAnimationTimer isnt false
    

  @moveObject:(startCell, endCell, callback = null)->
    GameManager.changeControllable false

    # 移動しないのですぐコールバック
    if startCell is endCell
      if callback instanceof Function
        callback()
      return

    wayStack = endCell.wayStack

    # 全wayStack削除、再描画
    @removeAllWayStack()
    @removeAllKnockout()
    @drawMovable()
    @drawKnockout()

    charaObject = startCell.object

    showHide = (prev, next)->
      prev.setObject null
      next.setObject charaObject
      prev.draw()
      next.draw()

    prevCell = startCell
    for targetCell, index in wayStack
      setTimeout showHide.bind(null, prevCell, targetCell), @MOVE_SPEED*(index+1)
      prevCell = targetCell

    setTimeout =>
      GameManager.flags.movePickCell = null
      GameManager.flags.moveToCell = [startCell, endCell]
      
      # 攻撃できるセル
      attackables = @getAttackableCellsByCell endCell
      # 攻撃できるセルがないなら終了
      if attackables.length is 0
        GameManager.flags.waitAttackCell = null
        endCell.object.setMoved true
      # あるなら攻撃選択待ちに
      else
        GameManager.flags.waitAttackCell = endCell
        for attackableCell in attackables
          attackableCell.knockout = endCell
        FieldManager.drawKnockout()
      # 移動選択を解除
      GameManager.flags.movePickCell = null
      endCell.draw()

      callback() if callback instanceof Function

    , @MOVE_SPEED*(wayStack.length+1)
    true

  # 指定したセルにいるオブジェクトから攻撃することができるセルを返す
  @getAttackableCellsByCell:(cell)->
    @getAttackableCells cell.object, cell.xIndex, cell.yIndex

  @getAttackableCells:(object, x, y)->
    targetType = 
      # 何もない
      if object is null
        []
      # キャラクター
      else if object.isCharacterObject()
        [ObjectBase.OBJECT_TYPE.ENEMY]
      # 敵キャラクター 
      else if object.isEnemyObject()
        [ObjectBase.OBJECT_TYPE.CHARACTER]
      else
        []

    # 対象のタイプがないんじゃ攻撃対象もない
    return [] if targetType.length <= 0

    res = []
    for body, xIndex in @cells
      for targetCell, yIndex in body
        dist = Math.abs(x - targetCell.xIndex) + Math.abs(y - targetCell.yIndex)
        # 攻撃可能
        if dist <= object.getRange()
          # ターゲットである
          if targetCell.object isnt null and Utl.inArray(targetCell.object.getObjectType(), targetType)
            res.push targetCell
    res

  @getMovableMap:(cell)->
    movableMap = Utl.array2dFill(@CELL_X, @CELL_Y, null)
    movableMap[cell.xIndex][cell.yIndex] = []

    while !allCellChecked
      #Utl.dumpNumArray2d movableMap
      allCellChecked = true
      for body, x in movableMap
        for wayStack, y in body
          # まだ未調査のマス
          if wayStack is null
            # 進入不可でないなら、未調査であっては終われない
            if @cells[x][y].isEnterable()
              allCellChecked = false
          # 調査済みのマス
          else
            for [xPlus, yPlus] in [[-1, 0], [1, 0], [0, -1], [0, 1]]
              # 調査する
              continue unless 0 <= x+xPlus < @cells.length
              continue unless 0 <= y+yPlus < @cells[0].length
              if FieldManager.cells[x+xPlus][y+yPlus].isEnterable() and (movableMap[x+xPlus][y+yPlus] is null or wayStack.length+1 < movableMap[x+xPlus][y+yPlus].length)
                movableMap[x+xPlus][y+yPlus] = wayStack.concat([@cells[x+xPlus][y+yPlus]])
    movableMap
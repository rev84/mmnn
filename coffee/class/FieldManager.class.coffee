class FieldManager
  @ID = 'field'

  @CELL_X = 10
  @CELL_Y = 6
  @BORDER_SIZE = 1
  # キャラが移動する時のmsec/マス
  @MOVE_SPEED = 200

  @divObject = null
  @cells = []
  @nextField = []
  @cellAnimationTimer = false

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

    # アニメーションスタート
    @startCellAnimation()

  @generateNextField:->

  # このキャラオブジェクトに該当する仮置きを全削除
  @removeAllTempObject:(characterObject)->
    return if characterObject is null
    $.each @cells, ->
      $.each @, ->
        if @tempObject isnt null and @tempObject.isCharacterObject() and @tempObject.getCharacterId() is characterObject.getCharacterId()
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

  @drawMovable:->
    $.each @cells, ->
      $.each @, ->
        @drawMovable()

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
    

  @moveObject:(startCell, endCell)->
    GameManager.changeControllable false

    wayStack = endCell.wayStack

    # 全wayStack削除、再描画
    @removeAllWayStack()
    @drawMovable()

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
      attackables = @getAttackableCell endCell
      # 攻撃できるセルがあるなら攻撃待ち
      if attackables.length is 0
        GameManager.flags.waitAttackCell = null
        endCell.object.setMoved true
      else
        GameManager.flags.waitAttackCell = [endCell, attackables]
      endCell.draw()

      GameManager.changeControllable true
    , @MOVE_SPEED*(wayStack.length+1)

  # 指定したセルにいるオブジェクトから攻撃することができるセルを返す
  @getAttackableCell:(cell)->
    targetType = 
      # 何もない
      if cell.object is null
        []
      # キャラクター
      else if cell.object.isCharacterObject()
        [ObjectBase.OBJECT_TYPE.ENEMY]
      # 敵キャラクター 
      else if cell.object.isEnemyObject()
        [ObjectBase.OBJECT_TYPE.CHARACTER]

    # 対象のタイプがないんじゃ攻撃対象もない
    return [] if targetType.length <= 0

    res = []
    for body, xIndex in @cells
      for targetCell, yIndex in body
        dist = Math.abs(cell.xIndex - targetCell.xIndex) + Math.abs(cell.yIndex - targetCell.yIndex)
        # 攻撃可能
        if 0 < cell.object.getRange() <= dist
          # ターゲットである
          if targetCell.object isnt null and Utl.inArray(targetCell.object.getObjectType(), targetType)
            res.push targetCell
    res
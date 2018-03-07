class FieldManager
  @ID = 'field'

  @CELL_X = 18
  @CELL_Y = 8
  @BORDER_SIZE = 1
  # キャラが移動する時のmsec/マス
  @MOVE_SPEED = 50
  # 敵が湧くのは右から何マスか
  @ENEMY_APPEAR_WIDTH = 5

  @divObject = null
  @cells = []
  @cellAnimationTimer = false

  @init:(@parentElement)->
    @SIZE_X = @CELL_X * Cell.SIZE_X + @BORDER_SIZE * (@CELL_X + 1)
    @SIZE_Y = @CELL_Y * Cell.SIZE_Y + @BORDER_SIZE * (@CELL_Y + 1) + 50

    # 見える領域を制限するためにしかたなく置いた親エレメント
    @visibleObject = $('<div>').attr('id', 'field_visible').css({
      width: @CELL_X * Cell.SIZE_X + @BORDER_SIZE * (@CELL_X + 1)
      height: @CELL_Y * Cell.SIZE_Y + @BORDER_SIZE * (@CELL_Y + 1) + 50
    }).appendTo(@parentElement)

    @divObject = $('<div>').attr('id', @ID).css({
      width: @CELL_X * Cell.SIZE_X + @BORDER_SIZE * (@CELL_X + 1)
      height: @CELL_Y * Cell.SIZE_Y + @BORDER_SIZE * (@CELL_Y + 1)
    }).appendTo(@visibleObject)
    
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
        true


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
    

  @moveObject:(startCell, endCell)=>
    GameManager.changeControllable false

    # 移動しないのですぐ返る
    return if startCell is endCell

    wayStack = endCell.wayStack

    # 全wayStack削除、再描画
    @removeAllWayStack()
    @removeAllKnockout()
    @drawMovable()
    @drawKnockout()

    charaObject = startCell.object

    finish = (startCell, endCell)=>
      GameManager.flags.movePickCell = null
      GameManager.flags.moveToCell = [startCell, endCell]
      
      # 攻撃できるセル
      attackables = @getAttackableCellsByCell endCell
      # 攻撃できるセルがないなら終了
      if attackables.length is 0
        GameManager.flags.waitAttackCell = null
        if endCell.object is null
          console.log endCell
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

    prevCell = startCell
    while wayStack.length > 0
      nextCell = wayStack.shift()
      prevCell.setObject null
      nextCell.setObject charaObject
      prevCell.draw()
      nextCell.draw()
      await Utl.sleep @MOVE_SPEED
      prevCell = nextCell

    finish(startCell, endCell)

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

    # セルの数以上の移動距離はありえないので上限を設定
    loopCount = 0
    while !allCellChecked and (loopCount <= @CELL_X * @CELL_Y)
      loopCount++
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

  @randomEnemyAppear:->
    # 一時的にアニメーションしないようにする
    GameManager.flags.isCellObjectAnimation = false

    enemyAmount = Utl.gacha [
      [0, 10]
      [1, 20]
      [2, 50]
      [3, 20]
      [4, 20]
      [5, 10]
      [6, 10]
    ]

    putEnemy = (enemyObject)=>
      return false if enemyObject is null
      # 空いてるセルを探す
      emptyCells = []
      for x in [@cells.length-@ENEMY_APPEAR_WIDTH...@cells.length]
        for cell in @cells[x]
          if cell.object is null
            emptyCells.push cell
      return false if emptyCells.length <= 0

      targetCell = Utl.shuffle(emptyCells).pop()
      targetCell.setObject enemyObject
      targetCell

    targetCells = []
    for cnt in [0...enemyAmount]
      c = putEnemy GameManager.getEnemyObject()
      targetCells.push c if c isnt false

    # 敵が出たならアニメーション待ち
    if targetCells.length > 0
      for cnt in [0...5]
        $.each targetCells, ->
          @hideObject()
        await Utl.sleep(50)
        $.each targetCells, ->
          @showObject()
        await Utl.sleep(50)

    # アニメーション復活
    Utl.sleep(100)
    GameManager.flags.isCellObjectAnimation = true

    true

  # 全キャラを見ていって、やられていたら台詞を言わせながら戻す
  @checkDeath:=>
    noExistDeath = true
    for body in @cells
      for c in body
        # 死んでる
        if c.object isnt null and c.object.getHp() <= 0
          # 死んでるのがキャラクターなら
          if c.object.isCharacterObject()
            await c.showPopover c.object.getTextOnDeath(), 2000
            # 復帰待ちにする
            c.object.death()
          # 死んでるのが敵キャラなら
          else if c.object.isEnemyObject()
            # 敵が死んだなら経験値加算
            EnvManager.increaseExp c.object.getExp()
          # オブジェクト消す
          c.object = null
          # 再描画
          c.draw()
          # 別のキャラを走査
          @checkDeath()


  # 次の列を生成する
  @generateNextField:->
    GACHA_ORDER = [
      ['ENEMY', 100]  # ランダムな敵
      ['EMPTY', 100]  # 空っぽ
    ]

    nextField = []
    for yIndex in [0...@CELL_Y]
      cell = new Cell(@divObject, @CELL_X, yIndex, @BORDER_SIZE)
      switch Utl.gacha GACHA_ORDER
        when 'ENEMY'
          cell.object = GameManager.getEnemyObject(EnvManager.getFloor()+1)
        when 'EMPTY'
          ;
      nextField.push cell
      cell.draw()
    nextField

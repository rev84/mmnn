class GameManager
  @DEBUG_CONFIG = 
    # 右クリックでメニューをでなくする
    DISABLE_RIGHT_CLICK_MENU : false

  @ID:'game'

  @mousePos = {x:0, y:0}
  @gameElement = null
  @characters = []
  @initialized = 
    characters:false
    field:false
    menu:false
    enemys:false
    levelup:false
  @flags = 
    # 操作可能か
    controllable : true
    # セルのオブジェクトのアニメーションを有効にするか
    isCellObjectAnimation : true
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
    # 現在、戦闘モードであるか
    isBattle : false
    # 戦闘モードでキャラクターを動かしている場合、現在対象になっているセル
    movePickCell : null
    # 「元に戻す」で戻れるセルのオブジェクト
    # [0]元のセル [1]移動先のセル
    moveToCell : null
    # 戦闘モードで攻撃待ちの場合、現在対象になっているセル
    waitAttackCell : null
    # 戦闘モードでターン終了していい状態であるか
    isEnableTurnEnd : true
    # レベルアップに遷移していい状態であるか
    isEnableLevelup : true

  # アニメーション関係
  @POSITION =
    BATTLE:
      menu:[0,0]
      character_pallet:null
      field:[0,50]
      left_info:[200,700]
      right_info:[600,700]
      field_life:[0, 700]
      levelup:null
    CHARACTER_PICK:
      menu:[0,0]
      character_pallet:[160,50]
      field:[0,50]
      left_info:null
      right_info:null
      field_life:null
      levelup:null
    LEVELUP:
      menu:[0,0]
      character_pallet:null
      field:[0,50]
      left_info:null
      right_info:null
      field_life:null
      levelup:[0,50]
  @ANIMATION_MSEC = 500

  @onMouseMiddleDown:(evt)->
    return unless @isControllable()
    true

  @onMouseMiddleUp:(evt)->
    return unless @isControllable()
    true

  @onMouseRightDown:(evt)->
    return unless @isControllable()
    true

  @onMouseRightUp:(evt)->
    return unless @isControllable()
    true

  @onMouseLeftDown:(evt)->
    return unless @isControllable()
    true

  @onMouseLeftUp:(evt)->
    return unless @isControllable()
    console.log('game mouseup')
    # 出撃選択を解除
    if @flags.pickedCharacterObject isnt null
      @flags.pickedCharacterObject = null
    if @flags.pickedCharacterElement isnt null
      @flags.pickedCharacterElement.remove()
      @flags.pickedCharacterElement = null
    true

  @onMouseLeave:(evt)->
    return unless @isControllable()
    true

  @onMouseMove:(evt)->
    return unless @isControllable()
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
    @switchTempAll()

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
    @switchTempAll()

    # 戦闘モードを切る
    @flags.isBattle = false
    
  # ターン終了
  @doTurnEnd:(isSoon = false)->
    # ターン終了可能な状態ではない
    return unless @flags.isEnableTurnEnd
    @enemyMove()    

  # レベルアップ
  @doLevelup:(isSoon = false)->
    # ターン終了可能な状態ではない
    return unless @flags.isEnableLevelup
     
    @partsAnimation @POSITION.LEVELUP, isSoon

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
      !GameManager.DEBUG_CONFIG.DISABLE_RIGHT_CLICK_MENU

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

    @initField(null)
    @initExp(null)
    @initLife(null)
    @initMenu(null)
    @initPanels(null)
    @initCharacters(null)
    @initLevelup(null)
    @initEnemys(null)

    @gameElement.appendTo('body')

    @doBattle(true)

  @initMenu:(savedata)->
    return if @initialized.menu
    @initialized.menu = true

    MenuManager.init(@gameElement)

  @initField:(savedata)->
    return if @initialized.field
    @initialized.field = true

    FieldManager.init(@gameElement)

  @initExp:(savedata)->
    return if @initialized.exp
    @initialized.exp = true

    ExpManager.init(@gameElement)

  @initLife:(savedata)->
    return if @initialized.life
    @initialized.life = true

    FieldLifeManager.init(@gameElement, 5)

  @initPanels:(savedata)->
    return if @initialized.panels
    @initialized.panels = true

    LeftInfoManager.init(@gameElement)
    RightInfoManager.init(@gameElement)

  @initLevelup:(savedata)->
    return if @initialized.levelup
    @initialized.levelup = true

    LevelupManager.init(@gameElement)
    for characterId, characterObject of @characters
      LevelupManager.addCharacter(characterObject)


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
          moved: false

      @characters[characterId] = new window.CharacterList[characterId](params)
    for characterId, characterObject of @characters
      CharacterPalletManager.addCharacter(characterObject)
    CharacterPalletManager.show()

  # キャラ初期化
  @initEnemys:(savedata)->
    return if @initialized.enemys
    @initialized.enemys = true

    #### デバッグ
    FieldManager.cells[5][5].object = new Keruberosu({
      level : 1
      hp : null
      inField : false
      moved: false      
    })

  @isControllable:->
    @flags.controllable

  @changeControllable:(bool)->
    @flags.controllable = !!bool

  @switchTempAll:->
    $.each FieldManager.cells, ->
      $.each @, ->
        @switchTemp()

  @movePick:(cell)->
    FieldManager.removeAllWayStack()
    FieldManager.removeAllKnockout()

    # 移動可能モード
    @flags.movePickCell = cell
    # 攻撃可能モード
    @flags.waitAttackCell = cell

    movableMap = FieldManager.getMovableMap(cell)

    # 移動可能判定
    for body, x in movableMap
      for wayStack, y in body
        if wayStack isnt null and 0 < wayStack.length <= cell.object.getMove()
          FieldManager.cells[x][y].setWayStack(wayStack)
        else
          FieldManager.cells[x][y].setWayStack(null)
    # 攻撃可能判定
    attackables = FieldManager.getAttackableCellsByCell cell
    for attackableCell in attackables
      attackableCell.knockout = cell

    FieldManager.drawMovable()
    FieldManager.drawKnockout()

  # 敵が行動する
  @enemyMove:->
    @changeControllable false

    # 戻すは不可能になる
    @flags.moveToCell = null
    # 全マスのwayStack解除
    FieldManager.removeAllWayStack()
    # 全マスの移動可能表示解除
    FieldManager.removeAllKnockout()
    # 全マスの再描画
    FieldManager.drawMovable()
    FieldManager.drawKnockout()

    # 終了時の処理
    ending = =>
      FieldManager.resetAllMoved()
      FieldManager.drawMovable()
      FieldManager.drawKnockout()
      FieldManager.drawFin()
      # 移動・攻撃・戻るモードを解除
      @flags.movePickCell = null
      @flags.moveToCell = null
      @flags.waitAttackCell = null
      @changeControllable true

    # 全マスから未行動の敵を探す
    enemyCell = null
    for y in [0...FieldManager.cells[0].length]
      for x in [0...FieldManager.cells.length]
        c = FieldManager.cells[x][y]
        # 未行動の敵
        if c.object isnt null and c.object.isEnemyObject() and !c.object.isMoved()
          enemyCell = FieldManager.cells[x][y]
          break

    # 行動してない敵はいなかった
    if enemyCell is null
      return ending()

    ####################################################################
    # 全行動表
    # 
    # [0]評価構造体
    #   [life] 減らせるライフ
    #   [beatLevel]倒せるレベル
    #   [beatPossibility]倒せる可能性
    #   [damage]ダメージ量
    #   [xMove]移動後のx座標
    #   [moveAmount]移動距離
    # [1]移動先のセル
    # [2]攻撃対象(-1:自爆してフィールドライフを減らす)
    # 
    # ★優先度
    # ライフ減らせる＞
    # 確実に倒せる味方を倒せる（レベル高い順）＞
    # 倒せる可能性の高い味方を攻撃する（可能性順）＞
    # 与えるダメージが大きい味方に攻撃する（最高ダメージ順）＞
    # なるべく端に近づく（近い順）＞
    # 移動距離が少ない
    ####################################################################
    getAct = (params)->
      rtn = {
        life: 0
        beatLevel: 0
        beatPossibility: -Infinity
        damage: 0
        xMove: +Infinity
        moveAmount:+Infinity
      }
      rtn.life = params.life if 'life' of params
      rtn.beatLevel = params.beatLevel if 'beatLevel' of params
      rtn.beatPossibility = params.beatPossibility if 'beatPossibility' of params
      rtn.damage = params.damage if 'damage' of params
      rtn.xMove = params.xMove if 'xMove' of params
      rtn.moveAmount = params.moveAmount if 'moveAmount' of params
      rtn
    acts = []
    # 移動できる場所
    movableMap = FieldManager.getMovableMap enemyCell
    # 攻撃側の攻撃タイプ
    myAttackType = enemyCell.object.getAttackType()
    # 攻撃側の攻撃力
    myAttack = enemyCell.object.getAttack()
    # すべての位置で攻撃可能な分岐をおこない、点数化する
    `actsearch://`
    for mBody, xMove in movableMap
      for wayStack, yMove in mBody
        # 行けないので飛ばす
        continue unless wayStack isnt null and 0 <= wayStack.length <= enemyCell.object.getMove()
        # 行き先のセル
        moveToCell = FieldManager.cells[xMove][yMove]
        # 行き先にwayStackをセットしちゃう
        moveToCell.setWayStack wayStack

        # 端っこに到達して、なおまだ移動力がある場合
        if xMove is 0 and (enemyCell.object.getMove() - wayStack.length) > 0
          # 突っ込む
          acts.push [getAct({life: 1, moveAmount: wayStack.length}), moveToCell, -1]
          #`break actsearch`

        # ここでじっとするプランをまず入れる
        acts.push [getAct({xMove:xMove, moveAmount: wayStack.length}), moveToCell, null]
        # 攻撃可能な相手
        attackables = FieldManager.getAttackableCells enemyCell.object, xMove, yMove
        for atkCell in attackables
          atkObj = atkCell.object
          # 防御側の防御力
          def = if myAttackType is ObjectBase.ATTACK_TYPE.PHYSIC then atkObj.getPDef() else atkObj.getMDef()
          # 防御側のHP
          hp = atkObj.getHp()

          # 防御側のレベル
          level = atkObj.getLevel()
          # 倒せる確率
          beatPossibility = ObjectBase.getKnockoutRate(hp, myAttack, def)
          # 与えられる最高ダメージ
          damage = ObjectBase.getDamageMax(myAttack, def)

          beatLevel = 
            if beatPossibility is +Infinity
              level
            else
              0
          acts.push [getAct({
            beatLevel:beatLevel
            beatPossibility:beatPossibility
            damage:damage
            xMove:xMove
            moveAmount: wayStack.length
          }), moveToCell, atkCell]
    # 点数順にソートする
    acts.sort (aAry, bAry)->
      a = aAry[0]
      b = bAry[0]
      return -1 if a.life > b.life
      return  1 if a.life < b.life
      return -1 if a.beatLevel > b.beatLevel
      return  1 if a.beatLevel < b.beatLevel
      return -1 if a.beatPossibility > b.beatPossibility
      return  1 if a.beatPossibility < b.beatPossibility
      return -1 if a.damage > b.damage
      return  1 if a.damage < b.damage
      return -1 if a.xMove < b.xMove
      return  1 if a.xMove > b.xMove
      return -1 if a.moveAmount < b.moveAmount
      return  1 if a.moveAmount > b.moveAmount
      0
    # 最高評価のものをおこなう
    [_, moveToCell, atkCell] = acts[0]

    # 移動
    FieldManager.moveObject enemyCell, moveToCell, =>
      # 攻撃しない
      if atkCell is null
        setTimeout @enemyMove.bind(@), 1
      # 自爆する
      else if atkCell is -1
        @terror(moveToCell, @enemyMove.bind(@))
      # 攻撃する
      else
        @attack(moveToCell, atkCell, @enemyMove.bind(@))
    true

  @attack:(attackerCell, defenderCell, callback = null)->
    # それぞれのオブジェクト
    attacker = attackerCell.object
    defender = defenderCell.object

    # パネル用
    leftObject = if attacker.isCharacterObject() then attacker else defender
    rightObject = if attacker.isCharacterObject() then defender else attacker
    # 左に味方の情報
    LeftInfoManager.setObject leftObject
    # 右に敵の情報
    RightInfoManager.setObject rightObject

    # ターゲットマークを点滅させる
    defenderCell.startAnimation './img/target.png', 0, 100
    defenderCell.startAnimation './img/target.png', 200, 300
    defenderCell.startAnimation './img/target.png', 400, 500

    # 攻撃エフェクト
    defenderCell.startAnimation './img/damage.png', 550, 1750

    setTimeout ->
      # 攻撃側の攻撃タイプ
      attackType = attacker.getAttackType()
      # 攻撃側の攻撃力
      attack = attacker.getAttack()
      # 防御側の防御力
      def = if attack is ObjectBase.ATTACK_TYPE.PHYSIC then defender.getPDef() else defender.getMDef()
      # 防御側のHP
      hp = defender.getHp()

      # 攻撃する
      damage = ObjectBase.getDamage(attack, def)

      # 倒した
      if defender.damage(damage) <= 0
        # 敵が死んだなら経験値加算
        ExpManager.plusAmount defender.getExp() if defender.isEnemyObject()
        # オブジェクト消す
        defenderCell.object = null

      # 攻撃側を行動終了にする
      attacker.setMoved true

      # 再描画
      attackerCell.draw()
      defenderCell.draw()

      # 移動・攻撃対象を解除
      FieldManager.removeAllWayStack()
      FieldManager.removeAllKnockout()

      setTimeout callback, 1 if callback instanceof Function
    , 1700

  @terror:(cell, callback = null)->
    # ライフを1下げる
    FieldLifeManager.decrease()
    # 敵を消し去る
    cell.object = null
    cell.draw()

    setTimeout callback, 1 if callback instanceof Function
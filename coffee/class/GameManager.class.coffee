class GameManager
  @DEBUG_CONFIG =
    if location.host is 'rev84.github.io'
      {
        # 右クリックでメニューをでなくする
        DISABLE_RIGHT_CLICK_MENU : true
        # 初期ライフ（falseでデバッグ無効）
        START_LIFE : false
        # 初期階層（falseでデバッグ無効）
        START_FLOOR : false
        # 初期経験値（falseでデバッグ無効）
        START_EXP : false
        # 初期ジュエル（falseでデバッグ無効）
        START_JEWEL : false
        # 全員参加
        IS_JOIN_ALL : false
        # アイテムが0個でも表示する
        IS_SHOW_ALL_ITEMS : false
        # セーブ
        AUTO_SAVE : true
      }
    else
      {
        # 右クリックでメニューをでなくする
        DISABLE_RIGHT_CLICK_MENU : true
        # 初期ライフ（falseでデバッグ無効）
        START_LIFE : false
        # 初期階層（falseでデバッグ無効）
        START_FLOOR : false
        # 初期経験値（falseでデバッグ無効）
        START_EXP : false
        # 初期ジュエル（falseでデバッグ無効）
        START_JEWEL : false
        # 全員参加
        IS_JOIN_ALL : false
        # アイテムが0個でも表示する
        IS_SHOW_ALL_ITEMS : true
        # セーブ
        AUTO_SAVE : true
      }

  @ID:'game'

  @mousePos = {x:0, y:0}
  @gameElement = null
  @characters = []
  @enemys = []
  @items = []
  @initialized = 
    characters:false
    field:false
    menu:false
    enemys:false
    levelup:false
    env:false
    items:false
    gacha:false
    cost_manager:false
  @isMode = 
    battle: false
    characterPick: false
    levelup: false
    item: false
    gacha: false
  @isEnable = 
    battle: false
    characterPick: false
    levelup: false
    turnEnd: false
    walk: false
    undo: false
    leftPanel: false
    rightPanel: false
    item: false
    gacha: false
  @flags = 
    # 操作可能か
    controllable : true
    # セルのオブジェクトのアニメーションを有効にするか
    isCellObjectAnimation : true
    # キャラクター出撃をしている場合、現在ドラッグされているキャラクターオブジェクト
    pickedCharacterObject : null
    # キャラクター出撃をしている場合、現在ドラッグされているキャラクターの要素
    pickedCharacterElement : null
    # 戦闘モードでキャラクターを動かしている場合、現在対象になっているセル
    movePickCell : null
    # 「元に戻す」で戻れるセルのオブジェクト
    # [0]元のセル [1]移動先のセル
    moveToCell : null
    # 戦闘モードで攻撃待ちの場合、現在対象になっているセル
    waitAttackCell : null
    # このターン、階層を進めたか
    isWalkInThisTurn : false
    # 戦闘モードで敵をロックしてる場合
    lockedEnemyCell : null

  # アニメーション関係
  @POSITION =
    COMMON:
      menu:[0,0]
      exp:[1000, 715]
      floor:[0, 775]
      jewel:[1000, 775]
      life:[0, 715]
    BATTLE:
      character_pallet:null
      field_visible:[0,65]
      left_info:[200,715]
      right_info:[600,715]
      levelup:null
      item:null
      gacha:null
      cost_manager:null
    CHARACTER_PICK:
      character_pallet:[144,115]
      field_visible:[0,65]
      left_info:null
      right_info:null
      levelup:null
      item:null
      gacha:null
      cost_manager:[220,715]
    LEVELUP:
      character_pallet:null
      field_visible:[0,65]
      left_info:null
      right_info:null
      levelup:[0, 115]
      item:null
      gacha:null
      cost_manager:null
    ITEM:
      character_pallet:null
      field_visible:null
      left_info:null
      right_info:null
      levelup:null
      item:[0, 115]
      gacha:null
      cost_manager:null
    GACHA:
      character_pallet:null
      field_visible:null
      left_info:null
      right_info:null
      levelup:null
      item:null
      gacha:[0, 115]
      cost_manager:null
  @ANIMATION_MSEC = 300

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
      CharacterPalletManager.skeleton false
    if @flags.pickedCharacterElement isnt null
      @flags.pickedCharacterElement.remove()
      @flags.pickedCharacterElement = null
      CharacterPalletManager.skeleton false
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
    @partsAnimation @POSITION.BATTLE, isSoon

    # キャラクター設置を確定
    CharacterPalletManager.onExit()

    # セーブ
    SaveManager.save()

    # コントロール可能に
    @changeControllable true

  # キャラクター出撃に移行
  @doCharacterPick:(isSoon = false)->
    # セーブ
    SaveManager.save()

    @partsAnimation @POSITION.CHARACTER_PICK, isSoon
    
    # コントロール可能に
    @changeControllable true

  # ターン終了
  @doTurnEnd:(isSoon = false)->
    # 疲労ダメージ
    await FieldManager.turnEndDamage()

    # 動ける敵がいる限り動かす
    while await @enemyMove()
      ;
    # プレゼントの処理
    await FieldManager.turnPresents()
    # 階層進行制限解除
    @flags.isWalkInThisTurn = false
    # 全キャラの復帰を進行
    c.decreaseComeback() for k, c of @characters

    # 味方ターン開始時イベント走査
    FieldManager.onCharacterTurnStart()

    # セーブ
    SaveManager.save()
    # コントロール可能に
    @changeControllable true

  # レベルアップ
  @doLevelup:(isSoon = false)->
    @partsAnimation @POSITION.LEVELUP, isSoon

    # キャラクター設置を確定
    CharacterPalletManager.onExit()

    @flags.isCellObjectAnimation = false

    # セーブ
    SaveManager.save()

    # コントロール可能に
    @changeControllable true

  # アイテム画面
  @doItem:(isSoon = false)->
    @partsAnimation @POSITION.ITEM, isSoon

    # キャラクター設置を確定
    CharacterPalletManager.onExit()

    # セーブ
    SaveManager.save()

    # コントロールを戻す
    @changeControllable true

  # ガチャ画面
  @doGacha:(isSoon = false)->
    # ボタン更新
    GachaManager.refreshButton()

    @partsAnimation @POSITION.GACHA, isSoon

    # キャラクター設置を確定
    CharacterPalletManager.onExit()

    # セーブ
    SaveManager.save()

    # コントロールを戻す
    @changeControllable true


  @partsAnimation:(ary, isSoon = false)->
    # 操作不能にする
    @changeControllable false

    animationMsec = if isSoon then 0 else @ANIMATION_MSEC

    # COMMONをマージ
    for id, pos of @POSITION.COMMON
      ary[id] = pos unless id of ary

    # アニメーション登録
    for id, pos of ary
      # 消す
      if pos is null
        $('#'+id).fadeOut(animationMsec)
      # 表す
      else
        $('#'+id).animate({left: pos[0], top: pos[1]}, animationMsec).fadeIn(animationMsec)

    # 指定時間後に操作可能
    Utl.sleep animationMsec
    @changeControllable true

  # 初期化
  @init:->
    # 床決め
    @CELL_CLASS = Utl.shuffle(['floor_blue', 'floor_dark', 'floor_light', 'floor_pink', 'blue0003']).pop()

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

    # セーブデータを読み込む
    savedata = SaveManager.load()
    savedataItems = 
      if savedata isnt null and 'items' of savedata
        savedata.items
      else
        null
    savedataCharacters = 
      if savedata isnt null and 'characters' of savedata
        savedata.characters
      else
        null
    savedataField = 
      if savedata isnt null and 'field' of savedata
        savedata.field
      else
        null
    savedataEnv = 
      if savedata isnt null and 'env' of savedata
        savedata.env
      else
        {
          life: (if @DEBUG_CONFIG.START_LIFE isnt false then @DEBUG_CONFIG.START_LIFE else EnvManager.DEFAULT.life)
          floor: (if @DEBUG_CONFIG.START_FLOOR isnt false then @DEBUG_CONFIG.START_FLOOR else EnvManager.DEFAULT.floor)
          exp: (if @DEBUG_CONFIG.START_EXP isnt false then @DEBUG_CONFIG.START_EXP else EnvManager.DEFAULT.exp)
          jewel: (if @DEBUG_CONFIG.START_JEWEL isnt false then @DEBUG_CONFIG.START_JEWEL else EnvManager.DEFAULT.jewel)
        }
    # 階を進んだか
    if savedata isnt null and 'flags' of savedata
      if 'isWalkInThisTurn' of savedata.flags
        @flags.isWalkInThisTurn = savedata.flags.isWalkInThisTurn

    @initItems(savedataItems)
    @initCharacters(savedataCharacters)
    @initEnemys(null)
    @initField(savedataField)
    @initEnv(savedataEnv)
    @initMenu(null)
    @initPanels(null)
    @initLevelup(null)
    @initItemWindow(null)
    @initBattleResult(null)
    @initGacha()
    @initCostManager()

    @gameElement.appendTo('body')

    # 戦闘モードにする
    GameManager.resetFlags()
    GameManager.isMode.battle = true
    GameManager.isEnable.characterPick = true
    GameManager.isEnable.levelup = true
    GameManager.isEnable.battle = true
    GameManager.isEnable.turnEnd = true
    GameManager.isEnable.walk = true
    GameManager.isEnable.undo = true
    GameManager.isEnable.item = true
    GameManager.isEnable.gacha = true
    GameManager.isEnable.leftPanel = true
    GameManager.isEnable.rightPanel = true
    MenuManager.reflectEnable()
    GameManager.flags.isCellObjectAnimation = true
    @doBattle(true)

  @initMenu:(savedata)->
    return if @initialized.menu
    @initialized.menu = true

    MenuManager.init(@gameElement)

  @initField:(savedata)->
    return if @initialized.field
    @initialized.field = true

    FieldManager.init(@gameElement, savedata)

  @initEnv:(savedata)->
    return if @initialized.env
    @initialized.env = true

    EnvManager.init(@gameElement)
    if savedata isnt null
      EnvManager.setLife savedata.life if 'life' of savedata
      EnvManager.setFloor savedata.floor if 'floor' of savedata
      EnvManager.setExp savedata.exp if 'exp' of savedata
      EnvManager.setJewel savedata.jewel if 'jewel' of savedata

  @initPanels:(savedata)->
    return if @initialized.panels
    @initialized.panels = true

    LeftInfoManager.init(@gameElement)
    RightInfoManager.init(@gameElement)

  @initLevelup:(savedata)->
    return if @initialized.levelup
    @initialized.levelup = true

    LevelupManager.init(@gameElement)
    LevelupManager.draw()

  @initBattleResult:(savedata)->
    return if @initialized.battleResult
    @initialized.battleResult = true

    BattleResultManager.init(@gameElement)

  @initGacha:->
    return if @initialized.gacha
    @initialized.gacha = true

    GachaManager.init(@gameElement)

  # キャラ初期化
  @initCharacters:(savedata)->
    return if @initialized.characters
    @initialized.characters = true

    CharacterPalletManager.init(@gameElement)

    @characters = {}
    for characterId, className of window.CharacterList
      if savedata isnt null and characterId of savedata
        params = savedata[characterId]
      else
        params = 
          joined : (if @DEBUG_CONFIG.IS_JOIN_ALL then true else null)
          level : 1
          hp : null
          items : []
          inField : false
          moved: false
          itemCapacityPlus: 0

      units = []
      for unit in UnitList
        for id in unit.id
          if id is Number(characterId)
            units.push unit
            break
      params.units = units
      @characters[characterId] = new window.CharacterList[characterId](params)
    for characterId, characterObject of @characters
      CharacterPalletManager.addCharacter(characterObject)
    CharacterPalletManager.draw()

  # キャラ初期化
  @initEnemys:(savedata)->
    return if @initialized.enemys
    @initialized.enemys = true

    @enemys = window.EnemyList
    window.EnemyList = undefined

  # アイテム初期化
  @initItems:(savedata)->
    return if @initialized.items
    @initialized.items = true

    @items = window.ItemList
    window.ItemList = undefined

    ItemManager.init(@gameElement, savedata)

  # アイテムウインドウ初期化
  @initItemWindow:(savedata)->
    return if @initialized.itemWindow
    @initialized.itemWindow = true

    ItemWindow.init(savedata)

  # アイテムウインドウ初期化
  @initCostManager:->
    return if @initialized.cost_manager
    @initialized.cost_manager = true

    CostManager.init(@gameElement)

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

    # 動けるマスを描画
    FieldManager.drawMovableCells cell, FieldManager.getMovableMap(cell)

    # 攻撃可能判定
    attackables = FieldManager.getAttackableCellsByCell cell
    for attackableCell in attackables
      attackableCell.knockout = cell

    FieldManager.drawKnockout()

  # 敵が行動する
  @enemyMove:->
    debugCount = 0

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
      # パネルリセット
      LeftInfoManager.setObject null
      RightInfoManager.setObject null

      FieldManager.resetAllMoved()
      FieldManager.drawMovable()
      FieldManager.drawKnockout()
      FieldManager.drawFin()
      # 移動・攻撃・戻るモードを解除
      @flags.movePickCell = null
      @flags.moveToCell = null
      @flags.waitAttackCell = null
      # 敵を湧かせる
      await FieldManager.randomEnemyAppear()
      false

    # 全マスから未行動の敵を探す
    enemyCell = null

    `enemysearch://`
    for x in [0...FieldManager.cells.length]
      for y in [0...FieldManager.cells[x].length]
        c = FieldManager.cells[x][y]
        # 未行動の敵
        if c.object isnt null and c.object.isEnemyObject() and !c.object.isMoved()
          enemyCell = c
          `break enemysearch`

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
    # 移動距離が長い
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
      # ライフ減少できているもの同士は、移動距離が短い方がいいとする
      return a.moveAmount - b.moveAmount if a.life > 0 and b.life > 0 and a.moveAmount isnt b.moveAmount
      return -1 if a.beatLevel > b.beatLevel
      return  1 if a.beatLevel < b.beatLevel
      return -1 if a.beatPossibility > b.beatPossibility
      return  1 if a.beatPossibility < b.beatPossibility
      return -1 if a.damage > b.damage
      return  1 if a.damage < b.damage
      return -1 if a.xMove < b.xMove
      return  1 if a.xMove > b.xMove
      return -1 if a.moveAmount > b.moveAmount
      return  1 if a.moveAmount < b.moveAmount
      0
    # 最高評価のものをおこなう
    [_, moveToCell, atkCell] = acts[0]

    # 移動
    await FieldManager.moveObject enemyCell, moveToCell

    # 攻撃しない
    if atkCell is null
      moveToCell.object.setMoved true
      moveToCell.drawFin()
    # 自爆する
    else if atkCell is -1
      isDeath = await @terror(moveToCell)
      # 死んでたら終わり
      return false if isDeath

    # 攻撃する
    else
      await @attack(moveToCell, atkCell)

    true

  @attack:(attackerCell, defenderCell)->
    # それぞれのオブジェクト
    attacker = attackerCell.object
    defender = defenderCell.object

    # パネル用
    @isEnable.leftObject = false
    @isEnable.rightObject = false
    leftObject = if attacker.isCharacterObject() then attacker else defender
    rightObject = if attacker.isCharacterObject() then defender else attacker
    # 左に味方の情報
    LeftInfoManager.setObject leftObject
    # 右に敵の情報
    RightInfoManager.setObject rightObject

    # ターゲットマークを点滅させる
    times = 3
    for index in [0...times]
      defenderCell.showAnimation './img/target.png'
      await Utl.sleep(100)
      defenderCell.hideAnimation()
      await Utl.sleep(100)

    await Utl.sleep(50)

    # 攻撃側の攻撃タイプ
    attackType = attacker.getAttackType()
    # 攻撃側の攻撃力
    attack = attacker.getAttack()
    # 防御側の防御力
    def = if attackType is ObjectBase.ATTACK_TYPE.PHYSIC then defender.getPDef() else defender.getMDef()
    # 防御側のHP
    hp = defender.getHp()

    # ダメージ
    damage = ObjectBase.getDamage(attack, def)
    # 攻撃側のダメージ割り込み処理
    damage = await attacker.onAttackDamage(attackerCell, defenderCell, damage)
    # 防御側のダメージ割り込み処理
    damage = await defender.onAttackDamage(defenderCell, attackerCell, damage)

    # 攻撃アニメーション
    if attacker.isCharacterObject()
      character = attacker
      enemy = defender
      isCharacterOffence = true
    else
      character = defender
      enemy = attacker
      isCharacterOffence = false

    hpMax = defender.getHpMax()
    hpBase = defender.getHp()
    hpTo = defender.getHp() - damage
    hpTo = 0 if hpTo < 0

    # アニメーションを待つ
    await BattleResultManager.animate character, enemy, isCharacterOffence, hpMax, hpBase, hpTo
    await Utl.sleep(100)

    # ダメージを与える
    defender.damage damage
    # 倒したキャラの台詞チェック
    await FieldManager.checkDeath()

    # 攻撃側を行動終了にする
    attacker.setMoved true
    # 再描画
    attackerCell.draw()
    defenderCell.draw()

    # 移動・攻撃対象を解除
    FieldManager.removeAllWayStack()
    FieldManager.removeAllKnockout()
    FieldManager.drawMovable()
    FieldManager.drawKnockout()

  # 自爆
  @terror:(cell)->
    # ライフを1下げる
    EnvManager.decreaseLife()
    # 敵を消し去る
    cell.object = null
    cell.draw()

    # チェック
    EnvManager.deathPenalty()

  # 指定した階層で出得る敵を一体返す
  @getEnemyObject:(level = EnvManager.getFloor())->
    ids = []
    for id, enemyClass of GameManager.enemys
      ids.push id if enemyClass.appearance <= level
    return null if ids.length <= 0
    targetId = Utl.shuffle(ids).pop()
    
    new GameManager.enemys[targetId]({
      level: level
      hp: null
      inField: true
      moved: false
    })

  # 階層をひとつ進める
  @doWalk:->
    @changeControllable false

    # 既にこのターン進んでいた場合
    if @flags.isWalkInThisTurn
      window.alert('このターンは既に階層を進んだので、次のターンになるまで進めません')
      return @changeControllable true
    # 左端に味方がいるので進めない場合
    for cell in FieldManager.cells[0]
      if cell.object isnt null and cell.object.isCharacterObject()
        window.alert('左端に味方がいるので進めません')
        return @changeControllable true

    # 次の列を生んでおく
    nextField = FieldManager.generateNextField()

    # 全マスずらすアニメーション
    $.each FieldManager.cells, ->
      $.each @, ->
        @xIndex--
        @elements.mother.animate({
          left: @xIndex * @constructor.SIZE_X + FieldManager.BORDER_SIZE * (@xIndex + 1)
        }, 1000)
    $.each nextField, ->
      @xIndex--
      @elements.mother.animate({
        left: @xIndex * @constructor.SIZE_X + FieldManager.BORDER_SIZE * (@xIndex + 1)
      }, 1000)

    await Utl.sleep 1100

    # 左端のセルをぜんぶ消す
    for y in [0...FieldManager.cells[0].length]
      FieldManager.cells[0][y].removeMe()
    # 既存のセルをいっこ左にずらす
    for x in [1...FieldManager.cells.length]
      for y in [0...FieldManager.cells[x].length]
        FieldManager.cells[x-1][y] = FieldManager.cells[x][y]
    # 右端に新規の列を追加する
    for y in [0...nextField.length]
      FieldManager.cells[FieldManager.CELL_X-1][y] = nextField[y]

    # 階層インクリメント
    EnvManager.increaseFloor(1)
    # 階層進行制限
    @flags.isWalkInThisTurn = true
    # 移動やりなおし不可
    @flags.moveToCell = null
    
    # セーブ
    SaveManager.save()

    @changeControllable true


  @doUndo:->
    @changeControllable false

    # 戻す
    [preCell, nowCell] = @flags.moveToCell
    preCell.object = nowCell.object
    nowCell.object = null

    # 行動終了を解除
    preCell.object.setMoved false

    # 戻せなくする
    @flags.moveToCell = null

    # 再描画
    preCell.draw()
    nowCell.draw()

    # セーブ
    SaveManager.save()

    # コントロールを戻す
    @changeControllable true

  @resetFlags:->
    @isEnable[key] = false for key, val of @isEnable
    @isMode[key] = false for key, val of @isMode


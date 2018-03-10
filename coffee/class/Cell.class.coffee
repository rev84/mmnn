class Cell
  @SIZE_X : 72
  @SIZE_Y : 72
  # セルのオブジェクトのアニメーションの間隔msec
  @OBJECT_ANIMATION_MSEC : 500
  # キャラ出撃で置けるxIndex
  @PUT_FIELD_MAX_X : 1
  # 画像
  @IMAGE_BACKGROUND:[
    './img/background/light_blue.png'
  ]
  @IMAGE_MOVABLE: './img/movable.png'
  @IMAGE_FIN: './img/fin.png'
  @IMAGE_SNIPE: './img/target.png'


  constructor:(@parentElement, @xIndex, @yIndex, borderSize)->
    @elements =
      mother:null
      collision:null
      background:null
      object:null
      movable:null
      knockout:null
    @object = null
    @tempObject = null
    @background = @constructor.IMAGE_BACKGROUND[Utl.rand 0, @constructor.IMAGE_BACKGROUND.length-1]
    @wayStack = null
    @knockout = null
    @objectAnimationIndex = 0

    @initElements(borderSize)

  onMouseMiddleUp:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false
    GameManager.changeControllable true

  onMouseRightUp:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false
 
    # キャラ移動選択をキャンセルするトライ
    if await @tryMovePickCancel(evt)
      ;
    # 移動後の攻撃先選択をキャンセルするトライ
    else if await @tryAttackCancel(evt)
      ;
    else
      GameManager.changeControllable true

  onMouseLeftUp:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false

    # キャラを仮置きするトライ
    if await @tryCharacterPut(evt)
      ;
    # キャラを移動させるトライ
    else if await @tryMovePick(evt)
      ;
    # キャラの移動先を決めるトライ
    else if await @tryMoveTo(evt)
      ;
    # 攻撃先を決めるトライ
    else if await @tryAttack(evt)
      ;
    # どれにもならなかったら操作解放
    else
      GameManager.changeControllable true


  onMouseLeftDown:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false
    # 仮置きがあった場合はつかむ
    if @tempObject isnt null
      CharacterPalletManager.pickCharacter @tempObject
      @tempObject = null
    GameManager.changeControllable true

  onMouseMiddleDown:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false
    GameManager.changeControllable true

  onMouseRightDown:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false
    GameManager.changeControllable true

  onMouseMove:(evt)->
    return unless GameManager.isControllable()

    # マス目移動時のパネルキャラ切り替え
    @changePanels(evt)


  onMouseLeave:(evt)->
    return unless GameManager.isControllable()
    GameManager.changeControllable false
    GameManager.changeControllable true



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
    @elements.background = $('<div>').addClass('cell cell_background')
                           .css(cssPos).css(cssSize)
                           .appendTo(@elements.mother)
    @elements.object     = $('<img>').addClass('cell cell_object')
                           .css({left:0, bottom:10}).css({width:'100%'})
                           .appendTo(@elements.mother)
    @elements.movable    = $('<div>').addClass('cell cell_movable')
                           .css(cssPos).css(cssSize).addClass('no_display')
                           .appendTo(@elements.mother)
    @elements.fin        = $('<div>').addClass('cell cell_fin')
                           .css(cssPos).css(cssSize).addClass('no_display')
                           .appendTo(@elements.mother)
    @elements.knockout   = $('<div>').addClass('cell cell_knockout')
                           .css({right:0, top:0})
                           .css({width:@constructor.SIZE_X*0.3, height:@constructor.SIZE_Y*0.3})
                           .addClass('no_display')
                           .appendTo(@elements.mother)
    @elements.animation  = $('<div>').addClass('cell cell_animation')
                           .css(cssPos).css(cssSize).addClass('no_display')
                           .appendTo(@elements.mother)
    @elements.receiveTurn = $('<div>').addClass('cell cell_receive_turn')
                            .css({right:0, bottom:0}).addClass('no_display')
                            .appendTo(@elements.mother)

    @changeBackground @background
    @changeMovable @constructor.IMAGE_MOVABLE
    @changeFin @constructor.IMAGE_FIN
    $(@elements.mother).appendTo(@parentElement)

  # 画像の変更
  changeBackground:(imagePath = null)->
    if imagePath is null
      @elements.background.addClass('no_display')
    else
      @elements.background.css('background-image', 'url('+imagePath+')').removeClass('no_display')
  changeObject:(imagePath = null)->
    if imagePath is null
      @elements.object.addClass('no_display')
    else
      @elements.object.attr('src', imagePath).removeClass('no_display')
  changeAttackable:(imagePath = null)->
    if imagePath is null
      @elements.attackable.addClass('no_display')
    else
      @elements.attackable.css('background-image', 'url('+imagePath+')').removeClass('no_display')
  changeMovable:(imagePath)->
      @elements.movable.css('background-image', 'url('+imagePath+')')
  changeFin:(imagePath)->
      @elements.fin.css('background-image', 'url('+imagePath+')')
  changeKnockout:(imagePath, num = '')->
      @elements.knockout.css('background-image', 'url('+imagePath+')').html(num).removeClass('no_display')

  showAnimation:(imagePath)->
    @elements.animation.css('background-image', 'url('+imagePath+')').removeClass('no_display')

  hideAnimation:->
    @elements.animation.css('background-image', 'none').addClass('no_display')

  showObject:->
    @elements.object.removeClass('no_display')
  hideObject:->
    @elements.object.addClass('no_display')
  showMovable:(bool = true)->
    if bool
      @elements.movable.removeClass('no_display')
    else
      @elements.movable.addClass('no_display')
  showFin:(bool = true)->
    if bool
      @elements.fin.removeClass('no_display')
    else
      @elements.fin.addClass('no_display')
  showKnockout:(bool = true)->
    if bool
      @elements.knockout.removeClass('no_display')
    else
      @elements.knockout.addClass('no_display')
  # 吹き出しを出す
  showPopover:(text = null, msec = null)->
    if text is null
      $(@elements.mother).popover('destroy')
    else
      position = 
        if @xIndex < 2
          'right'
        else if FieldManager.CELL_X - 2 <= @xIndex
          'left'
        else if @yIndex < 2
          'bottom'
        else
          'top'
      $(@elements.mother).popover({
        content: text
        placement: position
      }).popover('show')
      
      if msec isnt null
        await Utl.sleep msec 
        $(@elements.mother).popover('destroy')

  # 描画
  draw:->
    # 背景
    @changeBackground @background

    # オブジェクト
    if @object isnt null
      @changeObject @object.getBaseImage()
    else if @tempObject isnt null
      @changeObject @tempObject.getBaseImage()
    else
      @changeObject()

    # 移動可能
    @drawMovable()
    # 行動終了
    @drawFin()
    # 倒す
    @drawKnockout()
    # 受取期限
    @drawReceiveTurn()

  isDroppableCharacter:->
    @xIndex <= @constructor.PUT_FIELD_MAX_X and @object is null

  # 進入可能か
  isEnterable:->
    @object is null

  tryCharacterPut:(evt)->
    return if GameManager.flags.pickedCharacterObject is null and GameManager.flags.pickedCharacterElement is null

    redrawCharacter = null
    # キャラクター出撃モードで、キャラクターがピックされている場合
    if GameManager.flags.pickedCharacterObject isnt null and @isDroppableCharacter()
      # ここに置いてあった仮キャラを全削除
      FieldManager.removeAllTempObject @tempObject
      # このセルに仮キャラを配置する
      @setTempObject GameManager.flags.pickedCharacterObject
      redrawCharacter = GameManager.flags.pickedCharacterObject
    # 出撃選択を解除
    if GameManager.flags.pickedCharacterElement isnt null
      GameManager.flags.pickedCharacterElement.remove()
      GameManager.flags.pickedCharacterElement = null
      CharacterPalletManager.redraw redrawCharacter if redrawCharacter isnt null
      GameManager.flags.pickedCharacterObject = null

    GameManager.changeControllable true
    true

  tryMovePick:(evt)->
    # 戦闘モード時のみ
    return unless GameManager.isMode.battle
    # 既に移動させたいキャラを選んでいる場合はダメ
    return if GameManager.flags.movePickCell isnt null
    # 攻撃待ち専用モードの時はダメ
    return if GameManager.flags.waitAttackCell isnt null
    # キャラクターが置かれている場合のみ
    return unless @object isnt null and @object.isCharacterObject()
    # 行動済みでない場合のみ
    return if @object.isMoved()

    # 移動選択
    GameManager.movePick @
    # 左キャラ固定
    GameManager.isEnable.leftPanel = false

    GameManager.changeControllable true
    true

  tryMovePickCancel:(evt)->
    # 戦闘モード時のみ
    return unless GameManager.isMode.battle
    # 既に移動させたいキャラを選んでいない場合はダメ
    return if GameManager.flags.movePickCell is null

    # 移動可能モード
    GameManager.flags.movePickCell = null
    # 攻撃可能モード
    GameManager.flags.waitAttackCell = null

    # 移動可能などをすべて消す
    for body, x in FieldManager.cells
      for cell, y in body
        cell.setWayStack(null)
        cell.setKnockout(null)
        cell.drawMovable()
        cell.drawKnockout()

    # パネル解放
    GameManager.isEnable.leftPanel = true
    GameManager.isEnable.rightPanel = true

    # 操作可能に
    GameManager.changeControllable true
    true

  tryMoveTo:(evt)->
    # 戦闘モード時のみ
    return unless GameManager.isMode.battle
    # 既に移動させたいキャラを選んでいない場合はダメ
    return if GameManager.flags.movePickCell is null
    # ここにキャラがいる場合はダメ
    return if @object isnt null
    # ここにいけない場合はダメ
    return if @wayStack is null

    await FieldManager.moveObject(GameManager.flags.movePickCell, @)

    GameManager.changeControllable true
    true

  tryAttack:(evt)->
    # 戦闘モード時のみ
    return unless GameManager.isMode.battle
    # 攻撃待ちでなければダメ
    return if GameManager.flags.waitAttackCell is null
    # 攻撃可能が設定されてないとダメ
    return if @knockout is null

    # 攻撃する
    await GameManager.attack @knockout, @
    # 移動・攻撃・戻るモードを解除
    GameManager.flags.movePickCell = null
    GameManager.flags.moveToCell = null
    GameManager.flags.waitAttackCell = null
    # コールバックで操作可能にする
    GameManager.changeControllable true
    
  tryAttackCancel:(evt)->
    # 戦闘モード時のみ
    return unless GameManager.isMode.battle
    # 攻撃待ちでなければダメ
    return if GameManager.flags.waitAttackCell is null

    # 移動・攻撃モードを解除
    GameManager.flags.movePickCell = null
    GameManager.flags.waitAttackCell = null
    # コールバックで操作可能にする
    GameManager.changeControllable true
    

  setWayStack:(wayStack)->
    @wayStack = wayStack

  setKnockout:(knockout)->
    @knockout = knockout

  drawMovable:->
    @showMovable(@wayStack isnt null)

  drawKnockout:->
    if @object isnt null and @knockout isnt null
      # 攻撃側の攻撃タイプ
      attackType = @knockout.object.getAttackType()
      # 攻撃側の攻撃力
      attack = @knockout.object.getAttack()
      # 防御側の防御力
      def = if attackType is ObjectBase.ATTACK_TYPE.PHYSIC then @object.getPDef() else @object.getMDef()
      # 防御側のHP
      hp = @object.getHp()

      knockout = ObjectBase.getKnockoutRate(hp, attack, def)
      if knockout is +Infinity
        @changeKnockout ObjectBase.KNOCKOUT.OK
      else if knockout is -Infinity
        @changeKnockout ObjectBase.KNOCKOUT.NG
      else
        @changeKnockout ObjectBase.KNOCKOUT.MAY, knockout
    else
      @showKnockout false

  drawFin:->
    if @object isnt null and (@object.isCharacterObject() or @object.isEnemyObject()) and @object.isMoved()
      @showFin(true)
    else
      @showFin(false)

  drawReceiveTurn:->
    if @object isnt null and @object.isPresentboxObject()
      @elements.receiveTurn.html(@object.getReceiveTurn()).removeClass('no_display')
    else
      @elements.receiveTurn.addClass('no_display')

  stepObjectAnimation:=>
    return @hideObject if @object is null
    @objectAnimationIndex++
    @objectAnimationIndex = 0 if @object.getImage(@objectAnimationIndex) is null
    @changeObject @object.getImage(@objectAnimationIndex)

  removeMe:=>
    for e in @elements
      e.remove()

  changePanels:(evt)->
    # 戦闘中モードのみ
    return unless GameManager.isMode.battle

    # 左パネル切り替え可能
    if GameManager.isEnable.leftPanel
      if @object is null
        LeftInfoManager.setObject null
      else if @object.isCharacterObject()
        LeftInfoManager.setObject @object
      else if @object.isEnemyObject()
        LeftInfoManager.setObject null
      else if @object.isPresentboxObject()
        LeftInfoManager.setObject null

    # 右パネル切り替え可能
    if GameManager.isEnable.rightPanel
      if @object is null
        RightInfoManager.setObject null
      else if @object.isCharacterObject()
        RightInfoManager.setObject null
      else if @object.isEnemyObject()
        RightInfoManager.setObject @object
      else if @object.isPresentboxObject()
        RightInfoManager.setObject @object

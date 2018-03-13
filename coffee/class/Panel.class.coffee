class Panel
  @SIZE_X = 400
  @SIZE_Y = 120

  @CLASSNAME = 'panel'

  constructor:(@parentElement, @object, @posY = 0, @posX = 0, @isShowOverlay = true, @isCharacterPallet = false)->
    @divObject = $('<div>').addClass(@constructor.CLASSNAME).css({
      width: @constructor.SIZE_X
      height: @constructor.SIZE_Y
      top : @posY
      left : @posX
    }).appendTo(@parentElement)
    @draw()

  # アイコンがドラッグ開始された時
  onIconDragStart:(evt)->
    return unless GameManager.isControllable()

    # キャラクター出撃に使っていいパネルではないなら帰る
    return unless @isCharacterPallet
    # キャラクター出撃モードではないので帰る
    return unless GameManager.isMode.characterPick
    # キャラクターではないので帰る
    return unless @object.isCharacterObject()
    # 既に出撃中なので帰る
    return if @object.isInField()
    # 既に出撃中なので帰る
    return if @isCostOver()

    CharacterPalletManager.pickCharacter @object
    true

  draw:(level = null)->
    $(@divObject).find('*').remove()

    @divObject.removeClass('panel_character panel_enemy panel_presentbox')

    if @object isnt null
      @drawCommon(level)
      if @object.isCharacterObject()
        @drawCharacter(level)
      else if @object.isEnemyObject()
        @drawEnemy()
      else if @object.isPresentboxObject()
        @drawPresentbox()
    else
      @clear()

  drawCommon:(level = null)->
    # アイコン
    $(@divObject).append(
      $('<div>').addClass('field field_icon').css({
        top: 32
        left: 5
        width: 80
        height: 80
        "background-image": 'url('+@object.getBaseImage()+')'
      }).on('mousedown', (evt)=>
        @onIconDragStart.bind(@)(evt) if evt.which is 1
        true
      )
    )

    # レベル
    $(@divObject).append(
      $('<div>').addClass('field field_level').css({
        top: 95
        left: 5
        width: 75
        height: 20
      }).html('Lv.'+ObjectBase.status2html @object.getLevel(level))
    )

    # 名前
    $(@divObject).append(
      $('<div>').addClass('field field_name').css({
        top: 5
        left: 10
        width: 190
        height: 20
        color: '#ffffff'
        'font-weight': 'bold'
        'text-align': 'left'
        'line-height': '20px'
      }).html(@object.getCharacterName())
    )

    # 攻撃力
    $(@divObject).append(
      $('<div>').addClass('field field_attack '+(if @object.getAttackType() is '物理' then 'field_attack_physic' else 'field_attack_magic')).css({
        top: 30
        left: 130
        width: 80
        height: 20
      }).html(ObjectBase.status2html @object.getAttack(level))
    )


    # 物理防御力
    $(@divObject).append(
      $('<div>').addClass('field field_pdef').css({
        top: 51
        left: 130
        width: 80
        height: 20
      }).html(ObjectBase.status2html @object.getPDef(level))
    )

    # 魔法防御力
    $(@divObject).append(
      $('<div>').addClass('field field_mdef').css({
        top: 71
        left: 130
        width: 80
        height: 20
      }).html(ObjectBase.status2html @object.getMDef(level))
    )

    # HP
    $(@divObject).append(
      $('<div>').addClass('field field_hp').css({
        top: 6
        left: 200
        width: 85
        height: 20
      }).html(ObjectBase.status2html @object.getHp())
    )

    # HP/
    $(@divObject).append(
      $('<div>').addClass('label label_hp_split').css({
        top: 7
        left: 280
        width: 20
        height: 20
      }).html('/')
    )

    # HP最大
    $(@divObject).append(
      $('<div>').addClass('field field_hp_max').css({
        top: 6
        left: 300
        width: 85
        height: 20
      }).html(ObjectBase.status2html @object.getHpMax(level))
    )

    # 命中率
    $(@divObject).append(
      $('<div>').addClass('field field_hit_rate').css({
        top: 30
        left: 260
        width: 35
        height: 20
      }).html(ObjectBase.status2html @object.getHitRate())
    )

    # 回避率
    $(@divObject).append(
      $('<div>').addClass('field field_dodge_rate').css({
        top: 51
        left: 260
        width: 35
        height: 20
      }).html(ObjectBase.status2html @object.getDodgeRate())
    )

    # 移動力
    $(@divObject).append(
      $('<div>').addClass('field field_move').css({
        top: 30
        left: 350
        width: 30
        height: 20
      }).html(ObjectBase.status2html @object.getMove())
    )

    # 射程
    $(@divObject).append(
      $('<div>').addClass('field field_range').css({
        top: 50
        left: 350
        width: 30
        height: 20
      }).html(@object.getRange())
    )
    # 能力
    $(@divObject).append(
      $('<div>').addClass('field field_ability').css({
        top: 93
        left: 130
        width: 250
        height: 20
        'text-align': 'left'
      })
      .html(@object.getAbilityName())
      .tooltip({
        'placement' : 'top'
        'title' : @object.getAbilityDesc()
      })
    )

  drawCharacter:(level = null)->
    # 背景用
    @divObject.addClass('panel_character')

    @redrawOverlay() if @isShowOverlay

    # コスト
    $(@divObject).append(
      $('<div>').addClass('field field_cost').css({
        top: 71
        left: 260
        width: 35
        height: 20
      }).html(ObjectBase.status2html @object.getCost())
    )
  drawEnemy:->
    # 背景用
    @divObject.addClass('panel_enemy')
  drawPresentbox:->
    # 背景用
    @divObject.addClass('panel_presentbox')
  clear:->
    $(@divObject).find('*').remove()
  removeMe:->
    $(@divObject).find('*').remove()
    $(@divObject).remove()

  isCostOver:->
    @isCharacterPallet and (CostManager.getCostMax() < (@object.getCost() + CostManager.getCostNow()))

  redrawOverlay:->
    @divObject.find('.infield, .comeback, .costover').remove()

    if @isShowOverlay
      # 出撃中判定
      if @object.isInField()
        $('<div>').addClass('infield')
        .appendTo(@divObject)
      # 療養中判定
      else if @object.getComebackTurn() > 0
        $('<div>').addClass('comeback').html(@object.getComebackTurn())
        .appendTo(@divObject)
      # コスト不足
      else if @isCostOver()
        $('<div>').addClass('costover').appendTo(@divObject)    
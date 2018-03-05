class Panel
  @SIZE_X = 400
  @SIZE_Y = 120

  @CLASSNAME = 'panel'

  constructor:(@parentElement, @object, @posY = 0, @posX = 0, @isCharacterPallet = false)->
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
    return true if @object.isInField()

    CharacterPalletManager.pickCharacter @object
    true

  draw:(level = null)->
    $(@divObject).find('*').remove()

    if @object isnt null
      if @object.isCharacterObject()
        @drawCharacter(level)
      else if @object.isEnemyObject()
        @drawEnemy()

  drawCharacter:(level = null)->
    # キャラ出撃用のパネルなら、出撃中判定
    if @isCharacterPallet and @object.isInField()
      $('<div>').addClass('in_field').css({
        left:0
        top:0
        "z-index": 9999
        opacity: 0.5
        "background-color": '#230381'
        width: @constructor.SIZE_X
        height: @constructor.SIZE_Y
        'font-size': '80px'
        color: '#000000'
        'text-align': 'center'

      }).html('出撃中')
      .appendTo(@divObject)

    # アイコン
    $(@divObject).append(
      $('<div>').addClass('field_icon').css({
        top: 20
        left: 0
        width: 90
        height: 90
        "background-image": 'url('+@object.getBaseImage()+')'
      }).on('mousedown', (evt)=>
        @onIconDragStart.bind(@)(evt) if evt.which is 1
        true
      )
    )

    # レベルラベル
    $(@divObject).append(
      $('<div>').addClass('label_level').css({
        top: 0
        left: 0
        width: 20
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('Lv')
    )

    # レベル
    $(@divObject).append(
      $('<div>').addClass('field_level').css({
        top: 0
        left: 20
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html(@object.getLevel(level))
    )

    # 名前
    $(@divObject).append(
      $('<div>').addClass('field_name').css({
        top: 0
        left: 90
        width: 120
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html(@object.getCharacterName())
    )

    # 攻撃力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_attack').css({
        top: 25
        left: 90
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('攻撃')
    )
    # 攻撃タイプ
    attackImg = if @object.getAttackType() is '物理' then './img/sword.png' else './img/magic.png'
    $(@divObject).append(
      $('<img>').addClass('field_attack_type').css({
        top: 25
        left: 130
        width: 20
        height: 20
      }).attr('src', attackImg)
    )
    # 攻撃力
    $(@divObject).append(
      $('<div>').addClass('field_attack').css({
        top: 25
        left: 160
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getAttack(level))
    )

    # 物理防御力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_pdef').css({
        top: 45
        left: 90
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('物防')
    )
    # 物理防御力
    $(@divObject).append(
      $('<div>').addClass('field_pdef').css({
        top: 45
        left: 160
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getPDef(level))
    )

    # 魔法防御力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_mdef').css({
        top: 65
        left: 90
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('魔防')
    )
    # 魔法防御力
    $(@divObject).append(
      $('<div>').addClass('field_mdef').css({
        top: 65
        left: 160
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getMDef(level))
    )

    # HPラベル
    $(@divObject).append(
      $('<div>').addClass('label_hp').css({
        top: 0
        left: 180
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('HP')
    )
    # HP
    $(@divObject).append(
      $('<div>').addClass('field_hp').css({
        top: 0
        left: 220
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getHp())
    )
    # HPしきり
    $(@divObject).append(
      $('<div>').addClass('label_hp_split').css({
        top: 0
        left: 280
        width: 20
        height: 20
        "font-size" : "16px"
      }).html('/')
    )
    # HP最大
    $(@divObject).append(
      $('<div>').addClass('field_hp_max').css({
        top: 0
        left: 300
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getHpMax(level))
    )

    # 命中率ラベル
    $(@divObject).append(
      $('<div>').addClass('label_hit_rate').css({
        top: 25
        left: 210
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('命中')
    )
    # 命中率
    $(@divObject).append(
      $('<div>').addClass('field_hit_rate').css({
        top: 25
        left: 260
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getHitRate())
    )

    # 回避率ラベル
    $(@divObject).append(
      $('<div>').addClass('label_dodge_rate').css({
        top: 45
        left: 210
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('回避')
    )
    # 回避率
    $(@divObject).append(
      $('<div>').addClass('field_dodge_rate').css({
        top: 45
        left: 260
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getDodgeRate())
    )

    # 移動力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_move').css({
        top: 25
        left: 310
        width: 50
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('移動')
    )
    # 移動力
    $(@divObject).append(
      $('<div>').addClass('field_move').css({
        top: 25
        left: 360
        width: 50
        height: 20
        "font-size" : "16px"
      }).html(@object.getMove())
    )
    # 射程ラベル
    $(@divObject).append(
      $('<div>').addClass('label_range').css({
        top: 45
        left: 310
        width: 50
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('射程')
    )
    # 射程
    $(@divObject).append(
      $('<div>').addClass('field_range').css({
        top: 45
        left: 360
        width: 50
        height: 20
        "font-size" : "16px"
      }).html(@object.getRange())
    )
    # 能力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_ability').css({
        top: 85
        left: 90
        width: 50
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('能力')
    )
    # 能力
    $(@divObject).append(
      $('<div>').addClass('field_ability').css({
        top: 85
        left: 130
        width: 250
        height: 20
        "font-size" : "16px"
      })
      .html(@object.getAbilityName())
      .tooltip({
        'placement' : 'top'
        'title' : @object.getAbilityDesc()
      })
    )
    
  drawEnemy:->
    # アイコン
    $(@divObject).append(
      $('<div>').addClass('field_icon').css({
        top: 20
        left: 0
        width: 90
        height: 90
        "background-image": 'url('+@object.getBaseImage()+')'
      })
    )

    # レベルラベル
    $(@divObject).append(
      $('<div>').addClass('label_level').css({
        top: 0
        left: 0
        width: 20
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('Lv')
    )

    # レベル
    $(@divObject).append(
      $('<div>').addClass('field_level').css({
        top: 0
        left: 20
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html(@object.getLevel())
    )

    # 名前
    $(@divObject).append(
      $('<div>').addClass('field_name').css({
        top: 0
        left: 90
        width: 120
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html(@object.getCharacterName())
    )

    # 攻撃力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_attack').css({
        top: 25
        left: 90
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('攻撃')
    )
    # 攻撃タイプ
    attackImg = if @object.getAttackType() is '物理' then './img/sword.png' else './img/magic.png'
    $(@divObject).append(
      $('<img>').addClass('field_attack_type').css({
        top: 25
        left: 130
        width: 20
        height: 20
      }).attr('src', attackImg)
    )
    # 攻撃力
    $(@divObject).append(
      $('<div>').addClass('field_attack').css({
        top: 25
        left: 160
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getAttack())
    )

    # 物理防御力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_pdef').css({
        top: 45
        left: 90
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('物防')
    )
    # 物理防御力
    $(@divObject).append(
      $('<div>').addClass('field_pdef').css({
        top: 45
        left: 160
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getPDef())
    )

    # 魔法防御力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_mdef').css({
        top: 65
        left: 90
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('魔防')
    )
    # 魔法防御力
    $(@divObject).append(
      $('<div>').addClass('field_mdef').css({
        top: 65
        left: 160
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getMDef())
    )

    # HPラベル
    $(@divObject).append(
      $('<div>').addClass('label_hp').css({
        top: 0
        left: 180
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('HP')
    )
    # HP
    $(@divObject).append(
      $('<div>').addClass('field_hp').css({
        top: 0
        left: 220
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getHp())
    )
    # HPしきり
    $(@divObject).append(
      $('<div>').addClass('label_hp_split').css({
        top: 0
        left: 280
        width: 20
        height: 20
        "font-size" : "16px"
      }).html('/')
    )
    # HP最大
    $(@divObject).append(
      $('<div>').addClass('field_hp_max').css({
        top: 0
        left: 300
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getHpMax())
    )

    # 命中率ラベル
    $(@divObject).append(
      $('<div>').addClass('label_hit_rate').css({
        top: 25
        left: 210
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('命中')
    )
    # 命中率
    $(@divObject).append(
      $('<div>').addClass('field_hit_rate').css({
        top: 25
        left: 260
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getHitRate())
    )

    # 回避率ラベル
    $(@divObject).append(
      $('<div>').addClass('label_dodge_rate').css({
        top: 45
        left: 210
        width: 90
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('回避')
    )
    # 回避率
    $(@divObject).append(
      $('<div>').addClass('field_dodge_rate').css({
        top: 45
        left: 260
        width: 20
        height: 20
        "font-size" : "16px"
      }).html(@object.getDodgeRate())
    )

    # 移動力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_move').css({
        top: 25
        left: 310
        width: 50
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('移動')
    )
    # 移動力
    $(@divObject).append(
      $('<div>').addClass('field_move').css({
        top: 25
        left: 360
        width: 50
        height: 20
        "font-size" : "16px"
      }).html(@object.getMove())
    )
    # 射程ラベル
    $(@divObject).append(
      $('<div>').addClass('label_range').css({
        top: 45
        left: 310
        width: 50
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('射程')
    )
    # 射程
    $(@divObject).append(
      $('<div>').addClass('field_range').css({
        top: 45
        left: 360
        width: 50
        height: 20
        "font-size" : "16px"
      }).html(@object.getRange())
    )
    # 能力ラベル
    $(@divObject).append(
      $('<div>').addClass('label_ability').css({
        top: 85
        left: 90
        width: 50
        height: 20
        "font-size" : "16px"
        "background-color" : '#ffffff'
      }).html('能力')
    )
    # 能力
    $(@divObject).append(
      $('<div>').addClass('field_ability').css({
        top: 85
        left: 130
        width: 250
        height: 20
        "font-size" : "16px"
      })
      .html(@object.getAbilityName())
      .tooltip({
        'placement' : 'top'
        'title' : @object.getAbilityDesc()
      })
    )

  removeMe:->
    $(@divObject).find('*').remove()
    $(@divObject).remove()
class ObjectBase
  @OBJECT_TYPE:
    CHARACTER : 'CHARACTER'
    ENEMY : 'ENEMY'
    PRESENTBOX : 'PRESENTBOX'
  @ATTACK_TYPE:
    PHYSIC:'物理'
    MAGIC:'魔法'
  # ダメージの振れ幅
  @DAMAGE_SHAKE_RATE: 0.1
  # 倒せるか定数兼画像
  @KNOCKOUT:
    OK:'./img/circle.png'
    MAY:'./img/triangle.png'
    NG:'./img/cross.png'

  constructor:(objectType)->
    @objectType = objectType

  getObjectType:->
    @objectType

  isCharacterObject:->
    @objectType is @constructor.OBJECT_TYPE.CHARACTER

  isEnemyObject:->
    @objectType is @constructor.OBJECT_TYPE.ENEMY

  isPresentboxObject:->
    @objectType is @constructor.OBJECT_TYPE.PRESENTBOX

  getHpMax:(level = null)->
    if level is null
      Math.ceil(@constructor.hpBase * @level * @getHpMaxItemFixRate())
    else
      Math.ceil(@constructor.hpBase * level)
  getHpMaxItemFixRate:->
    1
  getHp:->
    if @hp is null or @getHpMax() < @hp
      @getHpMax()
    else if @hp <= 0
      0
    else
      @hp
  damage:(amount)->
    return false if amount <= 0
    @hp = @getHp() - amount
    @getHp()
  getLevel:(level = null)->
    if level is null
      @level
    else
      level
  setLevel:(level)->
    @level = level
  levelup:(level = 1)->
    @level += level
  getCharacterName:->
    @constructor.characterName
  getAttackType:->
    @constructor.attackTypeBase
  getAttack:(level = null)->
    if level is null
      Math.ceil(@constructor.attackBase * @level * @getAttackItemFixRate())
    else
      Math.ceil(@constructor.attackBase * level * @getAttackItemFixRate())
  getAttackItemFixRate:->
    1
  getAttackBase:->
    @constructor.attackBase
  getPDef:(level = null)->
    if level is null
      Math.ceil(@constructor.pDefBase * @level * @getPDefItemFixRate())
    else
      Math.ceil(@constructor.pDefBase * level * @getPDefItemFixRate())
  getPDefItemFixRate:->
    1
  getPDefBase:->
    @constructor.pDefBase
  getMDef:(level = null)->
    if level is null
      Math.ceil(@constructor.mDefBase * @level * @getMDefItemFixRate())
    else
      Math.ceil(@constructor.mDefBase * level * @getMDefItemFixRate())
  getMDefItemFixRate:->
    1
  getMDefBase:->
    @constructor.mDefBase
  getMove:->
    @constructor.moveBase + @getMoveItemFix()
  getMoveItemFix:->
    0
  getMoveBase:->
    @constructor.moveBase
  getRange:->
    @constructor.rangeBase + @getRangeItemFix()
  getRangeItemFix:->
    0
  getRangeBase:->
    @constructor.rangeBase
  getHitRate:->
    @constructor.hitRateBase + @getHitRateItemFix()
  getHitRateItemFix:->
    0
  getHitRateBase:->
    @constructor.hitRateBase
  getDodgeRate:->
    @constructor.dodgeRateBase + @getDodgeRateItemFix()
  getDodgeRateItemFix:->
    0
  getDodgeRateBase:->
    @constructor.dodgeRateBase
  getExp:->
    Math.ceil(@level * @constructor.expRate)
  getAbilityName:->
    @constructor.abilityName
  getAbilityDesc:->
    @constructor.abilityDesc
  getBaseImage:->
    @constructor.images[0]
  getImages:->
    @constructor.images
  getImage:(index)->
    return null unless 0 <= index < @constructor.images.length
    @constructor.images[index]
  # 指定したレベル上がるために必要な経験値量
  getNeededExp:(level)->
    targetLevel = @level + level
    baseLevel   = @level

    targetExp = (targetLevel ** 2) * @constructor.expRate
    baseExp   = (baseLevel ** 2) * @constructor.expRate
    Math.ceil(targetExp - baseExp)

  # 経験値で上げられるレベル量
  getLevelUpMax:(exp)->
    baseExp   = (@level ** 2) * @constructor.expRate
    targetExp = baseExp + exp

    Math.floor(Math.sqrt(targetExp / @constructor.expRate) - @level)

  # ダメージ計算式
  @getDamageMin:(attack, def)->
    damage = attack - def
    return 1 if damage < 1
    damage = Math.round(damage - damage * @DAMAGE_SHAKE_RATE)
    return 1 if damage < 1
    damage
  @getDamageMax:(attack, def)->
    damage = attack - def
    return 1 if damage < 1
    damage = Math.round(damage + damage * @DAMAGE_SHAKE_RATE)
    return 1 if damage < 1
    damage
  @getDamage:(attack, def)->
    Utl.rand(@getDamageMin(attack, def), @getDamageMax(attack, def))
  @getKnockoutRate:(hp, attack, def)->
    min = @getDamageMin(attack, def)
    max = @getDamageMax(attack, def)
    if hp <= min
      +Infinity
    else if hp <= max
      Math.round((max - hp + 1) / (max - min + 1) * 100)
    else
      -Infinity
  # パラメータを見た目に変換
  @status2html:(status)->
    if status is +Infinity
      '∞'
    else
      status

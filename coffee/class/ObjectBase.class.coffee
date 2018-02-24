class ObjectBase
  @OBJECT_TYPE:
    CHARACTER : 'CHARACTER'
    ENEMY : 'ENEMY'
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

  getHpMax:->
    @constructor.hpBase * @level

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
  getLevel:->
    @level
  getCharacterName:->
    @constructor.characterName
  getAttackType:->
    @constructor.attackTypeBase
  getAttack:->
    @constructor.attackBase * @level
  getAttackBase:->
    @constructor.attackBase
  getPDef:->
    @constructor.pDefBase * @level
  getPDefBase:->
    @constructor.pDefBase
  getMDef:->
    @constructor.mDefBase * @level
  getMDefBase:->
    @constructor.mDefBase
  getMove:->
    @constructor.moveBase
  getMoveBase:->
    @constructor.moveBase
  getRange:->
    @constructor.rangeBase
  getRangeBase:->
    @constructor.rangeBase
  getHitRate:->
    @constructor.hitRateBase
  getHitRateBase:->
    @constructor.hitRateBase
  getDodgeRate:->
    @constructor.dodgeRateBase
  getDodgeRateBase:->
    @constructor.dodgeRateBase
  getExp:->
    @level * @constructor.expRate
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

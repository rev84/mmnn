class ObjectBase
  @OBJECT_TYPE:
    CHARACTER : 'CHARACTER'
    ENEMY : 'ENEMY'

  constructor:(objectType)->
    @objectType = objectType

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
  getAbilityName:->
    @constructor.abilityName
  getAbilityDesc:->
    @constructor.abilityDesc
  getBaseImage:->
    @constructor.images[0]
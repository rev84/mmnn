class PresentboxBase extends ObjectBase
  constructor:(params)->
    super(ObjectBase.OBJECT_TYPE.PRESENTBOX)
    # 現在のレベル
    @level = params.level

    # 現在のHP
    @hp = params.hp

  getPDef:(level = null)->
    +Infinity
  getMDef:(level = null)->
    +Infinity
  damage:(amount)->
    return false if amount <= 0
    @hp = @getHp() - 1
    @getHp()

  getDodgeRate:->
    0
  getDodgeRateBase:->
    0
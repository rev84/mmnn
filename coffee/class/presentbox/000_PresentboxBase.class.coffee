class PresentboxBase extends ObjectBase
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 0
  # 成長率：HP
  @hpBase = 0
  # 成長率：物理防御
  @pDefBase = 0
  # 成長率：魔法防御
  @mDefBase = 0
  # 基本移動力
  @moveBase = 0
  # 基本射程
  @rangeBase = 0
  # 基本命中率
  @hitRateBase = 0
  # 必要経験値
  @expRate = 0
  # 死んだ時の台詞
  @textDeath = null

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

  gacha:->
    ;
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
  # 受取期限
  @receiveTurn = +Infinity
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 1
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  constructor:(params)->
    super(ObjectBase.OBJECT_TYPE.PRESENTBOX)
    # 現在のレベル
    @level = params.level

    # 現在のHP
    @hp = if 'hp' of params then params.hp else null

    # 残りターン
    @receiveTurn = if 'receiveTurn' of params then params.receiveTurn else @constructor.receiveTurn

  serialize:->
    {
      type: @getObjectType()
      id: @getId()
      level: @level
      hp: @hp
      receiveTurn: @receiveTurn
    }

  getId:->
    @constructor.id

  getPDef:(level = null)->
    +Infinity
  getMDef:(level = null)->
    +Infinity

  gacha:->
    ;

  getReceiveTurn:->
    @receiveTurn

  decreaseTurn:->
    @receiveTurn--
    @receiveTurn <= 0

  @getInstance:(params)->
    switch params.id
      when 1 then new PresentboxN(params)
      when 2 then new PresentboxR(params)
      when 3 then new PresentboxSR(params)
      when 4 then new PresentboxSRp(params)
      when 5 then new PresentboxSSR(params)
      when 6 then new PresentboxSSRp(params)



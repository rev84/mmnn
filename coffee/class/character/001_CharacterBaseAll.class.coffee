class SimamuraUdukiBase extends CharacterBase
  # ID
  @characterId = 1
  # キャラ名
  @characterName = "島村卯月"
  # 最初からいるか
  @defaultJoin = true
  # 画像のリスト
  @images = ["./img/character/1/1.png","./img/character/1/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 1
  # 成長率：HP
  @hpBase = 1
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 1
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 1
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数
  @itemMax = 1
  # 必要経験値
  @expRate = 1

  @abilityName = "島村卯月の能力"
  @abilityDesc = "島村卯月の説明"

  constructor:(params)->
    super(params)
class ShibuyaRinBase extends CharacterBase
  # ID
  @characterId = 2
  # キャラ名
  @characterName = "渋谷凛"
  # 最初からいるか
  @defaultJoin = true
  # 画像のリスト
  @images = ["./img/character/2/1.png","./img/character/2/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 2
  # 成長率：HP
  @hpBase = 2
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 2
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 2
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数
  @itemMax = 2
  # 必要経験値
  @expRate = 2

  @abilityName = "渋谷凛の能力"
  @abilityDesc = "渋谷凛の能力"

  constructor:(params)->
    super(params)
class RevotBase extends CharacterBase
  # ID
  @characterId = 3
  # キャラ名
  @characterName = "Revot"
  # 最初からいるか
  @defaultJoin = true
  # 画像のリスト
  @images = ["./img/character/3/1.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 3
  # 成長率：HP
  @hpBase = 3
  # 成長率：物理防御
  @pDefBase = 3
  # 成長率：魔法防御
  @mDefBase = 3
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 3
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数
  @itemMax = 3
  # 必要経験値
  @expRate = 3

  @abilityName = "れぼっとの能力"
  @abilityDesc = "れぼっとのせつめい"

  constructor:(params)->
    super(params)

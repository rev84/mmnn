class KeruberosuBase extends EnemyBase
  # ID
  @characterId = 1
  # キャラ名
  @characterName = "ケルベロス"
  # 画像のリスト
  @images = ["./img/enemy/1/1005010301_001.png","./img/enemy/1/1005010301_002.png","./img/enemy/1/1005010301_003.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 5
  # 成長率：HP
  @hpBase = 14
  # 成長率：物理防御
  @pDefBase = 4
  # 成長率：魔法防御
  @mDefBase = 3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 10
  # 出現階層
  @appearance = 1
  # 経験値係数
  @expRate = 2

  @abilityName = "なし"
  @abilityDesc = ""

  constructor:(params)->
    super(params)

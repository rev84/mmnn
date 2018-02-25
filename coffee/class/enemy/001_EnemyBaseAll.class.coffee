class KeruberosuBase extends EnemyBase
  # ID
  @characterId = 1
  # キャラ名
  @characterName = "きゃんきゃん"
  # 画像のリスト
  @images = ["./img/enemy/1/1005010301_001.png","./img/enemy/1/1005010301_002.png","./img/enemy/1/1005010301_003.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 18
  # 成長率：HP
  @hpBase = 3
  # 成長率：物理防御
  @pDefBase = 1
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
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class MeatballBase extends EnemyBase
  # ID
  @characterId = 2
  # キャラ名
  @characterName = "ミートボール"
  # 画像のリスト
  @images = ["./img/enemy/2/1036010301_001.png","./img/enemy/2/1036010301_002.png","./img/enemy/2/1036010301_003.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 17
  # 成長率：HP
  @hpBase = 2
  # 成長率：物理防御
  @pDefBase = 1
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
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class PixyFoxBase extends EnemyBase
  # ID
  @characterId = 3
  # キャラ名
  @characterName = "ピクシーFOX"
  # 画像のリスト
  @images = ["./img/enemy/3/1082010301_001.png","./img/enemy/3/1082010301_002.png","./img/enemy/3/1082010301_003.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 18
  # 成長率：HP
  @hpBase = 3
  # 成長率：物理防御
  @pDefBase = 6
  # 成長率：魔法防御
  @mDefBase = 4
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
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class MajisukoBase extends EnemyBase
  # ID
  @characterId = 4
  # キャラ名
  @characterName = "マジスコ"
  # 画像のリスト
  @images = ["./img/enemy/4/1084010301_001.png","./img/enemy/4/1084010301_002.png","./img/enemy/4/1084010301_003.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.MAGIC
  # 成長率：攻撃力
  @attackBase = 19
  # 成長率：HP
  @hpBase = 3
  # 成長率：物理防御
  @pDefBase = 7
  # 成長率：魔法防御
  @mDefBase = 4
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 10
  # 出現階層
  @appearance = 1
  # 経験値係数
  @expRate = 2

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class BakudaniwaBase extends EnemyBase
  # ID
  @characterId = 5
  # キャラ名
  @characterName = "ばくだんいわ"
  # 画像のリスト
  @images = ["./img/enemy/5/1.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 0
  # 成長率：HP
  @hpBase = 3
  # 成長率：物理防御
  @pDefBase = 8
  # 成長率：魔法防御
  @mDefBase = 8
  # 基本移動力
  @moveBase = 0
  # 基本射程
  @rangeBase = 0
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 10
  # 出現階層
  @appearance = 1
  # 経験値係数
  @expRate = 2

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)

class AkuiBase extends EnemyBase
  # ID
  @characterId = 1
  # キャラ名
  @characterName = "悪意"
  # 画像のリスト
  @images = ["./img/enemy/1/1.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 5
  # 成長率：HP
  @hpBase = 5
  # 成長率：物理防御
  @pDefBase = 5
  # 成長率：魔法防御
  @mDefBase = 5
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 5
  # 基本命中率
  @hitRateBase = 5
  # 基本回避率
  @dodgeRateBase = 5
  # 出現階層
  @appearance = 1
  # 経験値係数
  @expRate = 10

  @abilityName = "悪意"
  @abilityDesc = "悪意だ"

  constructor:(params)->
    super(params)

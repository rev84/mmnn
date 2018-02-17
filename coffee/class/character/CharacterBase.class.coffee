class TestmanBase extends CharacterBase
  constructor:->
    super()
    
    # ID
    @characterId = 1
    # 画像base64のリスト
    @imgBase64 = ["./img/character/1/1.png"]
    # 基本攻撃タイプ
    @attackTypeBase = 1
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

    @itemMax = 1

    @abilityName = "1"
    @abilityDesc = "のうりょく"
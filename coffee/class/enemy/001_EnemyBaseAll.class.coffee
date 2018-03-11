class Enemy1Base extends EnemyBase
  # ID
  @characterId = 1
  # キャラ名
  @characterName = "キモヲタくん"
  # 画像のリスト
  @images = ["./img/enemy/1/enemy_kimowota_1.png","./img/enemy/1/enemy_kimowota_2.png"]
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
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 8
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Enemy2Base extends EnemyBase
  # ID
  @characterId = 2
  # キャラ名
  @characterName = "バックバンドギタリスト"
  # 画像のリスト
  @images = ["./img/enemy/2/enemy_guitarist_1.png","./img/enemy/2/enemy_guitarist_2.png"]
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
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 8
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Enemy3Base extends EnemyBase
  # ID
  @characterId = 3
  # キャラ名
  @characterName = "女オタ"
  # 画像のリスト
  @images = ["./img/enemy/3/enemy_kona_1.png","./img/enemy/3/enemy_kona_2.png"]
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
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 8
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Enemy4Base extends EnemyBase
  # ID
  @characterId = 4
  # キャラ名
  @characterName = "ハッピオタ"
  # 画像のリスト
  @images = ["./img/enemy/4/enemy_tarako_1.png","./img/enemy/4/enemy_tarako_2.png"]
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
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 8
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Enemy5Base extends EnemyBase
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
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 8
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)

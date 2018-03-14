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
  @attackBase = 7
  # 成長率：HP
  @hpBase = 20
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
  @dodgeRateBase = 3
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
  @characterName = "ギタリスト"
  # 画像のリスト
  @images = ["./img/enemy/2/enemy_guitarist_1.png","./img/enemy/2/enemy_guitarist_2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 8
  # 成長率：HP
  @hpBase = 22
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
  @dodgeRateBase = 3
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
  @attackBase = 7
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 4
  # 成長率：魔法防御
  @mDefBase = 5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
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
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 8
  # 成長率：HP
  @hpBase = 22
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
  @dodgeRateBase = 3
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
  @characterName = "カメラくん"
  # 画像のリスト
  @images = ["./img/enemy/5/enemy_cam_1.png","./img/enemy/5/enemy_cam_2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.MAGIC
  # 成長率：攻撃力
  @attackBase = 7
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 4
  # 成長率：魔法防御
  @mDefBase = 3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
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
class Enemy6Base extends EnemyBase
  # ID
  @characterId = 6
  # キャラ名
  @characterName = "ヲタ芸（太）"
  # 画像のリスト
  @images = ["./img/enemy/6/enemy_wotageir_1.png","./img/enemy/6/enemy_wotageir_2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 30
  # 成長率：物理防御
  @pDefBase = 5
  # 成長率：魔法防御
  @mDefBase = 3
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 90
  # 基本回避率
  @dodgeRateBase = 1
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
class Enemy7Base extends EnemyBase
  # ID
  @characterId = 7
  # キャラ名
  @characterName = "ヲタ芸（細）"
  # 画像のリスト
  @images = ["./img/enemy/7/enemy_wotageiy_1.png","./img/enemy/7/enemy_wotageiy_2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 8
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 4
  # 成長率：魔法防御
  @mDefBase = 4
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
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
class Enemy8Base extends EnemyBase
  # ID
  @characterId = 8
  # キャラ名
  @characterName = "課金王"
  # 画像のリスト
  @images = ["./img/enemy/8/enemy_kakin_1.png","./img/enemy/8/enemy_kakin_2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.MAGIC
  # 成長率：攻撃力
  @attackBase = 8
  # 成長率：HP
  @hpBase = 22
  # 成長率：物理防御
  @pDefBase = 3
  # 成長率：魔法防御
  @mDefBase = 3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # 出現階層
  @appearance = 1
  # 経験値係数
  @expRate = 2
  # アイテムを落とす確率
  @itemRate = 1
  # アイテムのドロップテーブルID
  @itemTableId = 7
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 

  @abilityName = "魔法のカード"
  @abilityDesc = "よくジュエルを落とす"

  constructor:(params)->
    super(params)

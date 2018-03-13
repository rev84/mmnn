class Character1Base extends CharacterBase
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
  @attackBase = 12
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "次はもっと頑張ります！"

  @abilityName = "笑顔の魔法"
  @abilityDesc = "周囲8マスの味方の攻撃を10%上げる"

  constructor:(params)->
    super(params)
class Character2Base extends CharacterBase
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
  @attackBase = 15
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "課題、たくさん見えたよ"

  @abilityName = "蒼の波動"
  @abilityDesc = "周囲8マスの味方の回避を10%上げる"

  constructor:(params)->
    super(params)
class Character3Base extends CharacterBase
  # ID
  @characterId = 3
  # キャラ名
  @characterName = "本田未央"
  # 最初からいるか
  @defaultJoin = true
  # 画像のリスト
  @images = ["./img/character/3/1.png","./img/character/3/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "こんなんじゃ、笑えないよ…"

  @abilityName = "フレンドリー"
  @abilityDesc = "周囲8マスの味方の物防・魔防を10%上げる"

  constructor:(params)->
    super(params)
class Character4Base extends CharacterBase
  # ID
  @characterId = 4
  # キャラ名
  @characterName = "相川千夏"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/4/1.png","./img/character/4/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "相川千夏"

  @abilityName = "代官山系お洒落または語学"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character5Base extends CharacterBase
  # ID
  @characterId = 5
  # キャラ名
  @characterName = "愛野渚"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/5/1.png","./img/character/5/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "愛野渚"

  @abilityName = "バスケ部キャプテン"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character6Base extends CharacterBase
  # ID
  @characterId = 6
  # キャラ名
  @characterName = "相葉夕美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/6/1.png","./img/character/6/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "相葉夕美"

  @abilityName = "なし"
  @abilityDesc = "ターン終了時、周囲の空いているマスに花を出現させることがある"

  constructor:(params)->
    super(params)
class Character7Base extends CharacterBase
  # ID
  @characterId = 7
  # キャラ名
  @characterName = "相原雪乃"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/7/1.png","./img/character/7/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "相原雪乃"

  @abilityName = "紅茶大好きなお嬢様"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character8Base extends CharacterBase
  # ID
  @characterId = 8
  # キャラ名
  @characterName = "赤城みりあ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/8/1.png","./img/character/8/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "赤城みりあ"

  @abilityName = "みりあもやるー！"
  @abilityDesc = "行動終了後に味方が攻撃した時、1%の確率で再行動できる"

  constructor:(params)->
    super(params)
class Character9Base extends CharacterBase
  # ID
  @characterId = 9
  # キャラ名
  @characterName = "赤西瑛梨華"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/9/1.png","./img/character/9/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "赤西瑛梨華"

  @abilityName = "O・WA・RA・I"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character10Base extends CharacterBase
  # ID
  @characterId = 10
  # キャラ名
  @characterName = "浅野風香"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/10/1.png","./img/character/10/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "浅野風香"

  @abilityName = "セクシー小動物"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character11Base extends CharacterBase
  # ID
  @characterId = 11
  # キャラ名
  @characterName = "浅利七海"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/11/1.png","./img/character/11/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "浅利七海"

  @abilityName = "さかなくん"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character12Base extends CharacterBase
  # ID
  @characterId = 12
  # キャラ名
  @characterName = "アナスタシア"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/12/1.png","./img/character/12/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.7
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "アナスタシア"

  @abilityName = "星をみるひとパパがロシア人なの"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character13Base extends CharacterBase
  # ID
  @characterId = 13
  # キャラ名
  @characterName = "安部菜々"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/13/1.png","./img/character/13/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "安部菜々"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character14Base extends CharacterBase
  # ID
  @characterId = 14
  # キャラ名
  @characterName = "綾瀬穂乃香"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/14/1.png","./img/character/14/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 14
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 10
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "綾瀬穂乃香"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character15Base extends CharacterBase
  # ID
  @characterId = 15
  # キャラ名
  @characterName = "荒木比奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/15/1.png","./img/character/15/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "荒木比奈"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character16Base extends CharacterBase
  # ID
  @characterId = 16
  # キャラ名
  @characterName = "有浦柑奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/16/1.png","./img/character/16/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "有浦柑奈"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character17Base extends CharacterBase
  # ID
  @characterId = 17
  # キャラ名
  @characterName = "安斎都"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/17/1.png","./img/character/17/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "安斎都"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character18Base extends CharacterBase
  # ID
  @characterId = 18
  # キャラ名
  @characterName = "イヴ・サンタクロース"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/18/1.png","./img/character/18/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 14
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.8
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 35
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 60
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "イヴ・サンタクロース"

  @abilityName = "プレゼント"
  @abilityDesc = "プレゼントに与えるダメージが2倍になる"

  constructor:(params)->
    super(params)
class Character19Base extends CharacterBase
  # ID
  @characterId = 19
  # キャラ名
  @characterName = "五十嵐響子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/19/1.png","./img/character/19/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "五十嵐響子"

  @abilityName = "なし"
  @abilityDesc = "ターン終了時、周囲の味方のHPを回復することがある"

  constructor:(params)->
    super(params)
class Character20Base extends CharacterBase
  # ID
  @characterId = 20
  # キャラ名
  @characterName = "池袋晶葉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/20/1.png","./img/character/20/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 1.8
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 55
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "池袋晶葉"

  @abilityName = "大丈夫博士"
  @abilityDesc = "ターン開始時、周囲にいる味方一人の攻撃、物防、魔防を30%上げるか下げるかすることがある"

  constructor:(params)->
    super(params)
class Character21Base extends CharacterBase
  # ID
  @characterId = 21
  # キャラ名
  @characterName = "伊集院惠"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/21/1.png","./img/character/21/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "伊集院惠"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character22Base extends CharacterBase
  # ID
  @characterId = 22
  # キャラ名
  @characterName = "一ノ瀬志希"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/22/1.png","./img/character/22/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.8
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 4
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "一ノ瀬志希"

  @abilityName = "失踪"
  @abilityDesc = "味方ターン終了時に、ランダムなマスに移動することがある"

  constructor:(params)->
    super(params)
class Character23Base extends CharacterBase
  # ID
  @characterId = 23
  # キャラ名
  @characterName = "市原仁奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/23/1.png","./img/character/23/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "市原仁奈"

  @abilityName = "誰かのきもちになるですよ"
  @abilityDesc = "敵ターン終了時に、ランダムなステータスがフィールド内の誰かの値に変わる"

  constructor:(params)->
    super(params)
class Character24Base extends CharacterBase
  # ID
  @characterId = 24
  # キャラ名
  @characterName = "今井加奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/24/1.png","./img/character/24/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "今井加奈"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character25Base extends CharacterBase
  # ID
  @characterId = 25
  # キャラ名
  @characterName = "井村雪菜"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/25/1.png","./img/character/25/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "井村雪菜"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character26Base extends CharacterBase
  # ID
  @characterId = 26
  # キャラ名
  @characterName = "上田鈴帆"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/26/1.png","./img/character/26/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 3.5
  # 成長率：魔法防御
  @mDefBase = 3.5
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 90
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 55
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "上田鈴帆"

  @abilityName = "きぐるみ"
  @abilityDesc = "攻撃した相手の"

  constructor:(params)->
    super(params)
class Character27Base extends CharacterBase
  # ID
  @characterId = 27
  # キャラ名
  @characterName = "氏家むつみ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/27/1.png","./img/character/27/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "氏家むつみ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character28Base extends CharacterBase
  # ID
  @characterId = 28
  # キャラ名
  @characterName = "梅木音葉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/28/1.png","./img/character/28/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "梅木音葉"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character29Base extends CharacterBase
  # ID
  @characterId = 29
  # キャラ名
  @characterName = "江上椿"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/29/1.png","./img/character/29/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "江上椿"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character30Base extends CharacterBase
  # ID
  @characterId = 30
  # キャラ名
  @characterName = "衛藤美紗希"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/30/1.png","./img/character/30/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "衛藤美紗希"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character31Base extends CharacterBase
  # ID
  @characterId = 31
  # キャラ名
  @characterName = "海老原菜帆"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/31/1.png","./img/character/31/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "海老原菜帆"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character32Base extends CharacterBase
  # ID
  @characterId = 32
  # キャラ名
  @characterName = "及川雫"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/32/1.png","./img/character/32/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 20
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 45
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.3
  # 死んだ時の台詞
  @textDeath = "及川雫"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character33Base extends CharacterBase
  # ID
  @characterId = 33
  # キャラ名
  @characterName = "大石泉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/33/1.png","./img/character/33/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.3
  # 死んだ時の台詞
  @textDeath = "大石泉"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character34Base extends CharacterBase
  # ID
  @characterId = 34
  # キャラ名
  @characterName = "太田優"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/34/1.png","./img/character/34/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "太田優"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character35Base extends CharacterBase
  # ID
  @characterId = 35
  # キャラ名
  @characterName = "大槻唯"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/35/1.png","./img/character/35/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "大槻唯"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character36Base extends CharacterBase
  # ID
  @characterId = 36
  # キャラ名
  @characterName = "大西由里子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/36/1.png","./img/character/36/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "大西由里子"

  @abilityName = "なし"
  @abilityDesc = "ターン開始時、別の敵に隣接している敵の3マス以内にいると、物防・魔防が10%上がることがある"

  constructor:(params)->
    super(params)
class Character37Base extends CharacterBase
  # ID
  @characterId = 37
  # キャラ名
  @characterName = "大沼くるみ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/37/1.png","./img/character/37/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "大沼くるみ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character38Base extends CharacterBase
  # ID
  @characterId = 38
  # キャラ名
  @characterName = "大原みちる"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/38/1.png","./img/character/38/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "大原みちる"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character39Base extends CharacterBase
  # ID
  @characterId = 39
  # キャラ名
  @characterName = "岡崎泰葉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/39/1.png","./img/character/39/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "岡崎泰葉"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character40Base extends CharacterBase
  # ID
  @characterId = 40
  # キャラ名
  @characterName = "緒方智絵里"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/40/1.png","./img/character/40/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "緒方智絵里"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character41Base extends CharacterBase
  # ID
  @characterId = 41
  # キャラ名
  @characterName = "奥山沙織"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/41/1.png","./img/character/41/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "奥山沙織"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character42Base extends CharacterBase
  # ID
  @characterId = 42
  # キャラ名
  @characterName = "乙倉悠貴"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/42/1.png","./img/character/42/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "乙倉悠貴"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character43Base extends CharacterBase
  # ID
  @characterId = 43
  # キャラ名
  @characterName = "片桐早苗"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/43/1.png","./img/character/43/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "片桐早苗"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character44Base extends CharacterBase
  # ID
  @characterId = 44
  # キャラ名
  @characterName = "上条春菜"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/44/1.png","./img/character/44/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "上条春菜"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character45Base extends CharacterBase
  # ID
  @characterId = 45
  # キャラ名
  @characterName = "神谷奈緒"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/45/1.png","./img/character/45/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "神谷奈緒"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character46Base extends CharacterBase
  # ID
  @characterId = 46
  # キャラ名
  @characterName = "川島瑞樹"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/46/1.png","./img/character/46/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "川島瑞樹"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character47Base extends CharacterBase
  # ID
  @characterId = 47
  # キャラ名
  @characterName = "神崎蘭子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/47/1.png","./img/character/47/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 14
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 90
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "神崎蘭子"

  @abilityName = "黒魔術"
  @abilityDesc = "攻撃した敵を一撃で倒すことがある"

  constructor:(params)->
    super(params)
class Character48Base extends CharacterBase
  # ID
  @characterId = 48
  # キャラ名
  @characterName = "岸部彩華"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/48/1.png","./img/character/48/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "岸部彩華"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character49Base extends CharacterBase
  # ID
  @characterId = 49
  # キャラ名
  @characterName = "北川真尋"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/49/1.png","./img/character/49/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "北川真尋"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character50Base extends CharacterBase
  # ID
  @characterId = 50
  # キャラ名
  @characterName = "喜多日菜子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/50/1.png","./img/character/50/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "喜多日菜子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character51Base extends CharacterBase
  # ID
  @characterId = 51
  # キャラ名
  @characterName = "喜多見柚"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/51/1.png","./img/character/51/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "喜多見柚"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character52Base extends CharacterBase
  # ID
  @characterId = 52
  # キャラ名
  @characterName = "木場真奈美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/52/1.png","./img/character/52/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 97
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 15
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 30
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "木場真奈美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character53Base extends CharacterBase
  # ID
  @characterId = 53
  # キャラ名
  @characterName = "木村夏樹"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/53/1.png","./img/character/53/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "木村夏樹"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character54Base extends CharacterBase
  # ID
  @characterId = 54
  # キャラ名
  @characterName = "キャシー・グラハム"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/54/1.png","./img/character/54/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "キャシー・グラハム"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character55Base extends CharacterBase
  # ID
  @characterId = 55
  # キャラ名
  @characterName = "桐野アヤ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/55/1.png","./img/character/55/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "桐野アヤ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character56Base extends CharacterBase
  # ID
  @characterId = 56
  # キャラ名
  @characterName = "桐生つかさ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/56/1.png","./img/character/56/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "桐生つかさ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character57Base extends CharacterBase
  # ID
  @characterId = 57
  # キャラ名
  @characterName = "日下部若葉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/57/1.png","./img/character/57/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "日下部若葉"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character58Base extends CharacterBase
  # ID
  @characterId = 58
  # キャラ名
  @characterName = "工藤忍"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/58/1.png","./img/character/58/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "工藤忍"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character59Base extends CharacterBase
  # ID
  @characterId = 59
  # キャラ名
  @characterName = "クラリス"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/59/1.png","./img/character/59/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "クラリス"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character60Base extends CharacterBase
  # ID
  @characterId = 60
  # キャラ名
  @characterName = "栗原ネネ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/60/1.png","./img/character/60/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "栗原ネネ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character61Base extends CharacterBase
  # ID
  @characterId = 61
  # キャラ名
  @characterName = "黒川千秋"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/61/1.png","./img/character/61/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "黒川千秋"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character62Base extends CharacterBase
  # ID
  @characterId = 62
  # キャラ名
  @characterName = "ケイト"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/62/1.png","./img/character/62/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "ケイト"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character63Base extends CharacterBase
  # ID
  @characterId = 63
  # キャラ名
  @characterName = "古賀小春"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/63/1.png","./img/character/63/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "古賀小春"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character64Base extends CharacterBase
  # ID
  @characterId = 64
  # キャラ名
  @characterName = "輿水幸子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/64/1.png","./img/character/64/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "輿水幸子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character65Base extends CharacterBase
  # ID
  @characterId = 65
  # キャラ名
  @characterName = "小関麗奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/65/1.png","./img/character/65/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "小関麗奈"

  @abilityName = "いたずら"
  @abilityDesc = "味方ターン開始時に、10%の確率で周囲4マスのどこかに岩を置く"

  constructor:(params)->
    super(params)
class Character66Base extends CharacterBase
  # ID
  @characterId = 66
  # キャラ名
  @characterName = "小早川紗枝"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = ["./img/character/66/1.png","./img/character/66/2.png"]
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "小早川紗枝"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character67Base extends CharacterBase
  # ID
  @characterId = 67
  # キャラ名
  @characterName = "秋月律子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 99
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 50
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "秋月律子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character68Base extends CharacterBase
  # ID
  @characterId = 68
  # キャラ名
  @characterName = "秋月涼"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "秋月涼"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character69Base extends CharacterBase
  # ID
  @characterId = 69
  # キャラ名
  @characterName = "天海春香"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "天海春香"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character70Base extends CharacterBase
  # ID
  @characterId = 70
  # キャラ名
  @characterName = "我那覇響"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "我那覇響"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character71Base extends CharacterBase
  # ID
  @characterId = 71
  # キャラ名
  @characterName = "菊地真"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 19
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "菊地真"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character72Base extends CharacterBase
  # ID
  @characterId = 72
  # キャラ名
  @characterName = "如月千早"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 18
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.8
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "如月千早"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character73Base extends CharacterBase
  # ID
  @characterId = 73
  # キャラ名
  @characterName = "小日向美穂"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "小日向美穂"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character74Base extends CharacterBase
  # ID
  @characterId = 74
  # キャラ名
  @characterName = "小松伊吹"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "小松伊吹"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character75Base extends CharacterBase
  # ID
  @characterId = 75
  # キャラ名
  @characterName = "小室千奈美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "小室千奈美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character76Base extends CharacterBase
  # ID
  @characterId = 76
  # キャラ名
  @characterName = "西園寺琴歌"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 35
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "西園寺琴歌"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character77Base extends CharacterBase
  # ID
  @characterId = 77
  # キャラ名
  @characterName = "財前時子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 21
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 21
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "財前時子"

  @abilityName = "愛のムチ"
  @abilityDesc = "時子が攻撃した敵は、このターン以降、なるべく時子に近づこうとする"

  constructor:(params)->
    super(params)
class Character78Base extends CharacterBase
  # ID
  @characterId = 78
  # キャラ名
  @characterName = "斉藤洋子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "斉藤洋子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character79Base extends CharacterBase
  # ID
  @characterId = 79
  # キャラ名
  @characterName = "冴島清美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.8
  # 成長率：魔法防御
  @mDefBase = 1.3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "冴島清美"

  @abilityName = "風紀"
  @abilityDesc = "すべてのユニットの特殊能力を無効化する"

  constructor:(params)->
    super(params)
class Character80Base extends CharacterBase
  # ID
  @characterId = 80
  # キャラ名
  @characterName = "榊原里美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "榊原里美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character81Base extends CharacterBase
  # ID
  @characterId = 81
  # キャラ名
  @characterName = "鷺沢文香"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 14
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 2
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 88
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 35
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "鷺沢文香"

  @abilityName = "なし"
  @abilityDesc = "装備したアイテムの効果が倍になる"

  constructor:(params)->
    super(params)
class Character82Base extends CharacterBase
  # ID
  @characterId = 82
  # キャラ名
  @characterName = "佐久間まゆ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "佐久間まゆ"

  @abilityName = "恐怖"
  @abilityDesc = "まゆが攻撃した敵は、次のターン、移動力が+1され、なるべくまゆから遠ざかろうとする"

  constructor:(params)->
    super(params)
class Character83Base extends CharacterBase
  # ID
  @characterId = 83
  # キャラ名
  @characterName = "櫻井桃華"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "櫻井桃華"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character84Base extends CharacterBase
  # ID
  @characterId = 84
  # キャラ名
  @characterName = "佐々木千枝"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "佐々木千枝"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character85Base extends CharacterBase
  # ID
  @characterId = 85
  # キャラ名
  @characterName = "佐城雪美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "佐城雪美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character86Base extends CharacterBase
  # ID
  @characterId = 86
  # キャラ名
  @characterName = "佐藤心"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "佐藤心"

  @abilityName = "キャラ付け"
  @abilityDesc = "HPが50%以上ある時、攻撃が30%上がる"

  constructor:(params)->
    super(params)
class Character87Base extends CharacterBase
  # ID
  @characterId = 87
  # キャラ名
  @characterName = "沢田麻理菜"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "沢田麻理菜"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character88Base extends CharacterBase
  # ID
  @characterId = 88
  # キャラ名
  @characterName = "椎名法子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "椎名法子"

  @abilityName = "ドーナツ配布"
  @abilityDesc = "周囲8マスの味方のHPを10%回復することがある"

  constructor:(params)->
    super(params)
class Character89Base extends CharacterBase
  # ID
  @characterId = 89
  # キャラ名
  @characterName = "塩見周子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.3
  # 死んだ時の台詞
  @textDeath = "塩見周子"

  @abilityName = "気まぐれ"
  @abilityDesc = "ターン開始時、HPが10%回復するか、5%のダメージを受ける"

  constructor:(params)->
    super(params)
class Character90Base extends CharacterBase
  # ID
  @characterId = 90
  # キャラ名
  @characterName = "四条貴音"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "四条貴音"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character91Base extends CharacterBase
  # ID
  @characterId = 91
  # キャラ名
  @characterName = "篠原礼"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "篠原礼"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character92Base extends CharacterBase
  # ID
  @characterId = 92
  # キャラ名
  @characterName = "首藤葵"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "首藤葵"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character93Base extends CharacterBase
  # ID
  @characterId = 93
  # キャラ名
  @characterName = "城ヶ崎美嘉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "城ヶ崎美嘉"

  @abilityName = "姉妹"
  @abilityDesc = "城ヶ崎莉嘉が出撃している間、物防が2倍になり、移動、射程が1上がる"

  constructor:(params)->
    super(params)
class Character94Base extends CharacterBase
  # ID
  @characterId = 94
  # キャラ名
  @characterName = "城ヶ崎莉嘉"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "城ヶ崎莉嘉"

  @abilityName = "姉妹"
  @abilityDesc = "城ヶ崎美嘉が出撃している間、魔防が2倍になり、移動、射程が1上がる"

  constructor:(params)->
    super(params)
class Character95Base extends CharacterBase
  # ID
  @characterId = 95
  # キャラ名
  @characterName = "白菊ほたる"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.8
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 0
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "白菊ほたる"

  @abilityName = "不幸"
  @abilityDesc = "味方が攻撃を受ける時、代わりに攻撃されることがある"

  constructor:(params)->
    super(params)
class Character96Base extends CharacterBase
  # ID
  @characterId = 96
  # キャラ名
  @characterName = "白坂小梅"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 2.5
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "白坂小梅"

  @abilityName = "あの子が遊びにきた"
  @abilityDesc = "敵ターンの間だけ、自身の周囲のマスにランダムで攻撃不可のユニットが出現する"

  constructor:(params)->
    super(params)
class Character97Base extends CharacterBase
  # ID
  @characterId = 97
  # キャラ名
  @characterName = "杉坂海"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "杉坂海"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character98Base extends CharacterBase
  # ID
  @characterId = 98
  # キャラ名
  @characterName = "涼宮星花"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "涼宮星花"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character99Base extends CharacterBase
  # ID
  @characterId = 99
  # キャラ名
  @characterName = "関裕美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "関裕美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character100Base extends CharacterBase
  # ID
  @characterId = 100
  # キャラ名
  @characterName = "瀬名詩織"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "瀬名詩織"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character101Base extends CharacterBase
  # ID
  @characterId = 101
  # キャラ名
  @characterName = "仙崎恵磨"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 16
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 98
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "仙崎恵磨"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character102Base extends CharacterBase
  # ID
  @characterId = 102
  # キャラ名
  @characterName = "相馬夏美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "相馬夏美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character103Base extends CharacterBase
  # ID
  @characterId = 103
  # キャラ名
  @characterName = "高垣楓"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 16
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 99
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 4.4
  # 死んだ時の台詞
  @textDeath = "高垣楓"

  @abilityName = "歌姫"
  @abilityDesc = "攻撃した敵の周囲の敵にもダメージ、味方を回復する"

  constructor:(params)->
    super(params)
class Character104Base extends CharacterBase
  # ID
  @characterId = 104
  # キャラ名
  @characterName = "高槻やよい"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "高槻やよい"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character105Base extends CharacterBase
  # ID
  @characterId = 105
  # キャラ名
  @characterName = "高橋礼子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "高橋礼子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character106Base extends CharacterBase
  # ID
  @characterId = 106
  # キャラ名
  @characterName = "鷹富士茄子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.7
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 88
  # 基本回避率
  @dodgeRateBase = 15
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "鷹富士茄子"

  @abilityName = "幸運"
  @abilityDesc = "攻撃したプレゼントのランクが1上がる"

  constructor:(params)->
    super(params)
class Character107Base extends CharacterBase
  # ID
  @characterId = 107
  # キャラ名
  @characterName = "高峯のあ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 96
  # 基本回避率
  @dodgeRateBase = 4
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "高峯のあ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character108Base extends CharacterBase
  # ID
  @characterId = 108
  # キャラ名
  @characterName = "高森藍子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.7
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "高森藍子"

  @abilityName = "ゆるふわ時間"
  @abilityDesc = "攻撃した相手を行動終了にすることがある"

  constructor:(params)->
    super(params)
class Character109Base extends CharacterBase
  # ID
  @characterId = 109
  # キャラ名
  @characterName = "多田李衣菜"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "多田李衣菜"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character110Base extends CharacterBase
  # ID
  @characterId = 110
  # キャラ名
  @characterName = "橘ありす"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 94
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "橘ありす"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character111Base extends CharacterBase
  # ID
  @characterId = 111
  # キャラ名
  @characterName = "月宮雅"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "月宮雅"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character112Base extends CharacterBase
  # ID
  @characterId = 112
  # キャラ名
  @characterName = "土屋亜子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "土屋亜子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character113Base extends CharacterBase
  # ID
  @characterId = 113
  # キャラ名
  @characterName = "東郷あい"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "東郷あい"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character114Base extends CharacterBase
  # ID
  @characterId = 114
  # キャラ名
  @characterName = "道明寺歌鈴"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 6
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 90
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "道明寺歌鈴"

  @abilityName = "ドジ"
  @abilityDesc = "移動後、周囲の味方・敵にダメージを与えることがある"

  constructor:(params)->
    super(params)
class Character115Base extends CharacterBase
  # ID
  @characterId = 115
  # キャラ名
  @characterName = "十時愛梨"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 22
  # 成長率：物理防御
  @pDefBase = 1.8
  # 成長率：魔法防御
  @mDefBase = 1.8
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "十時愛梨"

  @abilityName = "すぐ脱ぐ"
  @abilityDesc = "ターン開始時、物防と魔防が10%下がることがある"

  constructor:(params)->
    super(params)
class Character116Base extends CharacterBase
  # ID
  @characterId = 116
  # キャラ名
  @characterName = "長富蓮実"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "長富蓮実"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character117Base extends CharacterBase
  # ID
  @characterId = 117
  # キャラ名
  @characterName = "中野有香"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 18
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 98
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "中野有香"

  @abilityName = "会心の一撃"
  @abilityDesc = "攻撃時、敵の防御力を無視することがある"

  constructor:(params)->
    super(params)
class Character118Base extends CharacterBase
  # ID
  @characterId = 118
  # キャラ名
  @characterName = "ナターリア"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "ナターリア"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character119Base extends CharacterBase
  # ID
  @characterId = 119
  # キャラ名
  @characterName = "並木芽衣子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "並木芽衣子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character120Base extends CharacterBase
  # ID
  @characterId = 120
  # キャラ名
  @characterName = "成宮由愛"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "成宮由愛"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character121Base extends CharacterBase
  # ID
  @characterId = 121
  # キャラ名
  @characterName = "南条光"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "南条光"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character122Base extends CharacterBase
  # ID
  @characterId = 122
  # キャラ名
  @characterName = "難波笑美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "難波笑美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character123Base extends CharacterBase
  # ID
  @characterId = 123
  # キャラ名
  @characterName = "西川保奈美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "西川保奈美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character124Base extends CharacterBase
  # ID
  @characterId = 124
  # キャラ名
  @characterName = "西島櫂"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "西島櫂"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character125Base extends CharacterBase
  # ID
  @characterId = 125
  # キャラ名
  @characterName = "新田美波"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 96
  # 基本回避率
  @dodgeRateBase = 4
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "新田美波"

  @abilityName = "万能"
  @abilityDesc = "ターン終了時、ランダムなステータスが10%上昇する（フィールドから出ると戻る）"

  constructor:(params)->
    super(params)
class Character126Base extends CharacterBase
  # ID
  @characterId = 126
  # キャラ名
  @characterName = "二宮飛鳥"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.6
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 4
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "二宮飛鳥"

  @abilityName = "孤高"
  @abilityDesc = "ターン開始時、周りにユニットがいなければ、そのターン、全ステータスが10%上がる"

  constructor:(params)->
    super(params)
class Character127Base extends CharacterBase
  # ID
  @characterId = 127
  # キャラ名
  @characterName = "丹羽仁美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "丹羽仁美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character128Base extends CharacterBase
  # ID
  @characterId = 128
  # キャラ名
  @characterName = "野々村そら"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "野々村そら"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character129Base extends CharacterBase
  # ID
  @characterId = 129
  # キャラ名
  @characterName = "萩原雪歩"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "萩原雪歩"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character130Base extends CharacterBase
  # ID
  @characterId = 130
  # キャラ名
  @characterName = "服部瞳子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "服部瞳子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character131Base extends CharacterBase
  # ID
  @characterId = 131
  # キャラ名
  @characterName = "浜川愛結奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "浜川愛結奈"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character132Base extends CharacterBase
  # ID
  @characterId = 132
  # キャラ名
  @characterName = "浜口あやめ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 11
  # 成長率：物理防御
  @pDefBase = 0.8
  # 成長率：魔法防御
  @mDefBase = 0.8
  # 基本移動力
  @moveBase = 6
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 97
  # 基本回避率
  @dodgeRateBase = 35
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "浜口あやめ"

  @abilityName = "忍法変わり身の術"
  @abilityDesc = "回避時に、味方と入れ替わることがある"

  constructor:(params)->
    super(params)
class Character133Base extends CharacterBase
  # ID
  @characterId = 133
  # キャラ名
  @characterName = "早坂美玲"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "早坂美玲"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character134Base extends CharacterBase
  # ID
  @characterId = 134
  # キャラ名
  @characterName = "速水奏"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 97
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "速水奏"

  @abilityName = "ムーンサイド"
  @abilityDesc = "味方ターン終了時、最大HPとHPの差がHPになることがある"

  constructor:(params)->
    super(params)
class Character135Base extends CharacterBase
  # ID
  @characterId = 135
  # キャラ名
  @characterName = "原田美世"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 6
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.8
  # 死んだ時の台詞
  @textDeath = "原田美世"

  @abilityName = "なし"
  @abilityDesc = "再行動することがある"

  constructor:(params)->
    super(params)
class Character136Base extends CharacterBase
  # ID
  @characterId = 136
  # キャラ名
  @characterName = "柊志乃"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "柊志乃"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character137Base extends CharacterBase
  # ID
  @characterId = 137
  # キャラ名
  @characterName = "日高愛"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "日高愛"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character138Base extends CharacterBase
  # ID
  @characterId = 138
  # キャラ名
  @characterName = "日野茜"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 2.5
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "日野茜"

  @abilityName = "全力疾走"
  @abilityDesc = "移動後に攻撃をせずに行動終了した時、20%の確率でもう一度行動できる"

  constructor:(params)->
    super(params)
class Character139Base extends CharacterBase
  # ID
  @characterId = 139
  # キャラ名
  @characterName = "姫川友紀"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 96
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "姫川友紀"

  @abilityName = "かっとばせー"
  @abilityDesc = "ターン開始時、隣接している味方をランダムなマスに飛ばすことがある"

  constructor:(params)->
    super(params)
class Character140Base extends CharacterBase
  # ID
  @characterId = 140
  # キャラ名
  @characterName = "兵藤レナ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "兵藤レナ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character141Base extends CharacterBase
  # ID
  @characterId = 141
  # キャラ名
  @characterName = "福山舞"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "福山舞"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character142Base extends CharacterBase
  # ID
  @characterId = 142
  # キャラ名
  @characterName = "藤居朋"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "藤居朋"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character143Base extends CharacterBase
  # ID
  @characterId = 143
  # キャラ名
  @characterName = "藤本里奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 3
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "藤本里奈"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character144Base extends CharacterBase
  # ID
  @characterId = 144
  # キャラ名
  @characterName = "藤原肇"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "藤原肇"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character145Base extends CharacterBase
  # ID
  @characterId = 145
  # キャラ名
  @characterName = "双葉杏"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 8
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 2.5
  # 成長率：魔法防御
  @mDefBase = 2.5
  # 基本移動力
  @moveBase = 0
  # 基本射程
  @rangeBase = 20
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 0
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "双葉杏"

  @abilityName = "印税"
  @abilityDesc = "ターン終了時に出撃していると、階層✕3の経験値を得る"

  constructor:(params)->
    super(params)
class Character146Base extends CharacterBase
  # ID
  @characterId = 146
  # キャラ名
  @characterName = "双海亜美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 7
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "双海亜美"

  @abilityName = "双子"
  @abilityDesc = "双海真美が出撃している場合、味方ターン開始時に、HPが二人のうちどちらか高い方になる"

  constructor:(params)->
    super(params)
class Character147Base extends CharacterBase
  # ID
  @characterId = 147
  # キャラ名
  @characterName = "双海真美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 96
  # 基本回避率
  @dodgeRateBase = 6
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "双海真美"

  @abilityName = "双子"
  @abilityDesc = "双海亜美が出撃している場合、味方ターン開始時に、HPが二人のうちどちらか高い方になる"

  constructor:(params)->
    super(params)
class Character148Base extends CharacterBase
  # ID
  @characterId = 148
  # キャラ名
  @characterName = "古澤頼子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "古澤頼子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character149Base extends CharacterBase
  # ID
  @characterId = 149
  # キャラ名
  @characterName = "ヘレン"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 0
  # 成長率：HP
  @hpBase = 30
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 0
  # 基本命中率
  @hitRateBase = 0
  # 基本回避率
  @dodgeRateBase = 0
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 35
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "ヘレン"

  @abilityName = "世界のヘレン"
  @abilityDesc = "ターン開始時、HPが全回復することがある"

  constructor:(params)->
    super(params)
class Character150Base extends CharacterBase
  # ID
  @characterId = 150
  # キャラ名
  @characterName = "北条加蓮"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 11
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 2.3
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "北条加蓮"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character151Base extends CharacterBase
  # ID
  @characterId = 151
  # キャラ名
  @characterName = "星井美希"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "星井美希"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character152Base extends CharacterBase
  # ID
  @characterId = 152
  # キャラ名
  @characterName = "星輝子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "星輝子"

  @abilityName = "インキャ"
  @abilityDesc = "上か下の壁際で行動終了した時、再行動することがある"

  constructor:(params)->
    super(params)
class Character153Base extends CharacterBase
  # ID
  @characterId = 153
  # キャラ名
  @characterName = "堀裕子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 2
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 70
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "堀裕子"

  @abilityName = "サイキック"
  @abilityDesc = "攻撃が命中した敵を好きな場所に移動することができる"

  constructor:(params)->
    super(params)
class Character154Base extends CharacterBase
  # ID
  @characterId = 154
  # キャラ名
  @characterName = "前川みく"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 1.3
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 8
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "前川みく"

  @abilityName = "なし"
  @abilityDesc = "味方が敵からの攻撃を回避した時に、その敵に反撃する"

  constructor:(params)->
    super(params)
class Character155Base extends CharacterBase
  # ID
  @characterId = 155
  # キャラ名
  @characterName = "槙原志保"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "槙原志保"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character156Base extends CharacterBase
  # ID
  @characterId = 156
  # キャラ名
  @characterName = "松尾千鶴"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "松尾千鶴"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character157Base extends CharacterBase
  # ID
  @characterId = 157
  # キャラ名
  @characterName = "松永涼"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.8
  # 成長率：魔法防御
  @mDefBase = 1.3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "松永涼"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character158Base extends CharacterBase
  # ID
  @characterId = 158
  # キャラ名
  @characterName = "松原早耶"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "松原早耶"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character159Base extends CharacterBase
  # ID
  @characterId = 159
  # キャラ名
  @characterName = "松本沙理奈"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "松本沙理奈"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character160Base extends CharacterBase
  # ID
  @characterId = 160
  # キャラ名
  @characterName = "松山久美子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "松山久美子"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character161Base extends CharacterBase
  # ID
  @characterId = 161
  # キャラ名
  @characterName = "的場梨沙"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "的場梨沙"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character162Base extends CharacterBase
  # ID
  @characterId = 162
  # キャラ名
  @characterName = "間中美里"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "間中美里"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character163Base extends CharacterBase
  # ID
  @characterId = 163
  # キャラ名
  @characterName = "真鍋いつき"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 15
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 1.8
  # 成長率：魔法防御
  @mDefBase = 1.3
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "真鍋いつき"

  @abilityName = "なし"
  @abilityDesc = "行動後、再行動できることがある"

  constructor:(params)->
    super(params)
class Character164Base extends CharacterBase
  # ID
  @characterId = 164
  # キャラ名
  @characterName = "三浦あずさ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.3
  # 死んだ時の台詞
  @textDeath = "三浦あずさ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character165Base extends CharacterBase
  # ID
  @characterId = 165
  # キャラ名
  @characterName = "水木聖來"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "水木聖來"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character166Base extends CharacterBase
  # ID
  @characterId = 166
  # キャラ名
  @characterName = "水谷絵理"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "水谷絵理"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character167Base extends CharacterBase
  # ID
  @characterId = 167
  # キャラ名
  @characterName = "水野翠"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.2
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 6
  # 基本命中率
  @hitRateBase = 90
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "水野翠"

  @abilityName = "貫通の矢"
  @abilityDesc = "攻撃を外した時、その敵より後ろにいる敵全員にダメージを与える"

  constructor:(params)->
    super(params)
class Character168Base extends CharacterBase
  # ID
  @characterId = 168
  # キャラ名
  @characterName = "水本ゆかり"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "水本ゆかり"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character169Base extends CharacterBase
  # ID
  @characterId = 169
  # キャラ名
  @characterName = "水瀬伊織"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "水瀬伊織"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character170Base extends CharacterBase
  # ID
  @characterId = 170
  # キャラ名
  @characterName = "三船美優"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "三船美優"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character171Base extends CharacterBase
  # ID
  @characterId = 171
  # キャラ名
  @characterName = "三村かな子"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 24
  # 成長率：物理防御
  @pDefBase = 3.5
  # 成長率：魔法防御
  @mDefBase = 2.5
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "三村かな子"

  @abilityName = "なし"
  @abilityDesc = "最大HPの50%以上のダメージを受けてHPが0になった時、一度だけHP1で耐える"

  constructor:(params)->
    super(params)
class Character172Base extends CharacterBase
  # ID
  @characterId = 172
  # キャラ名
  @characterName = "宮本フレデリカ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 14
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "宮本フレデリカ"

  @abilityName = "なし"
  @abilityDesc = "ターン開始時、攻撃タイプがランダムに変化する"

  constructor:(params)->
    super(params)
class Character173Base extends CharacterBase
  # ID
  @characterId = 173
  # キャラ名
  @characterName = "三好紗南"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "三好紗南"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character174Base extends CharacterBase
  # ID
  @characterId = 174
  # キャラ名
  @characterName = "向井拓海"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 23
  # 成長率：HP
  @hpBase = 22
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 91
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "向井拓海"

  @abilityName = "喧嘩上等"
  @abilityDesc = "敵の攻撃を寄せつける"

  constructor:(params)->
    super(params)
class Character175Base extends CharacterBase
  # ID
  @characterId = 175
  # キャラ名
  @characterName = "棟方愛海"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.3
  # 死んだ時の台詞
  @textDeath = "棟方愛海"

  @abilityName = "登山"
  @abilityDesc = "ターン開始時、周りに味方の数に応じてHPが回復する"

  constructor:(params)->
    super(params)
class Character176Base extends CharacterBase
  # ID
  @characterId = 176
  # キャラ名
  @characterName = "村上巴"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 17
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.6
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "村上巴"

  @abilityName = "喝！"
  @abilityDesc = "行動終了時、周りの行動終了済みの味方を再行動させることがある"

  constructor:(params)->
    super(params)
class Character177Base extends CharacterBase
  # ID
  @characterId = 177
  # キャラ名
  @characterName = "村松さくら"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "村松さくら"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character178Base extends CharacterBase
  # ID
  @characterId = 178
  # キャラ名
  @characterName = "メアリー・コクラン"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "メアリー・コクラン"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character179Base extends CharacterBase
  # ID
  @characterId = 179
  # キャラ名
  @characterName = "持田亜里沙"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "持田亜里沙"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character180Base extends CharacterBase
  # ID
  @characterId = 180
  # キャラ名
  @characterName = "望月聖"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "望月聖"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character181Base extends CharacterBase
  # ID
  @characterId = 181
  # キャラ名
  @characterName = "桃井あずき"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.2
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "桃井あずき"

  @abilityName = "呉服"
  @abilityDesc = "ターン開始時、物防・魔防が10%上がる"

  constructor:(params)->
    super(params)
class Character182Base extends CharacterBase
  # ID
  @characterId = 182
  # キャラ名
  @characterName = "森久保乃々"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 9
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 2
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 3
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "森久保乃々"

  @abilityName = "む～り～"
  @abilityDesc = "敵ターン終了時、周りに3体以上のユニットがいる時、マップ左端のランダムなマスにワープする"

  constructor:(params)->
    super(params)
class Character183Base extends CharacterBase
  # ID
  @characterId = 183
  # キャラ名
  @characterName = "諸星きらり"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 18
  # 成長率：HP
  @hpBase = 23
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 2.3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 2
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "諸星きらり"

  @abilityName = "きらりん☆ストロング"
  @abilityDesc = "最大HPの50%以上のダメージを受けてHPが0になった時、一度だけHP1で耐える。"

  constructor:(params)->
    super(params)
class Character184Base extends CharacterBase
  # ID
  @characterId = 184
  # キャラ名
  @characterName = "楊菲菲"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 16
  # 成長率：HP
  @hpBase = 10
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 10
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "楊菲菲"

  @abilityName = "カンフー"
  @abilityDesc = "最大HP以上のダメージを受ける時、10%の確率で回避する"

  constructor:(params)->
    super(params)
class Character185Base extends CharacterBase
  # ID
  @characterId = 185
  # キャラ名
  @characterName = "八神マキノ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 18
  # 成長率：物理防御
  @pDefBase = 1.7
  # 成長率：魔法防御
  @mDefBase = 1.9
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "八神マキノ"

  @abilityName = "諜報"
  @abilityDesc = "自分が攻撃する時を除き、周囲にいる敵が受けるダメージが2倍になる"

  constructor:(params)->
    super(params)
class Character186Base extends CharacterBase
  # ID
  @characterId = 186
  # キャラ名
  @characterName = "矢口美羽"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "矢口美羽"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character187Base extends CharacterBase
  # ID
  @characterId = 187
  # キャラ名
  @characterName = "柳清良"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 7
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 0.9
  # 成長率：魔法防御
  @mDefBase = 1.2
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 90
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 27
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.4
  # 死んだ時の台詞
  @textDeath = "柳清良"

  @abilityName = "看護"
  @abilityDesc = "ターンごとのHP減少を半分にする"

  constructor:(params)->
    super(params)
class Character188Base extends CharacterBase
  # ID
  @characterId = 188
  # キャラ名
  @characterName = "柳瀬美由紀"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "柳瀬美由紀"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character189Base extends CharacterBase
  # ID
  @characterId = 189
  # キャラ名
  @characterName = "大和亜季"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 19
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 5
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 68
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "大和亜季"

  @abilityName = "掃射"
  @abilityDesc = "攻撃時、周囲8マスの味方、敵にも同じダメージを与えることがある"

  constructor:(params)->
    super(params)
class Character190Base extends CharacterBase
  # ID
  @characterId = 190
  # キャラ名
  @characterName = "結城晴"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 16
  # 成長率：HP
  @hpBase = 16
  # 成長率：物理防御
  @pDefBase = 1.4
  # 成長率：魔法防御
  @mDefBase = 1.4
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 5
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "結城晴"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character191Base extends CharacterBase
  # ID
  @characterId = 191
  # キャラ名
  @characterName = "遊佐こずえ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 10
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 3.5
  # 基本移動力
  @moveBase = 3
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 88
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "遊佐こずえ"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character192Base extends CharacterBase
  # ID
  @characterId = 192
  # キャラ名
  @characterName = "横山千佳"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 13
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 4.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 4
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 23
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "横山千佳"

  @abilityName = "魔法知識"
  @abilityDesc = "魔法攻撃を受ける時、回避率が5倍になる"

  constructor:(params)->
    super(params)
class Character193Base extends CharacterBase
  # ID
  @characterId = 193
  # キャラ名
  @characterName = "吉岡沙紀"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "吉岡沙紀"

  @abilityName = "ペイント"
  @abilityDesc = "味方ターン開始時、周囲の敵をランダムな別の敵に変化させることがある"

  constructor:(params)->
    super(params)
class Character194Base extends CharacterBase
  # ID
  @characterId = 194
  # キャラ名
  @characterName = "依田芳乃"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 2
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "依田芳乃"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character195Base extends CharacterBase
  # ID
  @characterId = 195
  # キャラ名
  @characterName = "ライラ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 11
  # 成長率：HP
  @hpBase = 12
  # 成長率：物理防御
  @pDefBase = 1
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 21
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.2
  # 死んだ時の台詞
  @textDeath = "ライラ"

  @abilityName = "節約"
  @abilityDesc = "レベルが上がりやすい"

  constructor:(params)->
    super(params)
class Character196Base extends CharacterBase
  # ID
  @characterId = 196
  # キャラ名
  @characterName = "龍崎薫"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 12
  # 成長率：HP
  @hpBase = 15
  # 成長率：物理防御
  @pDefBase = 1.3
  # 成長率：魔法防御
  @mDefBase = 1.3
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 93
  # 基本回避率
  @dodgeRateBase = 7
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 19
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 1.8
  # 死んだ時の台詞
  @textDeath = "龍崎薫"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character197Base extends CharacterBase
  # ID
  @characterId = 197
  # キャラ名
  @characterName = "若林智香"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 1.5
  # 成長率：魔法防御
  @mDefBase = 1.5
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.2
  # 死んだ時の台詞
  @textDeath = "若林智香"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character198Base extends CharacterBase
  # ID
  @characterId = 198
  # キャラ名
  @characterName = "脇山珠美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 18
  # 成長率：HP
  @hpBase = 12
  # 成長率：物理防御
  @pDefBase = 3.5
  # 成長率：魔法防御
  @mDefBase = 1
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 97
  # 基本回避率
  @dodgeRateBase = 8
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.0
  # 死んだ時の台詞
  @textDeath = "脇山珠美"

  @abilityName = "剣道"
  @abilityDesc = "敵の攻撃を回避した時、反撃する"

  constructor:(params)->
    super(params)
class Character199Base extends CharacterBase
  # ID
  @characterId = 199
  # キャラ名
  @characterName = "和久井留美"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 13
  # 成長率：HP
  @hpBase = 17
  # 成長率：物理防御
  @pDefBase = 2
  # 成長率：魔法防御
  @mDefBase = 1.8
  # 基本移動力
  @moveBase = 4
  # 基本射程
  @rangeBase = 1
  # 基本命中率
  @hitRateBase = 95
  # 基本回避率
  @dodgeRateBase = 3
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 25
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 2.6
  # 死んだ時の台詞
  @textDeath = "和久井留美"

  @abilityName = "なし"
  @abilityDesc = "なし"

  constructor:(params)->
    super(params)
class Character200Base extends CharacterBase
  # ID
  @characterId = 200
  # キャラ名
  @characterName = "千川ちひろ"
  # 最初からいるか
  @defaultJoin = false
  # 画像のリスト
  @images = []
  # 基本攻撃タイプ
  @attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC
  # 成長率：攻撃力
  @attackBase = 0
  # 成長率：HP
  @hpBase = 14
  # 成長率：物理防御
  @pDefBase = 0.5
  # 成長率：魔法防御
  @mDefBase = 0.5
  # 基本移動力
  @moveBase = 1
  # 基本射程
  @rangeBase = 0
  # 基本命中率
  @hitRateBase = 0
  # 基本回避率
  @dodgeRateBase = 1
  # アイテム装備可能数（開始時）
  @itemCapacityStart = 30
  # アイテム装備可能数（限界）
  @itemCapacityLimit = 40
  # コスト
  @costBase = 1.5
  # 必要経験値
  @expRate = 3.2
  # 死んだ時の台詞
  @textDeath = "千川ちひろ"

  @abilityName = "事務"
  @abilityDesc = "出撃中に得るジュエルが2倍になる"

  constructor:(params)->
    super(params)

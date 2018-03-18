class PresentboxN extends PresentboxBase
  # ID
  @id = 1
  # キャラ名
  @characterName = "プレゼント（N）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_n.png"]

  @receiveTurn = 15

  @abilityName = @characterName
  @abilityDesc = '倒すとノーマルなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 1
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 50

  getHpMax:(level = null)->
    3

class PresentboxR extends PresentboxBase
  # ID
  @id = 2
  # キャラ名
  @characterName = "プレゼント（R）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_r.png"]

  @receiveTurn = 10

  @abilityName = 'プレゼント（R）'
  @abilityDesc = '倒すとレアなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 2
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 100

  getHpMax:(level = null)->
    5

class PresentboxSR extends PresentboxBase
  # ID
  @id = 3
  # キャラ名
  @characterName = "プレゼント（SR）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_sr.png"]

  @receiveTurn = 5

  @abilityName = 'プレゼント（SR）'
  @abilityDesc = '倒すとスーパーレアなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 3
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 150

  getHpMax:(level = null)->
    8


class PresentboxSSR extends PresentboxBase
  # ID
  @id = 4
  # キャラ名
  @characterName = "プレゼント（SSR）"
  # 画像のリスト
  @images = ['./img/presentbox/presentbox_ssr.png']

  @receiveTurn = 3

  @abilityName = 'プレゼント（SSR）'
  @abilityDesc = '倒すとスーパースーパーレアなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 4
  # アイテムがジュエルになる時の額
  @itemJewelAmount = 250

  getHpMax:(level = null)->
    10

class PresentboxExp extends PresentboxBase
  # ID
  @id = 5
  # キャラ名
  @characterName = "プレゼント（EXP）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_exp.png"]

  @receiveTurn = 10

  @abilityName = 'プレゼント（EXP）'
  @abilityDesc = '倒すと経験値を入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  getHpMax:(level = null)->
    5

  dropItem:->
    # レベル*10の経験値をもらえる
    exp = @level * 10
    await ItemWindow.showExp exp
    EnvManager.increaseExp exp

class PresentboxJewel extends PresentboxBase
  # ID
  @id = 6
  # キャラ名
  @characterName = "プレゼント（ジュエル）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_jewel.png"]

  @receiveTurn = 10

  @abilityName = 'プレゼント（ジュエル）'
  @abilityDesc = '倒すと100ジュエルを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  getHpMax:(level = null)->
    5

  dropItem:->
    jewel = 100
    # 100ジュエルもらえる
    await ItemWindow.showJewel jewel
    EnvManager.increaseJewel jewel

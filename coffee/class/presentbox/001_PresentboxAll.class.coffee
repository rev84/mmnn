class PresentboxN extends PresentboxBase
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
  @itemJuwelAmount = 50

  getHpMax:(level = null)->
    3

class PresentboxR extends PresentboxBase
  # キャラ名
  @characterName = "プレゼント（R）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_r.png"]

  @receiveTurn = 10

  @abilityName = 'プレゼント★★'
  @abilityDesc = '倒すとレアなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 2
  # アイテムがジュエルになる時の額
  @itemJuwelAmount = 100

  getHpMax:(level = null)->
    5

class PresentboxSR extends PresentboxBase
  # キャラ名
  @characterName = "プレゼント（SR）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_sr.png"]

  @receiveTurn = 8

  @abilityName = 'プレゼント★★★'
  @abilityDesc = '倒すとスーパーレアなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 3
  # アイテムがジュエルになる時の額
  @itemJuwelAmount = 150

  getHpMax:(level = null)->
    8

class PresentboxSRp extends PresentboxBase
  # キャラ名
  @characterName = "プレゼント（SR+）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_srp.png"]

  @receiveTurn = 6

  @abilityName = 'プレゼント★★★★'
  @abilityDesc = '倒すとスーパーレアプラスなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 4
  # アイテムがジュエルになる時の額
  @itemJuwelAmount = 200

  getHpMax:(level = null)->
    8

class PresentboxSSR extends PresentboxBase
  # キャラ名
  @characterName = "プレゼント（SSR）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_srp.png"]

  @receiveTurn = 5

  @abilityName = 'プレゼント★★★★★'
  @abilityDesc = '倒すとスーパースーパーレアなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 5
  # アイテムがジュエルになる時の額
  @itemJuwelAmount = 250

  getHpMax:(level = null)->
    10

class PresentboxSSRp extends PresentboxBase
  # キャラ名
  @characterName = "プレゼント（SSR+）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_ssrp.png"]

  @receiveTurn = 3

  @abilityName = 'プレゼント★★★★★'
  @abilityDesc = '倒すとスーパースーパーレアプラスなアイテムを入手できる。受取期限は出現してから'+@receiveTurn+'ターン'

  # アイテムのドロップテーブルID
  @itemTableId = 6
  # アイテムがジュエルになる時の額
  @itemJuwelAmount = 300

  getHpMax:(level = null)->
    12

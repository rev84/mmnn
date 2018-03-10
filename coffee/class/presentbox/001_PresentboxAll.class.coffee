class PresentboxBasic extends PresentboxBase
  # キャラ名
  @characterName = "プレゼント（白）"
  # 画像のリスト
  @images = ["./img/presentbox/presentbox_basic.png"]

  @abilityName = "プレゼント"
  @abilityDesc = "倒すとアイテムを入手できる。ただし、受取期限ターンが0になると、自然消滅してしまう"

  @receiveTurn = 10

  getHpMax:(level = null)->
    3
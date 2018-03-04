class Item
  constructor:(@itemId, @params)->
    @amount = 0

  # 持ってる数を設定
  setAmount:(amount)->
    @amount = amount

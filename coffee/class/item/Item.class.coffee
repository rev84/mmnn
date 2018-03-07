class Item
  constructor:(@itemId, @params)->
    @amount = []
    @amount[level] = 0 for level in [0...@params.cost.length]

  # 持ってる数を設定
  setAmount:(level, amount)->
    @amount[level] = amount
  getAmount:(level)->
    @amount[level]

  # 名前を取得
  getName:->
    @params.name

  # レベルを含んだ名前を取得
  getNameWithLevel:(level)->
    if @getMaxLevel() - @getMinLevel() is 0
      @getName()
    else
      @getName()+('★'.repeat(level+1))

  getExpense:(fromLevel, toLevel)->
    return false if toLevel - fromLevel isnt 1
    return false unless @getMinLevel() <= fromLevel <= @getMaxLevel()
    return false unless @getMinLevel() <= toLevel <= @getMaxLevel()
    @params[fromLevel]

  # コスト
  getCost:(level)->
    @params.cost[level]
  # 最低レベル
  getMinLevel:->
    0
  # 最大レベル
  getMaxLevel:->
    @params.cost.length-1

  # 表示順
  getDisplayOrder:->
    @params.displayOrder

  # ひとつも持ってないか
  isNothing:->
    for am in @amount
      return false if am isnt 0
    true
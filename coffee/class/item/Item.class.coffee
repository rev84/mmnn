class Item
  constructor:(@itemId, @params)->
    @amount = []
    @amount[level] = 0 for level in [0...@params.cost.length]

  # 持ってる数を設定
  setAmount:(level, amount)->
    @amount[level] = amount

  getAmount:(level)->
    @amount[level]

  upgrade:(level)->
    return false unless @getMinLevel() <= level <= @getMaxLevel()
    return false unless @getMinLevel() <= (level+1) <= @getMaxLevel()
    return false if @decreaseAmount(level) is false
    @increaseAmount(level+1)

  increaseAmount:(level, amount = 1)->
    return false unless @getMinLevel() <= level <= @getMaxLevel()
    return false if amount <= 0
    @amount[level] += amount

  decreaseAmount:(level, amount = 1)->
    return false unless @getMinLevel() <= level <= @getMaxLevel()
    return false if amount <= 0
    return false if @getAmount(level) - amount < 0

    @amount[level] -= amount

  getId:->
    @itemId

  # 名前を取得
  getName:->
    @params.name

  # レベルを含んだ名前を取得
  getNameWithLevel:(level)->
    if @getMaxLevel() - @getMinLevel() is 0
      @getName()
    else
      @getName() + @constructor.level2char(level)
      

  getExpense:(fromLevel, toLevel)->
    return false if toLevel - fromLevel isnt 1
    return false unless @getMinLevel() <= fromLevel <= @getMaxLevel()
    return false unless @getMinLevel() <= toLevel <= @getMaxLevel()
    @params.expense[fromLevel]

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

  @level2char:(level)->
    switch level+1
      when 1 then 'Ⅰ'
      when 2 then 'Ⅱ'
      when 3 then 'Ⅲ'
      when 4 then 'Ⅳ'
      when 5 then 'Ⅴ'
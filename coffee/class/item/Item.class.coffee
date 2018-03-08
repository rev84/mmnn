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

  getImage:->
    #'./img/item/'+@getId()+'.png'
    './img/item/default.png'

  # 名前を取得
  getName:->
    @params.name

  # レベルを含んだ名前を取得
  getNameWithLevel:(level)->
    if @getMaxLevel() - @getMinLevel() is 0
      @getName()
    else
      @getName() + @constructor.level2char(level)
      
  # 説明を取得
  getDescription:->
    @params.description

  getExpense:(fromLevel, toLevel)->
    return false if toLevel - fromLevel isnt 1
    return false unless @getMinLevel() <= fromLevel <= @getMaxLevel()
    return false unless @getMinLevel() <= toLevel <= @getMaxLevel()
    @params.expense[fromLevel]

  getHpFixRate:->
    if @params.hpRate is null
      0
    else
      @params.hpRate
  getAttackFixRate:->
    if @params.atkRate is null
      0
    else
      @params.atkRate
  getPDefRateFixRate:->
    if @params.pDefRate is null
      0
    else
      @params.pDefRate
  getMDefRateFixRate:->
    if @params.mDefRate is null
      0
    else
      @params.mDefRate
  getCostRateFixRate:->
    if @params.costRate is null
      0
    else
      @params.costRate
  getMoveFixPlus:->
    if @params.movePlus is null
      0
    else
      @params.movePlus
  getRangeFixPlus:->
    if @params.rangePlus is null
      0
    else
      @params.rangePlus
  getHitFixPlus:->
    if @params.hitPlus is null
      0
    else
      @params.hitPlus
  getDodgeFixPlus:->
    if @params.dodgePlus is null
      0
    else
      @params.dodgePlus
  getReturnFixPlus:->
    if @params.returnPlus is null
      0
    else
      @params.returnPlus
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

  # テーブルIDにおける出現確率
  getItemRate:(itemTableId)->
    @params.itemTable[itemTableId-1]

  @level2char:(level)->
    switch level+1
      when 1 then 'Ⅰ'
      when 2 then 'Ⅱ'
      when 3 then 'Ⅲ'
      when 4 then 'Ⅳ'
      when 5 then 'Ⅴ'
class CharacterBase extends ObjectBase
  # 復帰までに必要なターン
  @COMEBACK_TURN = 5

  constructor:(params)->
    super(ObjectBase.OBJECT_TYPE.CHARACTER)

    # 既に所有しているキャラクターであるか
    if params.joined is null
      @joined = @constructor.defaultJoin
    else
      @joined = params.joined

    # 現在のレベル
    @level = params.level

    # 現在のHP
    @hp = params.hp

    # 装備しているアイテム
    @items = params.items

    # 出撃中であるか
    @inField = params.inField

    # 行動済みであるか
    @moved = params.moved

    # アイテム装備可能数
    @itemCapacityPlus = params.itemCapacityPlus

    # 装備中のアイテム
    @items = params.items

    # 復帰までに必要なターン
    @comebackTurn = params.comebackTurn

  getId:->
    @constructor.characterId

  getName:->
    @constructor.characterName

  getHpMaxItemFixRate:->
    res = 1
    for [itemObject, level] in @items
      res += itemObject.getHpFixRate()
    res
  getAttackItemFixRate:->
    res = 1
    for [itemObject, level] in @items
      res += itemObject.getAttackFixRate()
    res
  getPDefItemFixRate:->
    res = 1
    for [itemObject, level] in @items
      res += itemObject.getPDefRateFixRate()
    res
  getMDefItemFixRate:->
    res = 1
    for [itemObject, level] in @items
      res += itemObject.getMDefRateFixRate()
    res
  getCostItemFixRate:->
    res = 1
    for [itemObject, level] in @items
      res += itemObject.getCostRateFixRate()
    res
  getMoveItemFix:->
    res = 0
    for [itemObject, level] in @items
      res += itemObject.getMoveFixPlus()
    res
  getRangeItemFix:->
    res = 0
    for [itemObject, level] in @items
      res += itemObject.getRangeFixPlus()
    res
  getHitRateItemFix:->
    res = 0
    for [itemObject, level] in @items
      res += itemObject.getHitFixPlus()
    res
  getDodgeRateItemFix:->
    res = 0
    for [itemObject, level] in @items
      res += itemObject.getDodgeFixPlus()
    res
  getComebackItemFix:->
    res = 0
    for [itemObject, level] in @items
      res += itemObject.getReturnFixPlus()
    res

  isInField:->
    @inField

  setInField:(isInField)->
    @inField = !!isInField
    CharacterPalletManager.redraw @

  isMoved:->
    @moved

  setMoved:(bool)->
    @moved = !!bool

  # 出撃可能か
  canPick:->
    @getComebackTurn <= 0 and !@isInField()

  getTextOnDeath:->
    @constructor.textDeath

  getCostBase:->
    @constructor.costBase

  getCost:(level = null)->
    if level is null
      Math.ceil(@constructor.costBase * @level * @getMDefItemFixRate())
    else
      Math.ceil(@constructor.costBase * level * @getMDefItemFixRate())
  
  getComebackTurnStart:->
    @constructor.COMEBACK_TURN - @getComebackItemFix()

  getComebackTurn:->
    @comebackTurn

  setComebackTurn:(comebackTurn)->
    @comebackTurn = comebackTurn
    CharacterPalletManager.redraw @

  decreaseComeback:->
    @comebackTurn-- if @comebackTurn > 0
    CharacterPalletManager.redraw @

  death:->
    @setMoved false
    @setInField false
    @hp = null
    @setComebackTurn @getComebackTurnStart()

  # アイテム装備可能数（開始時）
  getItemCapacityStart:->
    @constructor.itemCapacityStart
  
  # アイテム装備可能数（開始時）
  getItemCapacityLimit:->
    @constructor.itemCapacityLimit
  
  # アイテム装備可能数
  getItemCapacity:->
    @getItemCapacityStart() + @getItemCapacityPlus()
  
  # アイテム装備可能数の加算値
  getItemCapacityPlus:->
    @itemCapacityPlus
  
  # アイテム装備可能数を増やす
  increaseItemCapacity:(amount = 1)->
    @itemCapacityPlus += amount
    @itemCapacityPlus = @getItemCapacityLimit() - @getItemCapacityStart() if @getItemCapacityLimit() - @getItemCapacityStart() < @itemCapacityPlus
  
  # アイテム装備可能数を増やせるか
  canIncreaseItemCapacity:(amount = 1)->
    @itemCapacityPlus + amount <= @getItemCapacityLimit() - @getItemCapacityStart()

  # アイテムを装備
  setItem:(itemObject, level)->
    @items.push [itemObject, level]

  # アイテムを外す
  dropItem:(itemObject, level)->
    items = []
    deleted = false
    for [iObj, lv] in @items
      if !deleted and iObj.getId() is itemObject.getId() and level is lv
        deleted = true
      else
        items.push [iObj, lv]
    @items = items
    deleted

  # 装備中のアイテムを取得
  getItems:->
    @items.sort (a, b)->
      [aItemObject, aLevel] = a
      [bItemObject, bLevel] = b
      return -1 if aItemObject.getDisplayOrder() < bItemObject.getDisplayOrder()
      return  1 if aItemObject.getDisplayOrder() > bItemObject.getDisplayOrder()
      return -1 if aLevel < bLevel
      return  1 if aLevel > bLevel
      0
    @items

  # 装備中のアイテムのコストの合計を取得
  getItemCostTotal:->
    total = 0
    for [itemObject, level] in @items
      total += itemObject.getCost(level)
    total


class CharacterBase extends ObjectBase
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

  getId:->
    @constructor.characterId

  getName:->
    @constructor.characterName

  isInField:->
    @inField

  setInField:(isInField)->
    @inField = !!isInField
    CharacterPalletManager.redraw @

  isMoved:->
    @moved

  setMoved:(bool)->
    @moved = !!bool

  getTextOnDeath:->
    @constructor.textDeath

  getCostBase:->
    @constructor.costBase

  getCost:(level = null)->
    if level is null
      Math.ceil(@constructor.costBase * @level)
    else
      Math.ceil(@constructor.costBase * level)
  
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
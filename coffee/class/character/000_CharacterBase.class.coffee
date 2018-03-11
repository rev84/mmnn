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

    # 復帰までに必要なターン
    @comebackTurn = params.comebackTurn

  serialize:->
    {
      joined: @joined
      level: @level
      hp: @hp
      items: @items
      inField: @inField
      moved: @moved
      itemCapacityPlus: @itemCapacityPlus
      comebackTurn: @comebackTurn
    }

  getId:->
    @constructor.characterId

  getName:->
    @constructor.characterName

  isJoined:->
    @joined

  setJoined:(joined)->
    @joined = !!joined

  getHpMaxItemFixRate:->
    res = 1
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getHpFixRate()
    res
  getAttackItemFixRate:->
    res = 1
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getAttackFixRate()
    res
  getPDefItemFixRate:->
    res = 1
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getPDefRateFixRate()
    res
  getMDefItemFixRate:->
    res = 1
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getMDefRateFixRate()
    res
  getCostItemFixRate:->
    res = 1
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getCostRateFixRate()
    res
  getMoveItemFix:->
    res = 0
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getMoveFixPlus()
    res
  getRangeItemFix:->
    res = 0
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getRangeFixPlus()
    res
  getHitRateItemFix:->
    res = 0
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getHitFixPlus()
    res
  getDodgeRateItemFix:->
    res = 0
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
      res += itemObject.getDodgeFixPlus()
    res
  getComebackItemFix:->
    res = 0
    for [itemId, level] in @items
      itemObject = ItemManager.itemId2object itemId
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
    @getComebackTurn <= 0 and !@isInField() and @isJoined()

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
    @items.push [itemObject.getId(), level]

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

  dropAllItem:->
    @items = []

  # 装備中のアイテムを取得
  getItems:->
    @items.sort (a, b)->
      [aId, aLevel] = a
      [bId, bLevel] = b
      aItemObject = ItemManager.itemId2object(aId)
      bItemObject = ItemManager.itemId2object(bId)
      return -1 if aItemObject.getDisplayOrder() < bItemObject.getDisplayOrder()
      return  1 if aItemObject.getDisplayOrder() > bItemObject.getDisplayOrder()
      return -1 if aLevel < bLevel
      return  1 if aLevel > bLevel
      0
    @items

  # 装備中のアイテムのコストの合計を取得
  getItemCostTotal:->
    total = 0
    for [itemId, level] in @items
      total += ItemManager.itemId2object(itemId).getCost(level)
    total

  # 未参加のアイドルをひとりランダムピック
  @getUnjoinedCharacter:->
    characters = []
    for id, c of GameManager.characters
      characters.push c unless c.isJoined()

    return false if characters.length is 0

    characters[Utl.rand(0, characters.length-1)]
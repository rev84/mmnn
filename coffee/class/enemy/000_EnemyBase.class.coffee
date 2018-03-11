class EnemyBase extends ObjectBase
  constructor:(params)->
    super(ObjectBase.OBJECT_TYPE.ENEMY)

    # 現在のレベル
    @level = params.level

    # 現在のHP
    @hp = params.hp

    # 出撃中であるか
    @inField = params.inField

    # 行動済みであるか
    @moved = params.moved

  serialize:->
    {
      type: @getObjectType()
      id: @getId()
      level: @level
      moved: @moved
      inField: @inField
      hp: @hp
    }

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

  getJewel:->
    @constructor.itemJewelAmount

  getItemTableId:->
    @constructor.itemTableId

  dropItem:->
    seed = Math.random()

    # アイテムを落とす
    if seed < @constructor.itemRate
      res = ItemManager.getItemObjectFromItemTableId @getItemTableId()
      # ジュエルにする
      if res is false
        EnvManager.increaseJewel @getJewel()
        await ItemWindow.showJewel @getJewel()
      # 最低レベルのアイテムを与える
      else
        res.increaseAmount 0
        await ItemWindow.showItem res

  @getInstance:(id, params)->
    classes = EnemyDefine.getClasses()
    new (classes[id])(params)
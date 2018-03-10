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

  getJuwel:->
    @constructor.itemJuwelAmount

  getItemTableId:->
    @constructor.itemTableId

  dropItem:->
    seed = Math.random()

    # アイテムを落とす
    if seed < @constructor.itemRate
      res = ItemManager.getItemObjectFromItemTableId @getItemTableId()
      # ジュエルにする
      if res is false
        EnvManager.increaseJuwel @getJuwel()
        await ItemWindow.showJuwel @getJuwel()
      # 最低レベルのアイテムを与える
      else
        res.increaseAmount 0
        await ItemWindow.showItem res


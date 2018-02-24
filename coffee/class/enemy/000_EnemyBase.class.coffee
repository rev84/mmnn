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
class CharacterBase extends ObjectBase
  constructor:(params)->
    super(ObjectBase.OBJECT_TYPE.CHARACTER)

    # 既に所有しているキャラクターであるか
    if params.joined is null
      @joined = @constructor.defaultJoin
    else
      @joined = params.joined

    # 現在のレベル
    @level = Number(params.level)

    # 現在のHP
    @hp = Number(params.hp)

    # 装備しているアイテム
    @items = params.items



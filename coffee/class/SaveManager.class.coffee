class SaveManager
  @LOCAL_STORAGE_KEY = 'SAVE'

  @save:->
    return unless GameManager.DEBUG_CONFIG.AUTO_SAVE
    # キャラクター
    characters = {}
    for id, c of GameManager.characters
      characters[id] = c.serialize()

    # アイテム
    items = {}
    for id, item of ItemManager.items
      items[id] = item.serialize()

    # 環境
    env = {
      exp: EnvManager.getExp()
      floor: EnvManager.getFloor()
      life: EnvManager.getLife()
      jewel: EnvManager.getJewel()
    }

    # フィールド
    fields = []
    for cBody, x in FieldManager.cells
      line = []
      for c, y in cBody
        obj = c.object
        cell = 
          # なにもない場合
          if obj is null
            null
          # キャラクターの場合
          else if obj.isCharacterObject()
            {
              type: ObjectBase.OBJECT_TYPE.CHARACTER
              id: obj.getId()
            }
          # 敵の場合
          else if obj.isEnemyObject()
            obj.serialize()
          # プレゼントの場合
          else if obj.isPresentboxObject()
            obj.serialize()
        line[y] = cell
      field[x] = line

    # ゲーム状況
    flags = {
      isWalkInThisTurn: GameManager.flags.isWalkInThisTurn
    }

    # サウンド
    sound = SoundManager.serialize()

    json = {
      characters: characters
      items: items
      env: env
      field: field
      flags: flags
      sound: sound
    }

    Utl.setLs @LOCAL_STORAGE_KEY, Utl.base64encode(JSON.stringify(json))

  @load:->
    res = Utl.getLs @LOCAL_STORAGE_KEY
    if res isnt null
      res = JSON.parse(Utl.base64decode(res))
    res






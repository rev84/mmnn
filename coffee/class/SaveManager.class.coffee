class SaveManager
  @generateSavedata:->
    # キャラクター
    characters = []
    for c in GameManager.characters
      characters.push c.serialize()

    # アイテム
    items = []
    for item in ItemManager.items
      items.push item

    # 環境
    env = {
      exp: EnvManager.getExp()
      floor: EnvManager.getFloor()
      life: EnvManager.getLife()
      juwel: EnvManager.getJuwel()
    }

    # フィールド
    
// Generated by CoffeeScript 2.2.2
var SaveManager;

SaveManager = (function() {
  class SaveManager {
    static save() {
      var c, cBody, cell, characters, env, fields, flags, i, id, item, items, j, json, len, len1, line, obj, ref, ref1, ref2, x, y;
      if (!GameManager.DEBUG_CONFIG.AUTO_SAVE) {
        return;
      }
      // キャラクター
      characters = {};
      ref = GameManager.characters;
      for (id in ref) {
        c = ref[id];
        characters[id] = c.serialize();
      }
      // アイテム
      items = {};
      ref1 = ItemManager.items;
      for (id in ref1) {
        item = ref1[id];
        items[id] = item.serialize();
      }
      // 環境
      env = {
        exp: EnvManager.getExp(),
        floor: EnvManager.getFloor(),
        life: EnvManager.getLife(),
        jewel: EnvManager.getJewel()
      };
      // フィールド
      fields = [];
      ref2 = FieldManager.cells;
      for (x = i = 0, len = ref2.length; i < len; x = ++i) {
        cBody = ref2[x];
        line = [];
        for (y = j = 0, len1 = cBody.length; j < len1; y = ++j) {
          c = cBody[y];
          obj = c.object;
          
          // なにもない場合
          // キャラクターの場合
          cell = obj === null ? null : obj.isCharacterObject() ? {
            type: ObjectBase.OBJECT_TYPE.CHARACTER,
            id: obj.getId()
          // 敵の場合
          // プレゼントの場合
          } : obj.isEnemyObject() ? obj.serialize() : obj.isPresentboxObject() ? obj.serialize() : void 0;
          line[y] = cell;
        }
        field[x] = line;
      }
      // ゲーム状況
      flags = {
        isWalkInThisTurn: GameManager.flags.isWalkInThisTurn
      };
      json = {
        characters: characters,
        items: items,
        env: env,
        field: field,
        flags: flags
      };
      return Utl.setLs(this.LOCAL_STORAGE_KEY, json);
    }

    static load() {
      return Utl.getLs(this.LOCAL_STORAGE_KEY);
    }

  };

  SaveManager.LOCAL_STORAGE_KEY = 'SAVE';

  return SaveManager;

}).call(this);

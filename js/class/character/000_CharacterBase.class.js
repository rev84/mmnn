// Generated by CoffeeScript 2.2.3
var CharacterBase;

CharacterBase = (function() {
  class CharacterBase extends ObjectBase {
    constructor(params) {
      super(ObjectBase.OBJECT_TYPE.CHARACTER);
      // 既に所有しているキャラクターであるか
      if (params.joined === null) {
        this.joined = this.constructor.defaultJoin;
      } else {
        this.joined = params.joined;
      }
      // 現在のレベル
      this.level = params.level;
      // 現在のHP
      this.hp = params.hp;
      // 装備しているアイテム
      this.items = params.items;
      // 出撃中であるか
      this.inField = params.inField;
      // 行動済みであるか
      this.moved = params.moved;
      // アイテム装備可能数
      this.itemCapacityPlus = params.itemCapacityPlus;
      // 復帰までに必要なターン
      this.comebackTurn = params.comebackTurn;
      // 自身が所属するユニット
      this.units = params.units;
    }

    serialize() {
      return {
        joined: this.joined,
        level: this.level,
        hp: this.hp,
        items: this.items,
        inField: this.inField,
        moved: this.moved,
        itemCapacityPlus: this.itemCapacityPlus,
        comebackTurn: this.comebackTurn
      };
    }

    getId() {
      return this.constructor.characterId;
    }

    getName() {
      return this.constructor.characterName;
    }

    isJoined() {
      return this.joined;
    }

    setJoined(joined) {
      return this.joined = !!joined;
    }

    //-------------------------------
    // effected系
    //-------------------------------
    static effects2str(effects) {
      var effect, efs, i, len, name;
      efs = [];
      for (i = 0, len = effects.length; i < len; i++) {
        [name, effect] = effects[i];
        efs.push('[' + name + ']<br>' + effect);
      }
      return efs.join('<br>');
    }

    getAppliedUnits() {
      var all, fieldIds, i, id, j, len, len1, ref, ref1, unit, units;
      units = [];
      fieldIds = FieldManager.getCharacterIds();
      ref = this.units;
      for (i = 0, len = ref.length; i < len; i++) {
        unit = ref[i];
        all = true;
        ref1 = unit.id;
        for (j = 0, len1 = ref1.length; j < len1; j++) {
          id = ref1[j];
          if (!Utl.inArray(id, fieldIds)) {
            all = false;
            break;
          }
        }
        if (all) {
          units.push(unit);
        }
      }
      return units;
    }

    getAttackEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 1;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.atk !== null) {
          amount += unit.fix.atk;
          effected.push([unit.name, '攻撃+' + (unit.fix.atk * 100) + '%']);
        }
      }
      return [this.getAttack() + Math.ceil(this.getAttackBase() * amount), effected];
    }

    getPDefEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 1;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.pdef !== null) {
          amount += unit.fix.pdef;
          effected.push([unit.name, '物防+' + (unit.fix.pdef * 100) + '%']);
        }
      }
      return [this.getPDef() + Math.ceil(this.getPDefBase() * amount), effected];
    }

    getMDefEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 1;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.mdef !== null) {
          amount += unit.fix.mdef;
          effected.push([unit.name, '魔防+' + (unit.fix.mdef * 100) + '%']);
        }
      }
      return [this.getMDef() + Math.ceil(this.getMDefBase() * amount), effected];
    }

    getMoveEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 0;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.move !== null) {
          amount += unit.fix.move;
          effected.push([unit.name, '移動+' + unit.fix.move]);
        }
      }
      return [this.getMove() + amount, effected];
    }

    getRangeEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 0;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.range !== null) {
          amount += unit.fix.range;
          effected.push([unit.name, '射程+' + unit.fix.range]);
        }
      }
      return [this.getRange() + amount, effected];
    }

    getHitRateEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 0;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.hit !== null) {
          amount += unit.fix.hit;
          effected.push([unit.name, '命中+' + unit.fix.hit]);
        }
      }
      return [this.getHitRate() + amount, effected];
    }

    getDodgeRateEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 0;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.dodge !== null) {
          amount += unit.fix.dodge;
          effected.push([unit.name, '回避+' + unit.fix.dodge]);
        }
      }
      return [this.getDodgeRate() + amount, effected];
    }

    getHpMaxEffected(myCell = null) {
      var amount, effected, i, len, unit, units;
      units = this.getAppliedUnits();
      amount = 1;
      effected = [];
      for (i = 0, len = units.length; i < len; i++) {
        unit = units[i];
        if (unit.fix.hp !== null) {
          amount += unit.fix.hp;
          effected.push([unit.name, '最大HP+' + (unit.fix.mdef * 100) + '%']);
        }
      }
      return [this.getHpMax() + Math.ceil(this.getHpMaxBase() * amount), effected];
    }

    getHpMaxItemFixRate() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 1;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getHpFixRate();
      }
      return res;
    }

    getAttackItemFixRate() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 1;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getAttackFixRate();
      }
      return res;
    }

    getPDefItemFixRate() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 1;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getPDefRateFixRate();
      }
      return res;
    }

    getMDefItemFixRate() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 1;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getMDefRateFixRate();
      }
      return res;
    }

    getCostItemFixRate() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 1;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getCostRateFixRate();
      }
      return res;
    }

    getMoveItemFix() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 0;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getMoveFixPlus();
      }
      return res;
    }

    getRangeItemFix() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 0;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getRangeFixPlus();
      }
      return res;
    }

    getHitRateItemFix() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 0;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getHitFixPlus();
      }
      return res;
    }

    getDodgeRateItemFix() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 0;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getDodgeFixPlus();
      }
      return res;
    }

    getComebackItemFix() {
      var i, itemId, itemObject, len, level, ref, res;
      res = 0;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        itemObject = ItemManager.itemId2object(itemId);
        res += itemObject.getReturnFixPlus();
      }
      return res;
    }

    isInField() {
      return this.inField;
    }

    setInField(isInField) {
      this.inField = !!isInField;
      return CharacterPalletManager.redraw(this);
    }

    isMoved() {
      return this.moved;
    }

    setMoved(bool) {
      return this.moved = !!bool;
    }

    // 出撃可能か
    canPick() {
      return this.getComebackTurn <= 0 && !this.isInField() && this.isJoined();
    }

    getTextOnDeath() {
      return this.constructor.textDeath;
    }

    getCostBase() {
      return this.constructor.costBase;
    }

    getCost(level = null) {
      if (level === null) {
        return Math.ceil(this.constructor.costBase * this.level * this.getCostItemFixRate());
      } else {
        return Math.ceil(this.constructor.costBase * level * this.getCostItemFixRate());
      }
    }

    getComebackTurnStart() {
      return this.constructor.COMEBACK_TURN - this.getComebackItemFix();
    }

    getComebackTurn() {
      return this.comebackTurn;
    }

    setComebackTurn(comebackTurn) {
      this.comebackTurn = comebackTurn;
      return CharacterPalletManager.redraw(this);
    }

    decreaseComeback() {
      if (this.comebackTurn > 0) {
        this.comebackTurn--;
      }
      return CharacterPalletManager.redraw(this);
    }

    death() {
      this.setMoved(false);
      this.setInField(false);
      this.hp = null;
      return this.setComebackTurn(this.getComebackTurnStart());
    }

    // アイテム装備可能数（開始時）
    getItemCapacityStart() {
      return this.constructor.itemCapacityStart;
    }

    
    // アイテム装備可能数（開始時）
    getItemCapacityLimit() {
      return this.constructor.itemCapacityLimit;
    }

    
    // アイテム装備可能数
    getItemCapacity() {
      return this.getItemCapacityStart() + this.getItemCapacityPlus();
    }

    
    // アイテム装備可能数の加算値
    getItemCapacityPlus() {
      return this.itemCapacityPlus;
    }

    
    // アイテム装備可能数を増やす
    increaseItemCapacity(amount = 1) {
      this.itemCapacityPlus += amount;
      if (this.getItemCapacityLimit() - this.getItemCapacityStart() < this.itemCapacityPlus) {
        return this.itemCapacityPlus = this.getItemCapacityLimit() - this.getItemCapacityStart();
      }
    }

    
    // アイテム装備可能数を増やせるか
    canIncreaseItemCapacity(amount = 1) {
      return this.itemCapacityPlus + amount <= this.getItemCapacityLimit() - this.getItemCapacityStart();
    }

    // アイテムを装備
    setItem(itemObject, level) {
      return this.items.push([itemObject.getId(), level]);
    }

    // アイテムを外す
    dropItem(itemObject, level) {
      var deleted, i, iObj, items, len, lv, ref;
      items = [];
      deleted = false;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [iObj, lv] = ref[i];
        if (!deleted && iObj.getId() === itemObject.getId() && level === lv) {
          deleted = true;
        } else {
          items.push([iObj, lv]);
        }
      }
      this.items = items;
      return deleted;
    }

    dropAllItem() {
      return this.items = [];
    }

    // 装備中のアイテムを取得
    getItems() {
      this.items.sort(function(a, b) {
        var aId, aItemObject, aLevel, bId, bItemObject, bLevel;
        [aId, aLevel] = a;
        [bId, bLevel] = b;
        aItemObject = ItemManager.itemId2object(aId);
        bItemObject = ItemManager.itemId2object(bId);
        if (aItemObject.getDisplayOrder() < bItemObject.getDisplayOrder()) {
          return -1;
        }
        if (aItemObject.getDisplayOrder() > bItemObject.getDisplayOrder()) {
          return 1;
        }
        if (aLevel < bLevel) {
          return -1;
        }
        if (aLevel > bLevel) {
          return 1;
        }
        return 0;
      });
      return this.items;
    }

    // 装備中のアイテムのコストの合計を取得
    getItemCostTotal() {
      var i, itemId, len, level, ref, total;
      total = 0;
      ref = this.items;
      for (i = 0, len = ref.length; i < len; i++) {
        [itemId, level] = ref[i];
        total += ItemManager.itemId2object(itemId).getCost(level);
      }
      return total;
    }

    // 未参加のアイドルをひとりランダムピック
    static getUnjoinedCharacter() {
      var c, characters, id, ref;
      characters = [];
      ref = GameManager.characters;
      for (id in ref) {
        c = ref[id];
        if (!c.isJoined()) {
          characters.push(c);
        }
      }
      if (characters.length === 0) {
        return false;
      }
      return characters[Utl.rand(0, characters.length - 1)];
    }

  };

  // 復帰までに必要なターン
  CharacterBase.COMEBACK_TURN = 5;

  return CharacterBase;

}).call(this);

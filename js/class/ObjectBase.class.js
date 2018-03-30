// Generated by CoffeeScript 2.2.3
var ObjectBase;

ObjectBase = (function() {
  class ObjectBase {
    constructor(objectType) {
      this.objectType = objectType;
    }

    getObjectType() {
      return this.objectType;
    }

    isCharacterObject() {
      return this.objectType === this.constructor.OBJECT_TYPE.CHARACTER;
    }

    isEnemyObject() {
      return this.objectType === this.constructor.OBJECT_TYPE.ENEMY;
    }

    isPresentboxObject() {
      return this.objectType === this.constructor.OBJECT_TYPE.PRESENTBOX;
    }

    //-------------------------------
    // HP
    //-------------------------------
    getHpMaxEffected(myCell = null) {
      return [this.getHpMax(), []];
    }

    getHpMax(level = null) {
      if (level === null) {
        return Math.ceil(this.constructor.hpBase * this.level * this.getHpMaxItemFixRate());
      } else {
        return Math.ceil(this.constructor.hpBase * level);
      }
    }

    getHpMaxBase() {
      return this.constructor.hpBase;
    }

    getHpMaxItemFixRate() {
      return 1;
    }

    getHp() {
      if (this.hp === null || this.getHpMax() < this.hp) {
        return this.getHpMax();
      } else if (this.hp <= 0) {
        return 0;
      } else {
        return this.hp;
      }
    }

    setHp(hp) {
      return this.hp = hp;
    }

    damage(amount) {
      if (amount <= 0) {
        return false;
      }
      this.hp = this.getHp() - amount;
      return this.getHp();
    }

    getLevel(level = null) {
      if (level === null) {
        return this.level;
      } else {
        return level;
      }
    }

    setLevel(level) {
      return this.level = level;
    }

    levelup(level = 1) {
      return this.level += level;
    }

    getCharacterName() {
      return this.constructor.characterName;
    }

    getAttackType() {
      return this.constructor.attackTypeBase;
    }

    //-------------------------------
    // 攻撃力
    //-------------------------------
    getAttackEffected(myCell = null) {
      return [this.getAttack(), []];
    }

    getAttack(level = null) {
      if (level === null) {
        return Math.ceil(this.constructor.attackBase * this.level * this.getAttackItemFixRate());
      } else {
        return Math.ceil(this.constructor.attackBase * level * this.getAttackItemFixRate());
      }
    }

    getAttackItemFixRate() {
      return 1;
    }

    getAttackBase() {
      return this.constructor.attackBase;
    }

    //-------------------------------
    // 物防
    //-------------------------------
    getPDefEffected(myCell = null) {
      return [this.getPDef(), []];
    }

    getPDef(level = null) {
      if (level === null) {
        return Math.ceil(this.constructor.pDefBase * this.level * this.getPDefItemFixRate());
      } else {
        return Math.ceil(this.constructor.pDefBase * level * this.getPDefItemFixRate());
      }
    }

    getPDefItemFixRate() {
      return 1;
    }

    getPDefBase() {
      return this.constructor.pDefBase;
    }

    //-------------------------------
    // 魔防
    //-------------------------------
    getMDefEffected(myCell = null) {
      return [this.getMDef(), []];
    }

    getMDef(level = null) {
      if (level === null) {
        return Math.ceil(this.constructor.mDefBase * this.level * this.getMDefItemFixRate());
      } else {
        return Math.ceil(this.constructor.mDefBase * level * this.getMDefItemFixRate());
      }
    }

    getMDefItemFixRate() {
      return 1;
    }

    getMDefBase() {
      return this.constructor.mDefBase;
    }

    //-------------------------------
    // 移動
    //-------------------------------
    getMoveEffected(myCell = null) {
      return [this.getMove(), []];
    }

    getMove() {
      return this.constructor.moveBase + this.getMoveItemFix();
    }

    getMoveItemFix() {
      return 0;
    }

    getMoveBase() {
      return this.constructor.moveBase;
    }

    //-------------------------------
    // 射程
    //-------------------------------
    getRangeEffected(myCell = null) {
      return [this.getRange(), []];
    }

    getRange() {
      return this.constructor.rangeBase + this.getRangeItemFix();
    }

    getRangeItemFix() {
      return 0;
    }

    getRangeBase() {
      return this.constructor.rangeBase;
    }

    //-------------------------------
    // 命中
    //-------------------------------
    getHitRateEffected(myCell = null) {
      return [this.getHitRate(), []];
    }

    getHitRate() {
      return this.constructor.hitRateBase + this.getHitRateItemFix();
    }

    getHitRateItemFix() {
      return 0;
    }

    getHitRateBase() {
      return this.constructor.hitRateBase;
    }

    //-------------------------------
    // 回避
    //-------------------------------
    getDodgeRateEffected(myCell = null) {
      return [this.getDodgeRate(), []];
    }

    getDodgeRate() {
      return this.constructor.dodgeRateBase + this.getDodgeRateItemFix();
    }

    getDodgeRateItemFix() {
      return 0;
    }

    getDodgeRateBase() {
      return this.constructor.dodgeRateBase;
    }

    getExp() {
      return Math.ceil(this.level * this.constructor.expRate);
    }

    getAbilityName() {
      return this.constructor.abilityName;
    }

    getAbilityDesc() {
      return this.constructor.abilityDesc;
    }

    getBaseImage() {
      return this.constructor.images[0];
    }

    getImages() {
      return this.constructor.images;
    }

    getImage(index) {
      if (!((0 <= index && index < this.constructor.images.length))) {
        return null;
      }
      return this.constructor.images[index];
    }

    // 指定したレベル上がるために必要な経験値量
    getNeededExp(level) {
      var baseExp, baseLevel, targetExp, targetLevel;
      targetLevel = this.level + level;
      baseLevel = this.level;
      targetExp = (Math.pow(targetLevel, 2)) * this.constructor.expRate;
      baseExp = (Math.pow(baseLevel, 2)) * this.constructor.expRate;
      return Math.ceil(targetExp - baseExp);
    }

    // 経験値で上げられるレベル量
    getLevelUpMax(exp) {
      var baseExp, targetExp;
      baseExp = (Math.pow(this.level, 2)) * this.constructor.expRate;
      targetExp = baseExp + exp;
      return Math.floor(Math.sqrt(targetExp / this.constructor.expRate) - this.level);
    }

    getJewel() {
      return this.constructor.itemJewelAmount;
    }

    getItemTableId() {
      return this.constructor.itemTableId;
    }

    async dropItem() {
      var res, seed;
      seed = Math.random();
      // アイテムを落とす
      if (seed < this.constructor.itemRate) {
        res = ItemManager.getItemObjectFromItemTableId(this.getItemTableId());
        // ジュエルにする
        if (res === false) {
          await ItemWindow.showJewel(this.getJewel());
          return EnvManager.increaseJewel(this.getJewel());
        } else {
          // 最低レベルのアイテムを与える
          await ItemWindow.showItem(res);
          return res.increaseAmount(0);
        }
      }
    }

    //##########################
    // イベント割り込み系
    //##########################
    // 味方ターン開始時
    onCharacterTurnStart(myCell) {}

    onEnemyTurnStart(myCell) {}

    onAttackDamage(myCell, opCell, damage) {
      return damage;
    }

    // 防御時、ダメージを変換
    onDefenseDamage(myCell, opCell, damage) {
      return damage;
    }

    // ダメージ計算式
    static getDamageMin(attack, def) {
      var damage;
      damage = attack - def;
      if (damage < 1) {
        return 1;
      }
      damage = Math.round(damage - damage * this.DAMAGE_SHAKE_RATE);
      if (damage < 1) {
        return 1;
      }
      return damage;
    }

    static getDamageMax(attack, def) {
      var damage;
      damage = attack - def;
      if (damage < 1) {
        return 1;
      }
      damage = Math.round(damage + damage * this.DAMAGE_SHAKE_RATE);
      if (damage < 1) {
        return 1;
      }
      return damage;
    }

    static getDamage(attack, def) {
      return Utl.rand(this.getDamageMin(attack, def), this.getDamageMax(attack, def));
    }

    static getKnockoutRate(hp, attack, def) {
      var max, min;
      min = this.getDamageMin(attack, def);
      max = this.getDamageMax(attack, def);
      if (hp <= min) {
        return +2e308;
      } else if (hp <= max) {
        return Math.round((max - hp + 1) / (max - min + 1) * 100);
      } else {
        return -2e308;
      }
    }

    // パラメータを見た目に変換
    static status2html(status) {
      if (status === +2e308) {
        return '∞';
      } else {
        return status;
      }
    }

  };

  ObjectBase.OBJECT_TYPE = {
    CHARACTER: 'CHARACTER',
    ENEMY: 'ENEMY',
    PRESENTBOX: 'PRESENTBOX'
  };

  ObjectBase.ATTACK_TYPE = {
    PHYSIC: '物理',
    MAGIC: '魔法'
  };

  // ダメージの振れ幅
  ObjectBase.DAMAGE_SHAKE_RATE = 0.1;

  // 倒せるか定数兼画像
  ObjectBase.KNOCKOUT = {
    OK: './img/circle.png',
    MAY: './img/triangle.png',
    NG: './img/cross.png'
  };

  // 吹き出し演出の時の時間（ミリ秒）
  ObjectBase.POPOVER_MSEC = 2000;

  return ObjectBase;

}).call(this);

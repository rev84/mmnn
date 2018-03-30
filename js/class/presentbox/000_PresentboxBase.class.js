// Generated by CoffeeScript 2.2.3
var PresentboxBase;

PresentboxBase = (function() {
  class PresentboxBase extends ObjectBase {
    constructor(params) {
      super(ObjectBase.OBJECT_TYPE.PRESENTBOX);
      // 現在のレベル
      this.level = params.level;
      // 現在のHP
      this.hp = 'hp' in params ? params.hp : null;
      // 残りターン
      this.receiveTurn = 'receiveTurn' in params ? params.receiveTurn : this.constructor.receiveTurn;
    }

    serialize() {
      return {
        type: this.getObjectType(),
        id: this.getId(),
        level: this.level,
        hp: this.hp,
        receiveTurn: this.receiveTurn
      };
    }

    getId() {
      return this.constructor.id;
    }

    getPDef(level = null) {
      return +2e308;
    }

    getMDef(level = null) {
      return +2e308;
    }

    gacha() {}

    getReceiveTurn() {
      return this.receiveTurn;
    }

    decreaseTurn() {
      this.receiveTurn--;
      return this.receiveTurn <= 0;
    }

    static getInstance(params) {
      switch (params.id) {
        case 1:
          return new PresentboxN(params);
        case 2:
          return new PresentboxR(params);
        case 3:
          return new PresentboxSR(params);
        case 4:
          return new PresentboxSSR(params);
        case 5:
          return new PresentboxExp(params);
        case 6:
          return new PresentboxJewel(params);
      }
    }

  };

  // 基本攻撃タイプ
  PresentboxBase.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  PresentboxBase.attackBase = 0;

  // 成長率：HP
  PresentboxBase.hpBase = 0;

  // 成長率：物理防御
  PresentboxBase.pDefBase = 0;

  // 成長率：魔法防御
  PresentboxBase.mDefBase = 0;

  // 基本移動力
  PresentboxBase.moveBase = 0;

  // 基本射程
  PresentboxBase.rangeBase = 0;

  // 基本命中率
  PresentboxBase.hitRateBase = 0;

  // 必要経験値
  PresentboxBase.expRate = 0;

  // 死んだ時の台詞
  PresentboxBase.textDeath = null;

  // 受取期限
  PresentboxBase.receiveTurn = +2e308;

  // アイテムを落とす確率
  PresentboxBase.itemRate = 1;

  // アイテムのドロップテーブルID
  PresentboxBase.itemTableId = 1;

  // アイテムがジュエルになる時の額
  PresentboxBase.itemJewelAmount = 50;

  return PresentboxBase;

}).call(this);

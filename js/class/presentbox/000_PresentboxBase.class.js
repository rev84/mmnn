// Generated by CoffeeScript 2.2.2
var PresentboxBase;

PresentboxBase = (function() {
  class PresentboxBase extends ObjectBase {
    constructor(params) {
      super(ObjectBase.OBJECT_TYPE.PRESENTBOX);
      // 現在のレベル
      this.level = params.level;
      // 現在のHP
      this.hp = params.hp;
    }

    getPDef(level = null) {
      return +2e308;
    }

    getMDef(level = null) {
      return +2e308;
    }

    gacha() {}

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

  return PresentboxBase;

}).call(this);
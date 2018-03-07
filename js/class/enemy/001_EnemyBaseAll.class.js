// Generated by CoffeeScript 2.2.2
var Enemy1Base, Enemy2Base, Enemy3Base, Enemy4Base, Enemy5Base;

Enemy1Base = (function() {
  class Enemy1Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy1Base.characterId = 1;

  // キャラ名
  Enemy1Base.characterName = "きゃんきゃん";

  // 画像のリスト
  Enemy1Base.images = ["./img/enemy/1/1005010301_001.png", "./img/enemy/1/1005010301_003.png"];

  // 基本攻撃タイプ
  Enemy1Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy1Base.attackBase = 18;

  // 成長率：HP
  Enemy1Base.hpBase = 3;

  // 成長率：物理防御
  Enemy1Base.pDefBase = 1;

  // 成長率：魔法防御
  Enemy1Base.mDefBase = 3;

  // 基本移動力
  Enemy1Base.moveBase = 4;

  // 基本射程
  Enemy1Base.rangeBase = 1;

  // 基本命中率
  Enemy1Base.hitRateBase = 95;

  // 基本回避率
  Enemy1Base.dodgeRateBase = 10;

  // 出現階層
  Enemy1Base.appearance = 1;

  // 経験値係数
  Enemy1Base.expRate = 2;

  Enemy1Base.abilityName = "なし";

  Enemy1Base.abilityDesc = "なし";

  return Enemy1Base;

}).call(this);

Enemy2Base = (function() {
  class Enemy2Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy2Base.characterId = 2;

  // キャラ名
  Enemy2Base.characterName = "ミートボール";

  // 画像のリスト
  Enemy2Base.images = ["./img/enemy/2/1036010301_001.png", "./img/enemy/2/1036010301_003.png"];

  // 基本攻撃タイプ
  Enemy2Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy2Base.attackBase = 17;

  // 成長率：HP
  Enemy2Base.hpBase = 2;

  // 成長率：物理防御
  Enemy2Base.pDefBase = 1;

  // 成長率：魔法防御
  Enemy2Base.mDefBase = 3;

  // 基本移動力
  Enemy2Base.moveBase = 4;

  // 基本射程
  Enemy2Base.rangeBase = 1;

  // 基本命中率
  Enemy2Base.hitRateBase = 95;

  // 基本回避率
  Enemy2Base.dodgeRateBase = 10;

  // 出現階層
  Enemy2Base.appearance = 1;

  // 経験値係数
  Enemy2Base.expRate = 2;

  Enemy2Base.abilityName = "なし";

  Enemy2Base.abilityDesc = "なし";

  return Enemy2Base;

}).call(this);

Enemy3Base = (function() {
  class Enemy3Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy3Base.characterId = 3;

  // キャラ名
  Enemy3Base.characterName = "ピクシーFOX";

  // 画像のリスト
  Enemy3Base.images = ["./img/enemy/3/1082010301_001.png", "./img/enemy/3/1082010301_003.png"];

  // 基本攻撃タイプ
  Enemy3Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy3Base.attackBase = 18;

  // 成長率：HP
  Enemy3Base.hpBase = 3;

  // 成長率：物理防御
  Enemy3Base.pDefBase = 6;

  // 成長率：魔法防御
  Enemy3Base.mDefBase = 4;

  // 基本移動力
  Enemy3Base.moveBase = 4;

  // 基本射程
  Enemy3Base.rangeBase = 1;

  // 基本命中率
  Enemy3Base.hitRateBase = 95;

  // 基本回避率
  Enemy3Base.dodgeRateBase = 10;

  // 出現階層
  Enemy3Base.appearance = 1;

  // 経験値係数
  Enemy3Base.expRate = 2;

  Enemy3Base.abilityName = "なし";

  Enemy3Base.abilityDesc = "なし";

  return Enemy3Base;

}).call(this);

Enemy4Base = (function() {
  class Enemy4Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy4Base.characterId = 4;

  // キャラ名
  Enemy4Base.characterName = "マジスコ";

  // 画像のリスト
  Enemy4Base.images = ["./img/enemy/4/1084010301_001.png", "./img/enemy/4/1084010301_003.png"];

  // 基本攻撃タイプ
  Enemy4Base.attackTypeBase = ObjectBase.ATTACK_TYPE.MAGIC;

  // 成長率：攻撃力
  Enemy4Base.attackBase = 19;

  // 成長率：HP
  Enemy4Base.hpBase = 3;

  // 成長率：物理防御
  Enemy4Base.pDefBase = 7;

  // 成長率：魔法防御
  Enemy4Base.mDefBase = 4;

  // 基本移動力
  Enemy4Base.moveBase = 3;

  // 基本射程
  Enemy4Base.rangeBase = 4;

  // 基本命中率
  Enemy4Base.hitRateBase = 95;

  // 基本回避率
  Enemy4Base.dodgeRateBase = 10;

  // 出現階層
  Enemy4Base.appearance = 1;

  // 経験値係数
  Enemy4Base.expRate = 2;

  Enemy4Base.abilityName = "なし";

  Enemy4Base.abilityDesc = "なし";

  return Enemy4Base;

}).call(this);

Enemy5Base = (function() {
  class Enemy5Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy5Base.characterId = 5;

  // キャラ名
  Enemy5Base.characterName = "ばくだんいわ";

  // 画像のリスト
  Enemy5Base.images = ["./img/enemy/5/1.png"];

  // 基本攻撃タイプ
  Enemy5Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy5Base.attackBase = 0;

  // 成長率：HP
  Enemy5Base.hpBase = 3;

  // 成長率：物理防御
  Enemy5Base.pDefBase = 8;

  // 成長率：魔法防御
  Enemy5Base.mDefBase = 8;

  // 基本移動力
  Enemy5Base.moveBase = 0;

  // 基本射程
  Enemy5Base.rangeBase = 0;

  // 基本命中率
  Enemy5Base.hitRateBase = 95;

  // 基本回避率
  Enemy5Base.dodgeRateBase = 10;

  // 出現階層
  Enemy5Base.appearance = 1;

  // 経験値係数
  Enemy5Base.expRate = 2;

  Enemy5Base.abilityName = "なし";

  Enemy5Base.abilityDesc = "なし";

  return Enemy5Base;

}).call(this);

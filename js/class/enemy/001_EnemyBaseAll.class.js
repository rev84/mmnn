// Generated by CoffeeScript 2.2.3
var Enemy1Base, Enemy2Base, Enemy3Base, Enemy4Base, Enemy5Base, Enemy6Base, Enemy7Base, Enemy8Base, Enemy9Base;

Enemy1Base = (function() {
  class Enemy1Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy1Base.characterId = 1;

  // キャラ名
  Enemy1Base.characterName = "キモヲタくん";

  // 画像のリスト
  Enemy1Base.images = ["./img/enemy/1/enemy_kimowota_1.png", "./img/enemy/1/enemy_kimowota_2.png"];

  // 基本攻撃タイプ
  Enemy1Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy1Base.attackBase = 7;

  // 成長率：HP
  Enemy1Base.hpBase = 20;

  // 成長率：物理防御
  Enemy1Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy1Base.mDefBase = 3;

  // 基本移動力
  Enemy1Base.moveBase = 4;

  // 基本射程
  Enemy1Base.rangeBase = 1;

  // 基本命中率
  Enemy1Base.hitRateBase = 95;

  // 基本回避率
  Enemy1Base.dodgeRateBase = 3;

  // 出現階層
  Enemy1Base.appearance = 1;

  // 経験値係数
  Enemy1Base.expRate = 2;

  // アイテムを落とす確率
  Enemy1Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy1Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy1Base.itemJewelAmount = 50;

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
  Enemy2Base.characterName = "ギタリスト";

  // 画像のリスト
  Enemy2Base.images = ["./img/enemy/2/enemy_guitarist_1.png", "./img/enemy/2/enemy_guitarist_2.png"];

  // 基本攻撃タイプ
  Enemy2Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy2Base.attackBase = 8;

  // 成長率：HP
  Enemy2Base.hpBase = 22;

  // 成長率：物理防御
  Enemy2Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy2Base.mDefBase = 3;

  // 基本移動力
  Enemy2Base.moveBase = 4;

  // 基本射程
  Enemy2Base.rangeBase = 1;

  // 基本命中率
  Enemy2Base.hitRateBase = 95;

  // 基本回避率
  Enemy2Base.dodgeRateBase = 3;

  // 出現階層
  Enemy2Base.appearance = 1;

  // 経験値係数
  Enemy2Base.expRate = 2;

  // アイテムを落とす確率
  Enemy2Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy2Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy2Base.itemJewelAmount = 50;

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
  Enemy3Base.characterName = "女オタ";

  // 画像のリスト
  Enemy3Base.images = ["./img/enemy/3/enemy_kona_1.png", "./img/enemy/3/enemy_kona_2.png"];

  // 基本攻撃タイプ
  Enemy3Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy3Base.attackBase = 7;

  // 成長率：HP
  Enemy3Base.hpBase = 18;

  // 成長率：物理防御
  Enemy3Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy3Base.mDefBase = 5;

  // 基本移動力
  Enemy3Base.moveBase = 4;

  // 基本射程
  Enemy3Base.rangeBase = 1;

  // 基本命中率
  Enemy3Base.hitRateBase = 95;

  // 基本回避率
  Enemy3Base.dodgeRateBase = 5;

  // 出現階層
  Enemy3Base.appearance = 1;

  // 経験値係数
  Enemy3Base.expRate = 2;

  // アイテムを落とす確率
  Enemy3Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy3Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy3Base.itemJewelAmount = 50;

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
  Enemy4Base.characterName = "ハッピオタ";

  // 画像のリスト
  Enemy4Base.images = ["./img/enemy/4/enemy_tarako_1.png", "./img/enemy/4/enemy_tarako_2.png"];

  // 基本攻撃タイプ
  Enemy4Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy4Base.attackBase = 8;

  // 成長率：HP
  Enemy4Base.hpBase = 22;

  // 成長率：物理防御
  Enemy4Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy4Base.mDefBase = 3;

  // 基本移動力
  Enemy4Base.moveBase = 4;

  // 基本射程
  Enemy4Base.rangeBase = 1;

  // 基本命中率
  Enemy4Base.hitRateBase = 95;

  // 基本回避率
  Enemy4Base.dodgeRateBase = 3;

  // 出現階層
  Enemy4Base.appearance = 1;

  // 経験値係数
  Enemy4Base.expRate = 2;

  // アイテムを落とす確率
  Enemy4Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy4Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy4Base.itemJewelAmount = 50;

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
  Enemy5Base.characterName = "カメラくん";

  // 画像のリスト
  Enemy5Base.images = ["./img/enemy/5/enemy_cam_1.png", "./img/enemy/5/enemy_cam_2.png"];

  // 基本攻撃タイプ
  Enemy5Base.attackTypeBase = ObjectBase.ATTACK_TYPE.MAGIC;

  // 成長率：攻撃力
  Enemy5Base.attackBase = 7;

  // 成長率：HP
  Enemy5Base.hpBase = 19;

  // 成長率：物理防御
  Enemy5Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy5Base.mDefBase = 3;

  // 基本移動力
  Enemy5Base.moveBase = 4;

  // 基本射程
  Enemy5Base.rangeBase = 4;

  // 基本命中率
  Enemy5Base.hitRateBase = 95;

  // 基本回避率
  Enemy5Base.dodgeRateBase = 3;

  // 出現階層
  Enemy5Base.appearance = 1;

  // 経験値係数
  Enemy5Base.expRate = 2;

  // アイテムを落とす確率
  Enemy5Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy5Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy5Base.itemJewelAmount = 50;

  Enemy5Base.abilityName = "なし";

  Enemy5Base.abilityDesc = "なし";

  return Enemy5Base;

}).call(this);

Enemy6Base = (function() {
  class Enemy6Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy6Base.characterId = 6;

  // キャラ名
  Enemy6Base.characterName = "ヲタ芸（太）";

  // 画像のリスト
  Enemy6Base.images = ["./img/enemy/6/enemy_wotageir_1.png", "./img/enemy/6/enemy_wotageir_2.png"];

  // 基本攻撃タイプ
  Enemy6Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy6Base.attackBase = 10;

  // 成長率：HP
  Enemy6Base.hpBase = 30;

  // 成長率：物理防御
  Enemy6Base.pDefBase = 5;

  // 成長率：魔法防御
  Enemy6Base.mDefBase = 3;

  // 基本移動力
  Enemy6Base.moveBase = 3;

  // 基本射程
  Enemy6Base.rangeBase = 1;

  // 基本命中率
  Enemy6Base.hitRateBase = 90;

  // 基本回避率
  Enemy6Base.dodgeRateBase = 1;

  // 出現階層
  Enemy6Base.appearance = 1;

  // 経験値係数
  Enemy6Base.expRate = 2;

  // アイテムを落とす確率
  Enemy6Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy6Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy6Base.itemJewelAmount = 50;

  Enemy6Base.abilityName = "なし";

  Enemy6Base.abilityDesc = "なし";

  return Enemy6Base;

}).call(this);

Enemy7Base = (function() {
  class Enemy7Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy7Base.characterId = 7;

  // キャラ名
  Enemy7Base.characterName = "ヲタ芸（細）";

  // 画像のリスト
  Enemy7Base.images = ["./img/enemy/7/enemy_wotageiy_1.png", "./img/enemy/7/enemy_wotageiy_2.png"];

  // 基本攻撃タイプ
  Enemy7Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy7Base.attackBase = 8;

  // 成長率：HP
  Enemy7Base.hpBase = 16;

  // 成長率：物理防御
  Enemy7Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy7Base.mDefBase = 4;

  // 基本移動力
  Enemy7Base.moveBase = 5;

  // 基本射程
  Enemy7Base.rangeBase = 1;

  // 基本命中率
  Enemy7Base.hitRateBase = 95;

  // 基本回避率
  Enemy7Base.dodgeRateBase = 5;

  // 出現階層
  Enemy7Base.appearance = 1;

  // 経験値係数
  Enemy7Base.expRate = 2;

  // アイテムを落とす確率
  Enemy7Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy7Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy7Base.itemJewelAmount = 50;

  Enemy7Base.abilityName = "なし";

  Enemy7Base.abilityDesc = "なし";

  return Enemy7Base;

}).call(this);

Enemy8Base = (function() {
  class Enemy8Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy8Base.characterId = 8;

  // キャラ名
  Enemy8Base.characterName = "課金王";

  // 画像のリスト
  Enemy8Base.images = ["./img/enemy/8/enemy_kakin_1.png", "./img/enemy/8/enemy_kakin_2.png"];

  // 基本攻撃タイプ
  Enemy8Base.attackTypeBase = ObjectBase.ATTACK_TYPE.MAGIC;

  // 成長率：攻撃力
  Enemy8Base.attackBase = 8;

  // 成長率：HP
  Enemy8Base.hpBase = 22;

  // 成長率：物理防御
  Enemy8Base.pDefBase = 3;

  // 成長率：魔法防御
  Enemy8Base.mDefBase = 3;

  // 基本移動力
  Enemy8Base.moveBase = 4;

  // 基本射程
  Enemy8Base.rangeBase = 2;

  // 基本命中率
  Enemy8Base.hitRateBase = 95;

  // 基本回避率
  Enemy8Base.dodgeRateBase = 3;

  // 出現階層
  Enemy8Base.appearance = 1;

  // 経験値係数
  Enemy8Base.expRate = 2;

  // アイテムを落とす確率
  Enemy8Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy8Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy8Base.itemJewelAmount = 50;

  Enemy8Base.abilityName = "魔法のカード";

  Enemy8Base.abilityDesc = "よくジュエルを落とす";

  return Enemy8Base;

}).call(this);

Enemy9Base = (function() {
  class Enemy9Base extends EnemyBase {
    constructor(params) {
      super(params);
    }

  };

  // ID
  Enemy9Base.characterId = 9;

  // キャラ名
  Enemy9Base.characterName = "ウルヴァリン";

  // 画像のリスト
  Enemy9Base.images = ["./img/enemy/9/enemy_wolverine_1.png", "./img/enemy/9/enemy_wolverine_2.png"];

  // 基本攻撃タイプ
  Enemy9Base.attackTypeBase = ObjectBase.ATTACK_TYPE.PHYSIC;

  // 成長率：攻撃力
  Enemy9Base.attackBase = 8;

  // 成長率：HP
  Enemy9Base.hpBase = 20;

  // 成長率：物理防御
  Enemy9Base.pDefBase = 4;

  // 成長率：魔法防御
  Enemy9Base.mDefBase = 3;

  // 基本移動力
  Enemy9Base.moveBase = 4;

  // 基本射程
  Enemy9Base.rangeBase = 1;

  // 基本命中率
  Enemy9Base.hitRateBase = 95;

  // 基本回避率
  Enemy9Base.dodgeRateBase = 3;

  // 出現階層
  Enemy9Base.appearance = 1;

  // 経験値係数
  Enemy9Base.expRate = 2;

  // アイテムを落とす確率
  Enemy9Base.itemRate = 0.1;

  // アイテムのドロップテーブルID
  Enemy9Base.itemTableId = 8;

  // アイテムがジュエルになる時の額
  Enemy9Base.itemJewelAmount = 50;

  Enemy9Base.abilityName = "なし";

  Enemy9Base.abilityDesc = "なし";

  return Enemy9Base;

}).call(this);

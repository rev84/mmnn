// Generated by CoffeeScript 2.2.2
var PresentboxBasic;

PresentboxBasic = (function() {
  class PresentboxBasic extends PresentboxBase {
    getHpMax(level = null) {
      return 3;
    }

  };

  // キャラ名
  PresentboxBasic.characterName = "プレゼント（白）";

  // 画像のリスト
  PresentboxBasic.images = ["./img/presentbox/presentbox_basic.png"];

  PresentboxBasic.abilityName = "プレゼント";

  PresentboxBasic.abilityDesc = "倒すとアイテムを入手できる。ただし、受取期限ターンが0になると、自然消滅してしまう";

  PresentboxBasic.receiveTurn = 10;

  return PresentboxBasic;

}).call(this);

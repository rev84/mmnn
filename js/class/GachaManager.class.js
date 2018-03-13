// Generated by CoffeeScript 2.2.2
var GachaManager;

GachaManager = (function() {
  class GachaManager {
    static init(gameElement) {
      this.gameElement = gameElement;
      this.divObject = $('<div>').attr('id', this.ID);
      $('<img>').addClass('gacha_image').attr('src', './img/gacha.png').appendTo(this.divObject);
      $('<button>').addClass('gacha_button').html('引く').appendTo(this.divObject).on('click', this.onGain.bind(this));
      return this.divObject.appendTo(this.gameElement);
    }

    static async onGain() {
      var characterObj, res, seed;
      // ジュエルが足りない
      if (EnvManager.decreaseJewel(this.PRICE) === false) {
        return;
      }
      seed = Math.random();
      characterObj = CharacterBase.getUnjoinedCharacter();
      // アイドルが出る
      if (seed < this.CHARACTER_PROBABILITY && characterObj !== false) {
        await ItemWindow.showCharacter(characterObj);
        characterObj.setJoined(true);
      } else {
        // アイテムが出る
        res = ItemManager.getItemObjectFromItemTableId(this.ITEM_TABLE);
        // 最低レベルのアイテムを与える
        res.increaseAmount(0);
        await ItemWindow.showItem(res);
      }
      // セーブ
      return SaveManager.save();
    }

  };

  GachaManager.ID = 'gacha';

  GachaManager.PRICE = 250;

  GachaManager.ITEM_TABLE = 7;

  GachaManager.CHARACTER_PROBABILITY = 1;

  return GachaManager;

}).call(this);
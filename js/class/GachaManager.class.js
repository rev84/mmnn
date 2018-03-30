// Generated by CoffeeScript 2.2.3
var GachaManager;

GachaManager = (function() {
  class GachaManager {
    static init(gameElement) {
      this.gameElement = gameElement;
      this.divObject = $('<div>').attr('id', this.ID);
      $('<img>').addClass('gacha_image').attr('src', './img/gacha.png').appendTo(this.divObject);
      this.button = $('<button>').addClass('btn btn-lg btn-primary gacha_button').html('スタージュエル250個で引く').on('click', this.onGain.bind(this)).appendTo(this.divObject);
      return this.divObject.appendTo(this.gameElement);
    }

    static refreshButton() {
      return this.button.prop('disabled', !(250 <= EnvManager.getJewel()));
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
      SaveManager.save();
      // ボタンの更新
      return this.refreshButton();
    }

  };

  GachaManager.ID = 'gacha';

  GachaManager.PRICE = 250;

  GachaManager.ITEM_TABLE = 7;

  GachaManager.CHARACTER_PROBABILITY = 1;

  return GachaManager;

}).call(this);

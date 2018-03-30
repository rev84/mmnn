// Generated by CoffeeScript 2.2.3
var ItemWindow;

ItemWindow = (function() {
  class ItemWindow {
    static init(savedata) {
      this.divObject = $('#item_window').on('hidden.bs.modal', this.onClose.bind(this));
      this.imgElement = $('#item_window_img');
      this.nameElement = $('#item_window_name');
      return this.descriptionElement = $('#item_window_description');
    }

    static async showItem(itemObject, isWaitClose = true) {
      var results;
      if (isWaitClose) {
        this.CLOSED = false;
      }
      this.imgElement.attr('src', itemObject.getImage());
      this.nameElement.html(itemObject.getName());
      this.descriptionElement.html(itemObject.getDescription());
      this.divObject.modal('show');
      if (isWaitClose) {
        results = [];
        while (!this.CLOSED) {
          results.push((await Utl.sleep(1000)));
        }
        return results;
      }
    }

    static async showCharacter(characterObject, isWaitClose = true) {
      var results;
      if (isWaitClose) {
        this.CLOSED = false;
      }
      this.imgElement.attr('src', characterObject.getBaseImage());
      this.nameElement.html(characterObject.getName());
      this.descriptionElement.html('アイドルがライブに参加してくれるようになりました');
      this.divObject.modal('show');
      if (isWaitClose) {
        results = [];
        while (!this.CLOSED) {
          results.push((await Utl.sleep(1000)));
        }
        return results;
      }
    }

    static async showJewel(jewelAmount, isWaitClose = true) {
      var results;
      if (isWaitClose) {
        this.CLOSED = false;
      }
      this.imgElement.attr('src', './img/jewel.png');
      this.nameElement.html('' + jewelAmount + 'ジュエル');
      this.descriptionElement.html('ジュエルです');
      this.divObject.modal('show');
      if (isWaitClose) {
        results = [];
        while (!this.CLOSED) {
          results.push((await Utl.sleep(1000)));
        }
        return results;
      }
    }

    static async showExp(expAmount, isWaitClose = true) {
      var results;
      if (isWaitClose) {
        this.CLOSED = false;
      }
      this.imgElement.attr('src', './img/jewel.png');
      this.nameElement.html('経験値' + expAmount + '');
      this.descriptionElement.html('アイドルをレッスンできます');
      this.divObject.modal('show');
      if (isWaitClose) {
        results = [];
        while (!this.CLOSED) {
          results.push((await Utl.sleep(1000)));
        }
        return results;
      }
    }

    static onClose() {
      return this.CLOSED = true;
    }

  };

  ItemWindow.CLOSED = true;

  return ItemWindow;

}).call(this);

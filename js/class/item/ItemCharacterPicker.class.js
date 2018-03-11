// Generated by CoffeeScript 2.2.2
var ItemCharacterPicker;

ItemCharacterPicker = (function() {
  class ItemCharacterPicker {
    static init(parentObject) {
      this.parentObject = parentObject;
      this.divObject = $('<div>').attr('id', this.ID);
      this.characters = [];
      return this.divObject.appendTo(this.parentObject.divObject);
    }

    static draw() {
      var c, i, index, k, len, panel, ref, ref1, results, top;
      this.characters = [];
      ref = GameManager.characters;
      for (k in ref) {
        c = ref[k];
        this.characters.push(c);
      }
      this.characters.sort(function(a, b) {
        return Number(a.getId()) - Number(b.getId());
      });
      this.panels = [];
      $('#' + this.ID + ' > .panel').remove();
      ref1 = this.characters;
      results = [];
      for (index = i = 0, len = ref1.length; i < len; index = ++i) {
        c = ref1[index];
        top = index * Panel.SIZE_Y;
        panel = new Panel(this.divObject, c, top);
        // キャラ選択パネルに、キャラ選択イベントを登録
        panel.divObject.on('click', this.onClick.bind(this, c));
        results.push(this.panels.push(panel));
      }
      return results;
    }

    static onClick(characterObject) {
      return ItemEquipmentEditor.select(characterObject);
    }

  };

  ItemCharacterPicker.ID = 'item_character_picker';

  return ItemCharacterPicker;

}).call(this);

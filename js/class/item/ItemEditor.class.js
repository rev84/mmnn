// Generated by CoffeeScript 2.2.3
var ItemEditor;

ItemEditor = (function() {
  class ItemEditor {
    static init(parentObject) {
      var i, itemId, itemObject, items, len, ref;
      this.parentObject = parentObject;
      this.divObject = $('<div>').attr('id', this.ID);
      items = [];
      ref = ItemManager.items;
      for (itemId in ref) {
        itemObject = ref[itemId];
        items.push(itemObject);
      }
      items.sort(function(a, b) {
        return a.getDisplayOrder() - b.getDisplayOrder();
      });
      this.panels = [];
      for (i = 0, len = items.length; i < len; i++) {
        itemObject = items[i];
        this.panels.push(new ItemEditorPanel(this.divObject, itemObject));
      }
      this.draw();
      return this.divObject.appendTo(this.parentObject.divObject);
    }

    static draw() {
      var i, len, panel, ref, results, y;
      ItemManager.calcUsedItemCount();
      y = 0;
      ref = this.panels;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        panel = ref[i];
        if (!GameManager.DEBUG_CONFIG.IS_SHOW_ALL_ITEMS && panel.itemObject.isNothing()) {
          panel.hide();
          continue;
        }
        panel.draw();
        panel.show(y);
        results.push(y += ItemEditorPanel.SIZE_Y);
      }
      return results;
    }

  };

  ItemEditor.ID = 'item_editor';

  return ItemEditor;

}).call(this);

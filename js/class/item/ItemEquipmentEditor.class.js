// Generated by CoffeeScript 2.2.2
var ItemEquipmentEditor;

ItemEquipmentEditor = (function() {
  class ItemEquipmentEditor {
    static init(parentObject) {
      this.parentObject = parentObject;
      this.divObject = $('<div>').attr('id', this.ID);
      // ラベル
      $('<div>').addClass('equipment_editor_section').appendTo(this.divObject);
      // 全解除
      $('<div>').addClass('equipment_editor_remove_all').on('click', this.onClickRemoveAll.bind(this)).appendTo(this.divObject);
      // パネル
      this.panel = null;
      // 装備品一覧
      this.equipItems = $('<div>').addClass('equipment_editor_items').appendTo(this.divObject);
      // コスト
      $('<div>').addClass('equipment_editor_cost_section').appendTo(this.divObject);
      this.costMax = $('<div>').addClass('equipment_editor_cost_max').appendTo(this.divObject);
      this.costNow = $('<div>').addClass('equipment_editor_cost_now').appendTo(this.divObject);
      this.characterObject = null;
      return this.divObject.appendTo(this.parentObject.divObject);
    }

    static select(characterObject) {
      this.characterObject = characterObject;
      this.draw();
      this.drawCost();
      return this.drawEquipmentItems();
    }

    static draw(newItem = null, dropItem = null) {
      if (this.panel !== null) {
        this.panel.removeMe();
      }
      // パネル
      return this.panel = new Panel(this.divObject, this.characterObject, null, null, false);
    }

    static drawCost(newItem = null, dropItem = null) {
      var max, now;
      max = this.characterObject === null ? '-' : this.characterObject.getItemCapacity();
      now = this.characterObject === null ? '-' : this.characterObject.getItemCostTotal();
      this.costMax.html(max);
      return this.costNow.html(now);
    }

    static drawEquipmentItems() {
      var i, itemCost, itemName, itemObject, len, level, panel, ref, results, y;
      this.equipItems.find('*').remove();
      if (this.characterObject === null) {

      } else if (this.characterObject.getItems().length === 0) {
        panel = $('<div>').addClass('equipment_item_panel');
        itemName = $('<div>').addClass('equipment_item_panel_name').html('なし').appendTo(panel);
        return panel.appendTo(this.equipItems);
      } else {
        y = 0;
        ref = this.characterObject.getItems();
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          [itemObject, level] = ref[i];
          panel = $('<div>').addClass('equipment_item_panel').css('top', '' + y + 'px').on('click contextmenu', this.onClickItemPanel.bind(this, itemObject, level));
          itemName = $('<div>').addClass('equipment_item_panel_name').html(itemObject.getNameWithLevel(level)).appendTo(panel);
          itemCost = $('<div>').addClass('equipment_item_panel_cost').html(itemObject.getCost(level)).appendTo(panel);
          panel.appendTo(this.equipItems);
          results.push(y += 50);
        }
        return results;
      }
    }

    static onClickItemPanel(itemObject, level) {
      this.characterObject.dropItem(itemObject, level);
      ItemManager.calcUsedItemCount();
      this.select(this.characterObject);
      return ItemEditor.draw();
    }

    static onClickRemoveAll() {
      if (this.characterObject === null) {
        return;
      }
      this.characterObject.dropAllItem();
      ItemManager.calcUsedItemCount();
      this.select(this.characterObject);
      return ItemEditor.draw();
    }

  };

  ItemEquipmentEditor.ID = 'item_equipment_editor';

  return ItemEquipmentEditor;

}).call(this);

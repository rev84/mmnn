class ItemEditor
  @ID: 'item_editor'

  @init:(@parentObject)->
    @divObject = $('<div>').attr('id', @ID)

    items = []
    items.push itemObject for itemId, itemObject of ItemManager.items
    items.sort (a, b)->
      a.getDisplayOrder() - b.getDisplayOrder()
    @panels = []
    for itemObject in items
      @panels.push(new ItemEditorPanel(@divObject, itemObject))

    @draw()
    @divObject.appendTo @parentObject.divObject

  @draw:->
    ItemManager.calcUsedItemCount()
    y = 0
    for panel in @panels
      if !GameManager.DEBUG_CONFIG.IS_SHOW_ALL_ITEMS and panel.itemObject.isNothing()
        panel.hide()
        continue
      panel.draw()
      panel.show y
      y += ItemEditorPanel.SIZE_Y

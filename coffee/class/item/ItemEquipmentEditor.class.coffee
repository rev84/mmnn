class ItemEquipmentEditor
  @ID: 'item_equipment_editor'

  @init:(@parentObject)->
    @divObject = $('<div>').attr('id', @ID)
    # ラベル
    $('<div>').addClass('equipment_editor_section').appendTo(@divObject)
    # 全解除
    $('<div>').addClass('equipment_editor_remove_all').on('click', @onClickRemoveAll.bind(@)).appendTo(@divObject)
    # パネル
    @panel = null
    # 装備品一覧
    @equipItems = $('<div>').addClass('equipment_editor_items').appendTo(@divObject)
    # コスト
    $('<div>').addClass('equipment_editor_cost_section').appendTo(@divObject)
    @costMax = $('<div>').addClass('equipment_editor_cost_max').appendTo(@divObject)
    @costNow = $('<div>').addClass('equipment_editor_cost_now').appendTo(@divObject)

    @characterObject = null
    @divObject.appendTo @parentObject.divObject

  @select:(characterObject)->
    @characterObject = characterObject
    @draw()
    @drawCost()
    @drawEquipmentItems()

  @draw:(newItem = null, dropItem = null)->
    @panel.removeMe() if @panel isnt null
    # パネル
    @panel = new Panel(@divObject, @characterObject, null, null, false)

  @drawCost:(newItem = null, dropItem = null)->
    max = if @characterObject is null then '-' else @characterObject.getItemCapacity()
    now = if @characterObject is null then '-' else @characterObject.getItemCostTotal()
    @costMax.html(max)
    @costNow.html(now)

  @drawEquipmentItems:->
    @equipItems.find('*').remove()
    if @characterObject is null
      ;
    else if @characterObject.getItems().length is 0
      panel = $('<div>').addClass('equipment_item_panel')
      itemName = $('<div>').addClass('equipment_item_panel_name').html('なし').appendTo(panel)
      panel.appendTo @equipItems
    else
      y = 0
      for [itemObject, level] in @characterObject.getItems()
        panel = $('<div>').addClass('equipment_item_panel').css('top', ''+y+'px')
                .on('click contextmenu', @onClickItemPanel.bind(@, itemObject, level))
        itemName = $('<div>').addClass('equipment_item_panel_name').html(itemObject.getNameWithLevel(level)).appendTo(panel)
        itemCost = $('<div>').addClass('equipment_item_panel_cost').html(itemObject.getCost(level)).appendTo(panel)
        panel.appendTo @equipItems
        y += 50

  @onClickItemPanel:(itemObject, level)->
    @characterObject.dropItem itemObject, level
    ItemManager.calcUsedItemCount()
    @select @characterObject
    ItemEditor.draw()

  @onClickRemoveAll:->
    return if @characterObject is null

    @characterObject.dropAllItem()
    ItemManager.calcUsedItemCount()
    @select @characterObject
    ItemEditor.draw()
    
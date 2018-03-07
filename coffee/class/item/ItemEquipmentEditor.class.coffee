class ItemEquipmentEditor
  @ID: 'item_equipment_editor'

  @init:(@parentObject)->
    @divObject = $('<div>').attr('id', @ID)
    # ラベル
    $('<div>').addClass('equipment_editor_section').appendTo(@divObject)
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
    @panel = new Panel(@divObject, @characterObject)

  @drawCost:(newItem = null, dropItem = null)->
    @costMax.html(@characterObject.getItemCapacity())
    @costNow.html(@characterObject.getItemCostTotal())

  @drawEquipmentItems:->
    @equipItems.find('*').remove()
    if @characterObject.getItems().length is 0
      panel = $('<div>').addClass('equipment_item_panel')
      itemName = $('<div>').addClass('equipment_item_panel_name').html('なし').appendTo(panel)
      panel.appendTo @equipItems
    else
      y = 0
      for [itemObject, level] in @characterObject.getItems()
        panel = $('<div>').addClass('equipment_item_panel').css('top', ''+y+'px')
        itemName = $('<div>').addClass('equipment_item_panel_name').html(itemObject.getNameWithLevel(level)).appendTo(panel)
        itemCost = $('<div>').addClass('equipment_item_panel_cost').html(itemObject.getCost(level)).appendTo(panel)
        panel.appendTo @equipItems
        y += 50

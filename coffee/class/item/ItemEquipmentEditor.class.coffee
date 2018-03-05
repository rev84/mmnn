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

  @draw:(newItem = null, dropItem = null)->
    @panel.removeMe() if @panel isnt null
    # パネル
    @panel = new Panel(@divObject, @characterObject)
    
  @drawCost:(newItem = null, dropItem = null)->
    @costNow.html(@characterObject.getItemCapacity())
    # パネル
    @panel = new Panel(@divObject, @characterObject)

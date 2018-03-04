class ItemEquipmentEditor
  @ID: 'item_equipment_editor'

  @init:(@parentObject)->
    @divObject = $('<div>').attr('id', @ID)

    @divObject.appendTo @parentObject.divObject

class ItemEditor
  @ID: 'item_editor'

  @init:(@parentObject)->
    @divObject = $('<div>').attr('id', @ID)

    @divObject.appendTo @parentObject.divObject

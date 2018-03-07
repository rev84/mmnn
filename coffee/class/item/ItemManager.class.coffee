class ItemManager
  @ID: 'item'

  @init:(@gameElement, savedata)->

    @divObject = $('<div>').attr('id', @ID)

    # キャラを持つ
    @characters = []
    @characters.push c for k, c of GameManager.characters
    # アイテムのインスタンス
    @items = {}
    @setItems savedata
    # アイテムの数をカウント
    @usedItemCount = {}
    @calcUsedItemCount()

    ItemCharacterPicker.init(@)
    ItemEquipmentEditor.init(@)
    ItemEditor.init(@)

    @divObject.appendTo @gameElement

  @setItems:(savedata)->
    for itemId, itemBody of GameManager.items
      @items[itemId] = new Item(itemId, itemBody)
      for level in [0...itemBody.cost.length]
        # セーブデータに持ってる数があればセット
        if savedata isnt null and itemId of savedata and level of savedata[itemId]
          @items[itemId].setAmount level, savedata[itemId][level]
        # なければ0個
        else
          ;

  @calcUsedItemCount:->
    @usedItemCount = {}
    for k, cObj of GameManager.characters
      for [itemObj, level] in cObj.getItems()
        @usedItemCount[itemObj.getId()] = Array(itemObj.getMaxLevel()+1).fill(0) unless itemObj.getId() of @usedItemCount
        @usedItemCount[itemObj.getId()][level]++
        
  @repick:->
    ItemEquipmentEditor.select @characters[0]

  @show:->
    @divObject.removeClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

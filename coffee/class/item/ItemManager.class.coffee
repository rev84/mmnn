class ItemManager
  @ID: 'item'

  @init:(@gameElement, savedata)->

    @divObject = $('<div>').attr('id', @ID)

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

  @setItems:(savedata = null)->
    for itemId, itemBody of GameManager.items
      @items[itemId] = new Item(itemId, itemBody)
      for level in [0...itemBody.cost.length]
        # セーブデータに持ってる数があればセット
        if savedata isnt null and itemId of savedata and 'amount' of savedata[itemId]
          for amount, level in savedata[itemId].amount
            @items[itemId].setAmount level, amount
        # なければ0個
        else
          ;

  @calcUsedItemCount:->
    @usedItemCount = {}
    for k, cObj of GameManager.characters
      for [itemId, level] in cObj.getItems()
        itemObj = @itemId2object itemId
        @usedItemCount[itemObj.getId()] = Array(itemObj.getMaxLevel()+1).fill(0) unless itemObj.getId() of @usedItemCount
        @usedItemCount[itemObj.getId()][level]++
        
  @repick:->
    ItemEquipmentEditor.select()

  @show:->
    @divObject.removeClass('no_display')

  @hide:->
    @divObject.addClass('no_display')

  # アイテムテーブルを指定すれば、そのテーブルで落ちるアイテムを返す。falseはジュエルにする
  @getItemObjectFromItemTableId:(itemTableId)->
    seed = Math.random()
    total = 0
    for itemId, itemObject of @items
      total += itemObject.getItemRate(itemTableId)
      return itemObject if seed < total
    false

  @itemId2object:(id)->
    @items[id]
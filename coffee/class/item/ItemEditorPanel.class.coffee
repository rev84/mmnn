class ItemEditorPanel
  @SIZE_Y: 200

  constructor:(@parentElement, @itemObject)->
    @divObject = $('<div>').addClass('item_editor_panel').appendTo(@parentElement)
    @itemCountNow = []
    @itemCountMax = []
    @itemCostNumber = []

    # アイテム名
    $('<div>').html(@itemObject.getName()).addClass('item_editor_header').appendTo(@divObject)

    for level in [@itemObject.getMinLevel()..@itemObject.getMaxLevel()]
      div = $('<div>').addClass('item_editor_item').css({left: level*(60+40)})
      .appendTo(@divObject)
      .on('click', @onClickItem.bind(@, level))

      itemCountNow = $('<div>').addClass('item_editor_item_count_now')
      itemCountMax = $('<div>').addClass('item_editor_item_count_max')
      itemCostNumber = $('<div>').addClass('item_editor_item_cost_number')
      @itemCountNow[level] = itemCountNow
      @itemCountMax[level] = itemCountMax
      @itemCostNumber[level] = itemCostNumber

      $('<div>').addClass('item_editor_item_header').html('★'+(level+1)).appendTo(div)
      $('<div>').addClass('item_editor_item_count').append(
        itemCountNow
      ).append(
        itemCountMax
      )
      .appendTo(div)

      $('<div>').addClass('item_editor_item_cost').append(
        itemCostNumber
      ).append(
        $('<div>').addClass('item_editor_item_cost_header').html('コスト')
      ).appendTo(div)
      if level + 1 <= @itemObject.getMaxLevel()
        $('<button>').addClass('item_editor_item_levelup').html('▶').css({
          left: (60+40)*level+60
        })
        .on('click', @onClickLevelup.bind(@, level))
        .appendTo(@divObject)

    @draw()
    
  draw:->
    for level in [@itemObject.getMinLevel()..@itemObject.getMaxLevel()]
      usedItemCount = @getUsedCount(level)
      @itemCountNow[level].html(@getRestCount(level))
      @itemCountMax[level].html(@getAllCount(level))
      @itemCostNumber[level].html(@itemObject.getCost(level))

  show:(y)->
    @divObject.css('top', ''+y+'px').removeClass('no_display')

  hide:->
    @divObject.addClass('no_display')


  onClickItem:(level)->
    # アイテムがもうない
    return if @getRestCount(level) <= 0

    cObj = ItemEquipmentEditor.characterObject

    # コストがいっぱい
    return if cObj.getItemCapacity() < cObj.getItemCostTotal() + @itemObject.getCost(level)

    cObj.setItem @itemObject, level
    ItemManager.calcUsedItemCount()
    ItemEquipmentEditor.select cObj
    @draw()

  onClickLevelup:(fromLevel)->

  getUsedCount:(level)->
    usedItemCount = 0
    if @itemObject.getId() of ItemManager.usedItemCount and level of ItemManager.usedItemCount[@itemObject.getId()]
      usedItemCount = ItemManager.usedItemCount[@itemObject.getId()][level]
    usedItemCount

  getAllCount:(level)->
    @itemObject.getAmount(level)

  getRestCount:(level)->
    @getAllCount(level) - @getUsedCount(level)
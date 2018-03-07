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
      div = $('<div>').addClass('item_editor_item').css({left: level*(60+40)}).appendTo(@divObject)
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
      .on('click', @onClickItem.bind(@, level))
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
      usedItemCount = 0
      if @itemObject.getId() of ItemManager.usedItemCount and level of ItemManager.usedItemCount[@itemObject.getId()]
        usedItemCount = ItemManager.usedItemCount[@itemObject.getId()][level]
      @itemCountNow[level].html(@itemObject.getAmount(level) - usedItemCount)
      @itemCountMax[level].html(@itemObject.getAmount(level))
      @itemCostNumber[level].html(@itemObject.getCost(level))

  show:(y)->
    @divObject.css('top', ''+y+'px').removeClass('no_display')

  hide:->
    @divObject.addClass('no_display')


  onClickItem:(level)->
    if @itemObject
      ;

  onClickLevelup:(fromLevel)->

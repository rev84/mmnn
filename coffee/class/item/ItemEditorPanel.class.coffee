class ItemEditorPanel
  @SIZE_Y: 200

  constructor:(@parentElement, @itemObject)->
    @divObject = $('<div>').addClass('item_editor_panel').appendTo(@parentElement)

    @draw()
    
  draw:->
    @divObject.find('*').remove()

    # アイテム名
    $('<div>').html(@itemObject.getName()).addClass('item_editor_header').appendTo(@divObject)

    for level in [@itemObject.getMinLevel()..@itemObject.getMaxLevel()]
      div = $('<div>').addClass('item_editor_item').css({left: level*(60+40)}).appendTo(@divObject)

      $('<div>').addClass('item_editor_item_header').html('★'+(level+1)).appendTo(div)
      $('<div>').addClass('item_editor_item_count').html(@itemObject.getAmount(level)).appendTo(div)
      $('<div>').addClass('item_editor_item_cost').append(
        $('<div>').addClass('item_editor_item_cost_number').html(@itemObject.getCost(level))
      ).append(
        $('<div>').addClass('item_editor_item_cost_header').html('コスト')
      ).appendTo(div)
      if level + 1 <= @itemObject.getMaxLevel()
        $('<button>').addClass('item_editor_item_levelup').html('▶').css({
          left: (60+40)*level+60
        }).appendTo(@divObject)

  show:(y)->
    @divObject.css('top', ''+y+'px').removeClass('no_display')

  hide:->
    @divObject.addClass('no_display')


  onClickItem:(level)->

  onClickLevelup:(fromLevel)->

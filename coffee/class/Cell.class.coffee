class CellBase
  @images = 
    base:[]
    object:[]
    attackeable:[]
  @elements =
    base:null
    object:null
    attackable:null

  constructor:->
    @initElements()

  initElements:->
    @elements.base       = $('<img>').addClass('cell cell_base')
    @elements.object     = $('<img>').addClass('cell cell_object')
    @elements.attackable = $('<img>').addClass('cell cell_attackeble')


  # ベース画像の変更
  changeBase:(imageIndex)->
    @elements.base.attr('src', @images[imageIndex])


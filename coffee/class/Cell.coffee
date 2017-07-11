class Cell
  TYPE_ID :
    NONE : 0
    CHARACTER : 1
    ENEMY : 2

  @imageIndex = 0
  @images = []
  @elements =
    base:null

  constructor:(@typeId, @id)->
    initElements()
    switch @typeId
      when @TYPE_ID.NONE
        @initNone()
      when @TYPE_ID.CHARACTER
        @initCharacter()
      when @TYPE_ID.ENEMY
        @initEnemy()

  initNone:->
    @images = Const.CELL.IMAGE.NONE[Utl.rand(0, Const.CELL.IMAGE.NONE.length-1)]
  initCharacter:->
  initEnemy:->

  initElements:->
    @elements.base = $('<img>')

  # ベース画像の変更
  changeBase:(path)->
    @elements.base.attr('src', path)

  # ベース画像をインクリメント
  plusBase:->
    @imageIndex++
    @imageIndex = 0 if @imageIndex <= @imageIndex
    @changeBase @images[@imageIndex]
    
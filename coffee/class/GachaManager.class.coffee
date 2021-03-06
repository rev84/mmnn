class GachaManager
  @ID: 'gacha'
  @PRICE = 250
  @ITEM_TABLE = 7
  @CHARACTER_PROBABILITY = 1

  @init:(@gameElement)->
    @divObject = $('<div>').attr('id', @ID)

    $('<img>').addClass('gacha_image').attr('src', './img/gacha.png')
    .appendTo(@divObject)

    @button = $('<button>').addClass('btn btn-lg btn-primary gacha_button')
    .html('スタージュエル250個で引く')
    .on('click', @onGain.bind(@))
    .appendTo(@divObject)

    @divObject.appendTo @gameElement

  @refreshButton:->
    @button.prop('disabled', !(250 <= EnvManager.getJewel()))

  @onGain:->
    # ジュエルが足りない
    return if EnvManager.decreaseJewel(@PRICE) is false

    seed = Math.random()

    characterObj = CharacterBase.getUnjoinedCharacter()
    # アイドルが出る
    if seed < @CHARACTER_PROBABILITY and characterObj isnt false
      await ItemWindow.showCharacter characterObj
      characterObj.setJoined true
    # アイテムが出る
    else
      res = ItemManager.getItemObjectFromItemTableId @ITEM_TABLE
      # 最低レベルのアイテムを与える
      res.increaseAmount 0
      await ItemWindow.showItem res

    # セーブ
    SaveManager.save()

    # ボタンの更新
    @refreshButton()

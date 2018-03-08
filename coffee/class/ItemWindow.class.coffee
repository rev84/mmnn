class ItemWindow
  @CLOSED = true

  @init:(savedata)->
    @divObject = $('#item_window').on('hidden.bs.modal', @onClose.bind(@))
    @imgElement = $('#item_window_img')
    @nameElement = $('#item_window_name')
    @descriptionElement = $('#item_window_description')

  @showItem:(itemObject, isWaitClose = true)->
    if isWaitClose
      @CLOSED = false

    @imgElement.attr('src', itemObject.getImage())
    @nameElement.html itemObject.getName()
    @descriptionElement.html itemObject.getDescription()

    @divObject.modal('show')

    if isWaitClose
      await Utl.sleep(1000) while !@CLOSED

  @showJuwel:(juwelAmount, isWaitClose = true)->
    if isWaitClose
      @CLOSED = false

    @imgElement.attr('src', './img/juwel.png')
    @nameElement.html ''+juwelAmount+'ジュエル'
    @descriptionElement.html 'ジュエルです'

    @divObject.modal('show')

    if isWaitClose
      await Utl.sleep(1000) while !@CLOSED


  @onClose:->
    @CLOSED = true
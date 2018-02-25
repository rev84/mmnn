class LevelupController
  @CLASSNAME : 'levelup_controller'

  @SIZE_X : 200
  @SIZE_Y : 120

  @POS_X : Panel.SIZE_X
  @POS_Y : 0

  constructor:(@parentLevelupPanel, @parentElement)->
    @divObject = $('<div>').addClass(@constructor.CLASSNAME).css({
      width: @constructor.SIZE_X
      height: @constructor.SIZE_Y
      top : @constructor.POS_Y
      left : @constructor.POS_X
      'background-color': '#ffffff'
    }).appendTo(@parentElement)
    
    @input =  $('<input>').attr({
                type: 'range'
                min: 1
                max: @parentLevelupPanel.object.getLevelUpMax(ExpManager.get())
                step: 1
              })
              .on('change', @onChange.bind(@))
              .appendTo(@divObject)

    @num   = $('<span>')
             .appendTo(@divObject)

  onChange:->
    levelup = Number @input.val()
    @num.html(levelup)

    @parentLevelupPanel.setLevel levelup
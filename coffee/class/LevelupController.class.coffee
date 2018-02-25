class LevelupController
  @CLASSNAME : 'levelup_controller'

  @SIZE_X : 200
  @SIZE_Y : 120

  @POS_X : Panel.SIZE_X
  @POS_Y : 0

  constructor:(@parentLevelupPanel)->
    @divObject = $('<div>').addClass(@constructor.CLASSNAME).css({
      width: @constructor.SIZE_X
      height: @constructor.SIZE_Y
      top : @constructor.POS_Y
      left : @constructor.POS_X
      'background-color': '#ffffff'
    })

    @input =  $('<input>').attr({
                type: 'range'
                min: 1
                max: @parentLevelupPanel.object.getLevelUpMax(ExpManager.get())
                step: 1
              }).addClass('levelup_range').css({width:''+(@constructor.SIZE_X-20)+'px'})
              .on('mousemove', @onChange.bind(@))
              .val(1)
              .appendTo(@divObject)

    @expLabel = $('<div>').addClass('levelup_exp_label')
                  .html('EXP')
                  .appendTo(@divObject)

    @expNum   = $('<div>').addClass('levelup_exp')
                .appendTo(@divObject)

    @levelButton = $('<button>').addClass('levelup_level_button')
                   .css({width:200})
                   .appendTo(@divObject)

    @onChange()
    @divObject.appendTo(@parentLevelupPanel.divObject)

  onChange:->
    levelup = Number @input.val()
    @levelButton.html(levelup+'レベルUP')
    @expNum.html(@parentLevelupPanel.object.getNeededExp(levelup))

    @parentLevelupPanel.setLevel levelup
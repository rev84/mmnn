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
                   .on('click', @onLevelup.bind(@))
                   .appendTo(@divObject)

    @onChange()
    @divObject.appendTo(@parentLevelupPanel.divObject)

  onChange:->
    levelup = Number @input.val()
    neededExp = @parentLevelupPanel.object.getNeededExp(levelup)
    @levelButton.html(levelup+'レベルUP')
    @expNum.html(neededExp)
    @levelButton.prop 'disabled', true if ExpManager.get() < neededExp

    @parentLevelupPanel.setLevel levelup

  onLevelup:->
    GameManager.changeControllable false

    levelup = Number @input.val()
    neededExp = @parentLevelupPanel.object.getNeededExp(levelup)
    # なんでか経験値足りてない
    return if ExpManager.decreaseExp(neededExp) is false
    # レベルを上げる
    @parentLevelupPanel.object.levelup levelup
    # 再描画
    LevelupManager.draw()
    CharacterPalletManager.draw()
    # 動かせるようにする
    GameManager.changeControllable true

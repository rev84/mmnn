// Generated by CoffeeScript 2.2.3
var LevelupController;

LevelupController = (function() {
  class LevelupController {
    constructor(parentLevelupPanel) {
      this.parentLevelupPanel = parentLevelupPanel;
      this.divObject = $('<div>').addClass(this.constructor.CLASSNAME).css({
        width: this.constructor.SIZE_X,
        height: this.constructor.SIZE_Y,
        top: this.constructor.POS_Y,
        left: this.constructor.POS_X,
        'background-color': '#ffffff'
      });
      this.input = $('<input>').attr({
        type: 'range',
        min: 1,
        max: this.parentLevelupPanel.object.getLevelUpMax(EnvManager.getExp()),
        step: 1
      }).addClass('levelup_range').css({
        width: '' + (this.constructor.SIZE_X - 20) + 'px'
      }).on('mousemove', this.onChange.bind(this)).val(1).appendTo(this.divObject);
      this.expLabel = $('<div>').addClass('levelup_exp_label').html('EXP').appendTo(this.divObject);
      this.expNum = $('<div>').addClass('levelup_exp').appendTo(this.divObject);
      this.levelButton = $('<button>').addClass('levelup_level_button').css({
        width: 200
      }).on('click', this.onLevelup.bind(this)).appendTo(this.divObject);
      this.onChange();
      this.divObject.appendTo(this.parentLevelupPanel.divObject);
    }

    onChange() {
      var levelup, neededExp;
      levelup = Number(this.input.val());
      neededExp = this.parentLevelupPanel.object.getNeededExp(levelup);
      this.levelButton.html(levelup + 'レベルUP');
      this.expNum.html(neededExp);
      // 経験値が足りないか、出撃中ならレベル上げれない
      if (EnvManager.getExp() < neededExp || this.parentLevelupPanel.object.isInField()) {
        this.levelButton.prop('disabled', true);
      } else {
        this.levelButton.prop('disabled', false);
      }
      return this.parentLevelupPanel.setLevel(levelup);
    }

    onLevelup() {
      var levelup, neededExp;
      GameManager.changeControllable(false);
      levelup = Number(this.input.val());
      neededExp = this.parentLevelupPanel.object.getNeededExp(levelup);
      // なんでか経験値足りてない
      if (EnvManager.decreaseExp(neededExp) === false) {
        return;
      }
      // レベルを上げる
      this.parentLevelupPanel.object.levelup(levelup);
      // 音
      SoundManager.play('levelup');
      // 再描画
      LevelupManager.draw();
      CharacterPalletManager.draw();
      // 動かせるようにする
      return GameManager.changeControllable(true);
    }

  };

  LevelupController.CLASSNAME = 'levelup_controller';

  LevelupController.SIZE_X = 200;

  LevelupController.SIZE_Y = 120;

  LevelupController.POS_X = 400;

  LevelupController.POS_Y = 0;

  return LevelupController;

}).call(this);

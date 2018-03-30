// Generated by CoffeeScript 2.2.3
var InfoManager;

InfoManager = class InfoManager {
  static init(parentElement) {
    this.parentElement = parentElement;
    this.divObject = $('<div>').attr('id', this.ID).css({
      width: Panel.SIZE_X,
      height: Panel.SIZE_Y
    }).appendTo(this.parentElement);
    return this.panel = new Panel(this.divObject, null, null, null, false, false, true);
  }

  static setObject(object = null) {
    // 切り替わった時は音を出す
    if (object !== null && (this.panel.object === null || this.panel.object.getObjectType() !== object.getObjectType() || this.panel.object.getId() !== object.getId())) {
      SoundManager.play('cell_hover');
    }
    this.panel.object = object;
    return this.panel.draw();
  }

  static show() {
    return this.divObject.addClass('no_display');
  }

  static hide() {
    return this.divObject.addClass('no_display');
  }

};

// Generated by CoffeeScript 2.2.2
var LevelupManager;

LevelupManager = (function() {
  class LevelupManager {
    static init(parentElement) {
      var cObj, k, ref, results;
      this.parentElement = parentElement;
      this.spaceObject = $('<div>').attr('id', this.ID).css({
        width: this.SIZE_X,
        height: this.SIZE_Y
      }).appendTo(this.parentElement);
      this.divObject = $('<div>').addClass('levelup_main').appendTo(this.spaceObject);
      $('<div>').addClass('levelup_back').appendTo(this.spaceObject);
      this.characters = [];
      ref = GameManager.characters;
      results = [];
      for (k in ref) {
        cObj = ref[k];
        results.push(this.characters.push(cObj));
      }
      return results;
    }

    static draw() {
      var c, i, index, len, ref, results, top, y;
      this.characters.sort(function(a, b) {
        return Number(a.getId()) - Number(b.getId());
      });
      this.panels = [];
      $('#' + this.ID + ' > .' + LevelupPanel.CLASSNAME).remove();
      y = 0;
      ref = this.characters;
      results = [];
      for (index = i = 0, len = ref.length; i < len; index = ++i) {
        c = ref[index];
        if (!c.isJoined()) {
          continue;
        }
        top = y * LevelupPanel.SIZE_Y;
        this.panels.push(new LevelupPanel(this.divObject, c, top));
        results.push(y++);
      }
      return results;
    }

    static show() {
      return this.divObject.addClass('no_display');
    }

    static hide() {
      return this.divObject.addClass('no_display');
    }

  };

  LevelupManager.ID = 'levelup';

  LevelupManager.SIZE_X = 1320;

  LevelupManager.SIZE_Y = 585;

  return LevelupManager;

}).call(this);

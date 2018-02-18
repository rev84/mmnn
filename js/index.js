// Generated by CoffeeScript 1.12.7
var Cell, CharacterBase, CharacterPalletManager, FieldManager, GameManager, Matsuiyamate, MatsuiyamateBase, ObjectBase, Panel, Revot, RevotBase, Syamugame, SyamugameBase, Utl,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

ObjectBase = (function() {
  ObjectBase.OBJECT_TYPE = {
    CHARACTER: 'CHARACTER',
    ENEMY: 'ENEMY'
  };

  function ObjectBase(objectType) {
    this.objectType = objectType;
  }

  ObjectBase.prototype.getHpMax = function() {
    return this.constructor.hpBase * this.level;
  };

  ObjectBase.prototype.getHp = function() {
    if (this.hp === null || this.getHpMax() < this.hp) {
      return this.getHpMax();
    } else if (this.hp <= 0) {
      return 0;
    } else {
      return this.hp;
    }
  };

  ObjectBase.prototype.getLevel = function() {
    return this.level;
  };

  ObjectBase.prototype.getCharacterName = function() {
    return this.constructor.characterName;
  };

  ObjectBase.prototype.getAttackType = function() {
    return this.constructor.attackTypeBase;
  };

  ObjectBase.prototype.getAttack = function() {
    return this.constructor.attackBase * this.level;
  };

  ObjectBase.prototype.getAttackBase = function() {
    return this.constructor.attackBase;
  };

  ObjectBase.prototype.getPDef = function() {
    return this.constructor.pDefBase * this.level;
  };

  ObjectBase.prototype.getPDefBase = function() {
    return this.constructor.pDefBase;
  };

  ObjectBase.prototype.getMDef = function() {
    return this.constructor.mDefBase * this.level;
  };

  ObjectBase.prototype.getMDefBase = function() {
    return this.constructor.mDefBase;
  };

  ObjectBase.prototype.getMove = function() {
    return this.constructor.moveBase;
  };

  ObjectBase.prototype.getMoveBase = function() {
    return this.constructor.moveBase;
  };

  ObjectBase.prototype.getRange = function() {
    return this.constructor.rangeBase;
  };

  ObjectBase.prototype.getRangeBase = function() {
    return this.constructor.rangeBase;
  };

  ObjectBase.prototype.getHitRate = function() {
    return this.constructor.hitRateBase;
  };

  ObjectBase.prototype.getHitRateBase = function() {
    return this.constructor.hitRateBase;
  };

  ObjectBase.prototype.getDodgeRate = function() {
    return this.constructor.dodgeRateBase;
  };

  ObjectBase.prototype.getDodgeRateBase = function() {
    return this.constructor.dodgeRateBase;
  };

  ObjectBase.prototype.getAbilityName = function() {
    return this.constructor.abilityName;
  };

  ObjectBase.prototype.getAbilityDesc = function() {
    return this.constructor.abilityDesc;
  };

  ObjectBase.prototype.getBaseImage = function() {
    return this.constructor.images[0];
  };

  return ObjectBase;

})();

CharacterBase = (function(superClass) {
  extend(CharacterBase, superClass);

  function CharacterBase(params) {
    CharacterBase.__super__.constructor.call(this, ObjectBase.OBJECT_TYPE.CHARACTER);
    if (params.joined === null) {
      this.joined = this.constructor.defaultJoin;
    } else {
      this.joined = params.joined;
    }
    this.level = params.level;
    this.hp = params.hp;
    this.items = params.items;
  }

  return CharacterBase;

})(ObjectBase);

Cell = (function() {
  Cell.SIZE_X = 100;

  Cell.SIZE_Y = 100;

  function Cell(parentElement, xIndex, yIndex, borderSize) {
    this.parentElement = parentElement;
    this.xIndex = xIndex;
    this.yIndex = yIndex;
    this.elements = {
      mother: null,
      collision: null,
      base: null,
      object: null,
      attackable: null
    };
    this.initElements(borderSize);
  }

  Cell.prototype.initElements = function(borderSize) {
    var cssPos, cssSize;
    this.elements.mother = $('<div>').addClass('cell cell_mother').css({
      left: this.xIndex * this.constructor.SIZE_X + borderSize * (this.xIndex + 1),
      top: this.yIndex * this.constructor.SIZE_Y + borderSize * (this.yIndex + 1),
      width: this.constructor.SIZE_X,
      height: this.constructor.SIZE_Y
    });
    cssPos = {
      left: 0,
      top: 0
    };
    cssSize = {
      width: this.constructor.SIZE_X,
      height: this.constructor.SIZE_Y
    };
    this.elements.collision = $('<div>').addClass('cell cell_collision').appendTo(this.elements.mother).css(cssPos).css(cssSize);
    this.elements.base = $('<img>').addClass('cell cell_base').appendTo(this.elements.mother).css(cssPos).css(cssSize);
    this.elements.object = $('<img>').addClass('cell cell_object').appendTo(this.elements.mother).css(cssPos).css(cssSize);
    this.elements.attackable = $('<img>').addClass('cell cell_attackable').appendTo(this.elements.mother).css(cssPos);
    return $(this.elements.mother).appendTo(this.parentElement);
  };

  Cell.prototype.changeBase = function(imagePath) {
    return this.elements.base.attr('src', imagePath);
  };

  return Cell;

})();

MatsuiyamateBase = (function(superClass) {
  extend(MatsuiyamateBase, superClass);

  MatsuiyamateBase.characterId = 1;

  MatsuiyamateBase.characterName = "松井山手";

  MatsuiyamateBase.defaultJoin = true;

  MatsuiyamateBase.images = ["./img/character/1/1.jpg"];

  MatsuiyamateBase.attackTypeBase = "物理";

  MatsuiyamateBase.attackBase = 1;

  MatsuiyamateBase.hpBase = 1;

  MatsuiyamateBase.pDefBase = 1;

  MatsuiyamateBase.mDefBase = 1;

  MatsuiyamateBase.moveBase = 1;

  MatsuiyamateBase.rangeBase = 1;

  MatsuiyamateBase.hitRateBase = 1;

  MatsuiyamateBase.dodgeRateBase = 1;

  MatsuiyamateBase.itemMax = 1;

  MatsuiyamateBase.abilityName = "松井山手の能力";

  MatsuiyamateBase.abilityDesc = "松井山手の説明";

  function MatsuiyamateBase(params) {
    MatsuiyamateBase.__super__.constructor.call(this, params);
  }

  return MatsuiyamateBase;

})(CharacterBase);

SyamugameBase = (function(superClass) {
  extend(SyamugameBase, superClass);

  SyamugameBase.characterId = 2;

  SyamugameBase.characterName = "syamu_game";

  SyamugameBase.defaultJoin = true;

  SyamugameBase.images = ["./img/character/2/1.jpg"];

  SyamugameBase.attackTypeBase = "魔法";

  SyamugameBase.attackBase = 2;

  SyamugameBase.hpBase = 2;

  SyamugameBase.pDefBase = 2;

  SyamugameBase.mDefBase = 2;

  SyamugameBase.moveBase = 2;

  SyamugameBase.rangeBase = 2;

  SyamugameBase.hitRateBase = 2;

  SyamugameBase.dodgeRateBase = 2;

  SyamugameBase.itemMax = 2;

  SyamugameBase.abilityName = "しゃむさんの能力";

  SyamugameBase.abilityDesc = "しゃむさんのせつめい";

  function SyamugameBase(params) {
    SyamugameBase.__super__.constructor.call(this, params);
  }

  return SyamugameBase;

})(CharacterBase);

RevotBase = (function(superClass) {
  extend(RevotBase, superClass);

  RevotBase.characterId = 3;

  RevotBase.characterName = "Revot";

  RevotBase.defaultJoin = true;

  RevotBase.images = ["./img/character/3/1.png"];

  RevotBase.attackTypeBase = "物理";

  RevotBase.attackBase = 3;

  RevotBase.hpBase = 3;

  RevotBase.pDefBase = 3;

  RevotBase.mDefBase = 3;

  RevotBase.moveBase = 3;

  RevotBase.rangeBase = 3;

  RevotBase.hitRateBase = 3;

  RevotBase.dodgeRateBase = 3;

  RevotBase.itemMax = 3;

  RevotBase.abilityName = "れぼっとの能力";

  RevotBase.abilityDesc = "れぼっとのせつめい";

  function RevotBase(params) {
    RevotBase.__super__.constructor.call(this, params);
  }

  return RevotBase;

})(CharacterBase);

window.CharacterList = {
  "1": "Matsuiyamate",
  "2": "Syamugame",
  "3": "Revot"
};

Matsuiyamate = (function(superClass) {
  extend(Matsuiyamate, superClass);

  function Matsuiyamate(params) {
    Matsuiyamate.__super__.constructor.call(this, params);
  }

  return Matsuiyamate;

})(MatsuiyamateBase);

Revot = (function(superClass) {
  extend(Revot, superClass);

  function Revot(params) {
    Revot.__super__.constructor.call(this, params);
  }

  return Revot;

})(RevotBase);

Syamugame = (function(superClass) {
  extend(Syamugame, superClass);

  function Syamugame(params) {
    Syamugame.__super__.constructor.call(this, params);
  }

  return Syamugame;

})(SyamugameBase);

CharacterPalletManager = (function() {
  function CharacterPalletManager() {}

  CharacterPalletManager.ID = 'character_pallet';

  CharacterPalletManager.SIZE_X = 400;

  CharacterPalletManager.SIZE_Y = 800;

  CharacterPalletManager.characters = [];

  CharacterPalletManager.panels = [];

  CharacterPalletManager.init = function(parentElement, posX, posY) {
    this.parentElement = parentElement;
    this.posX = posX;
    this.posY = posY;
    return this.divObject = $('<div>').attr('id', this.ID).addClass('no_display').css({
      width: this.SIZE_X,
      height: this.SIZE_Y,
      left: this.posX,
      top: this.posY
    }).appendTo(this.parentElement);
  };

  CharacterPalletManager.show = function() {
    return $(this.divObject).removeClass('no_display');
  };

  CharacterPalletManager.hide = function() {
    return $(this.divObject).addClass('no_display');
  };

  CharacterPalletManager.addCharacter = function(characterObject) {
    this.characters.push(characterObject);
    return this.draw();
  };

  CharacterPalletManager.draw = function() {
    var c, index, j, len, ref, results, top;
    this.characters.sort(function(a, b) {
      return Number(a.constructor.characterId) - Number(b.constructor.characterId);
    });
    this.panels = [];
    $('#' + this.ID + ' > .' + Panel.CLASSNAME).remove();
    ref = this.characters;
    results = [];
    for (index = j = 0, len = ref.length; j < len; index = ++j) {
      c = ref[index];
      top = index * Panel.SIZE_Y;
      results.push(this.panels.push(new Panel(this.divObject, c, top)));
    }
    return results;
  };

  return CharacterPalletManager;

})();

FieldManager = (function() {
  function FieldManager() {}

  FieldManager.ID = 'field';

  FieldManager.CELL_X = 10;

  FieldManager.CELL_Y = 6;

  FieldManager.BORDER_SIZE = 1;

  FieldManager.divObject = null;

  FieldManager.cells = [];

  FieldManager.nextField = [];

  FieldManager.init = function(parentElement, posX, posY) {
    var j, l, o, ref, ref1, ref2, results, x, y;
    this.parentElement = parentElement;
    this.posX = posX;
    this.posY = posY;
    this.divObject = $('<div>').attr('id', this.ID).css({
      top: this.posY,
      left: this.posX,
      width: this.CELL_X * Cell.SIZE_X + this.BORDER_SIZE * (this.CELL_X + 1),
      height: this.CELL_Y * Cell.SIZE_Y + this.BORDER_SIZE * (this.CELL_Y + 1),
      "background-color": '#000000'
    }).appendTo(this.parentElement);
    this.cells = [];
    for (x = j = 0, ref = this.CELL_X; 0 <= ref ? j < ref : j > ref; x = 0 <= ref ? ++j : --j) {
      this.cells[x] = [];
      for (y = l = 0, ref1 = this.CELL_Y; 0 <= ref1 ? l < ref1 : l > ref1; y = 0 <= ref1 ? ++l : --l) {
        this.cells[x][y] = new Cell(this.divObject, x, y, this.BORDER_SIZE);
      }
    }
    this.nextField = [];
    results = [];
    for (y = o = 0, ref2 = this.CELL_Y; 0 <= ref2 ? o < ref2 : o > ref2; y = 0 <= ref2 ? ++o : --o) {
      results.push(this.nextField[y] = null);
    }
    return results;
  };

  FieldManager.generateNextField = function() {};

  FieldManager.show = function() {
    return $(this.divObject).removeClass('no_display');
  };

  FieldManager.hide = function() {
    return $(this.divObject).addClass('no_display');
  };

  return FieldManager;

})();

GameManager = (function() {
  function GameManager() {}

  GameManager.ID = 'game';

  GameManager.gameElement = null;

  GameManager.characters = [];

  GameManager.initialized = {
    characters: false,
    field: false
  };

  GameManager.init = function() {
    this.gameElement = $('<div>').attr('id', this.ID);
    this.initCharacters(null);
    this.initField(null);
    return this.gameElement.appendTo('body');
  };

  GameManager.initField = function(savedata) {
    if (this.initialized.field) {
      return;
    }
    this.initialized.field = true;
    return FieldManager.init(this.gameElement, 400, 0);
  };

  GameManager.initCharacters = function(savedata) {
    var characterId, characterObject, className, params, ref, ref1;
    if (this.initialized.characters) {
      return;
    }
    this.initialized.characters = true;
    CharacterPalletManager.init(this.gameElement, 0, 0);
    this.characters = {};
    ref = window.CharacterList;
    for (characterId in ref) {
      className = ref[characterId];
      if ((savedata != null) && 'characters' in savedata && characterId in savedata.characters) {
        params = savedata.characters[characterId];
      } else {
        params = {
          joined: null,
          level: 1,
          hp: null,
          items: []
        };
      }
      this.characters[characterId] = new window[className](params);
    }
    ref1 = this.characters;
    for (characterId in ref1) {
      characterObject = ref1[characterId];
      CharacterPalletManager.addCharacter(characterObject);
    }
    return CharacterPalletManager.show();
  };

  return GameManager;

})();

Panel = (function() {
  Panel.SIZE_X = 400;

  Panel.SIZE_Y = 120;

  Panel.CLASSNAME = 'panel';

  function Panel(parentElement, object1, posY, posX) {
    this.parentElement = parentElement;
    this.object = object1;
    this.posY = posY != null ? posY : 0;
    this.posX = posX != null ? posX : 0;
    this.divObject = $('<div>').addClass(this.constructor.CLASSNAME).css({
      width: this.constructor.SIZE_X,
      height: this.constructor.SIZE_Y,
      top: this.posY,
      left: this.posX,
      border: 'double 5px #000000'
    }).appendTo(this.parentElement);
    this.draw();
  }

  Panel.prototype.draw = function() {
    switch (this.object.objectType) {
      case ObjectBase.OBJECT_TYPE.CHARACTER:
        return this.drawCharacter();
    }
  };

  Panel.prototype.drawCharacter = function() {
    var attackImg;
    $(this.divObject).append($('<img>').addClass('field_icon').attr('src', this.object.getBaseImage()).css({
      top: 20,
      left: 0,
      width: 90,
      height: 90
    }));
    $(this.divObject).append($('<div>').addClass('label_level').css({
      top: 0,
      left: 0,
      width: 20,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('Lv'));
    $(this.divObject).append($('<div>').addClass('field_level').css({
      top: 0,
      left: 20,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html(this.object.getLevel()));
    $(this.divObject).append($('<div>').addClass('field_name').css({
      top: 0,
      left: 90,
      width: 120,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html(this.object.getCharacterName()));
    $(this.divObject).append($('<div>').addClass('label_attack').css({
      top: 25,
      left: 90,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('攻撃'));
    attackImg = this.object.getAttackType() === '物理' ? './img/sword.png' : './img/magic.png';
    $(this.divObject).append($('<img>').addClass('field_attack_type').css({
      top: 25,
      left: 130,
      width: 20,
      height: 20
    }).attr('src', attackImg));
    $(this.divObject).append($('<div>').addClass('field_attack').css({
      top: 25,
      left: 160,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getAttack()));
    $(this.divObject).append($('<div>').addClass('label_pdef').css({
      top: 45,
      left: 90,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('物防'));
    $(this.divObject).append($('<div>').addClass('field_pdef').css({
      top: 45,
      left: 160,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getPDef()));
    $(this.divObject).append($('<div>').addClass('label_mdef').css({
      top: 65,
      left: 90,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('魔防'));
    $(this.divObject).append($('<div>').addClass('field_mdef').css({
      top: 65,
      left: 160,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getMDef()));
    $(this.divObject).append($('<div>').addClass('label_hp').css({
      top: 0,
      left: 180,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('HP'));
    $(this.divObject).append($('<div>').addClass('field_hp').css({
      top: 0,
      left: 220,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getHp()));
    $(this.divObject).append($('<div>').addClass('label_hp_split').css({
      top: 0,
      left: 280,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html('/'));
    $(this.divObject).append($('<div>').addClass('field_hp_max').css({
      top: 0,
      left: 300,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getHpMax()));
    $(this.divObject).append($('<div>').addClass('label_hit_rate').css({
      top: 25,
      left: 210,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('命中'));
    $(this.divObject).append($('<div>').addClass('field_hit_rate').css({
      top: 25,
      left: 260,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getHitRate()));
    $(this.divObject).append($('<div>').addClass('label_dodge_rate').css({
      top: 45,
      left: 210,
      width: 90,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('回避'));
    $(this.divObject).append($('<div>').addClass('field_dodge_rate').css({
      top: 45,
      left: 260,
      width: 20,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getDodgeRate()));
    $(this.divObject).append($('<div>').addClass('label_move').css({
      top: 25,
      left: 310,
      width: 50,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('移動'));
    $(this.divObject).append($('<div>').addClass('field_move').css({
      top: 25,
      left: 360,
      width: 50,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getMove()));
    $(this.divObject).append($('<div>').addClass('label_range').css({
      top: 45,
      left: 310,
      width: 50,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('射程'));
    $(this.divObject).append($('<div>').addClass('field_range').css({
      top: 45,
      left: 360,
      width: 50,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getMove()));
    $(this.divObject).append($('<div>').addClass('label_ability').css({
      top: 85,
      left: 90,
      width: 50,
      height: 20,
      "font-size": "16px",
      "background-color": '#ffffff'
    }).html('能力'));
    return $(this.divObject).append($('<div>').addClass('field_ability').css({
      top: 85,
      left: 130,
      width: 250,
      height: 20,
      "font-size": "16px"
    }).html(this.object.getAbilityName()).tooltip({
      'placement': 'top',
      'title': this.object.getAbilityDesc()
    }));
  };

  return Panel;

})();

$().ready(function() {
  return GameManager.init();
});

Utl = (function() {
  function Utl() {}

  Utl.numFormat = function(num) {
    return String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  };

  Utl.rand = function(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  };

  Utl.genPassword = function(length) {
    var chars, i, j, ref, res;
    if (length == null) {
      length = 4;
    }
    chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    res = '';
    for (i = j = 0, ref = length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      res += chars.substr(this.rand(0, chars.length - 1), 1);
    }
    return res;
  };

  Utl.adrBar = function(url) {
    return window.history.replaceState('', '', '' + url);
  };

  Utl.getQuery = function(key, defaultValue) {
    var j, k, len, p, params, query, ref, res, v;
    if (key == null) {
      key = null;
    }
    if (defaultValue == null) {
      defaultValue = null;
    }
    query = document.location.search.substring(1);
    params = query.split('&');
    res = {};
    for (j = 0, len = params.length; j < len; j++) {
      p = params[j];
      ref = p.split('='), k = ref[0], v = ref[1];
      res[k] = v;
    }
    if (key === null) {
      return res;
    }
    if (res[key] != null) {
      return res[key];
    }
    return defaultValue;
  };

  Utl.normalize = function(num, min, max) {
    var range;
    if (min == null) {
      min = 0;
    }
    if (max == null) {
      max = 1;
    }
    range = Math.abs(max - min);
    if (num < min) {
      num += range * Math.ceil(Math.abs(num - min) / range);
    } else if (max <= num) {
      num -= range * (Math.floor(Math.abs(num - max) / range) + 1);
    }
    return num;
  };

  Utl.time = function(date) {
    if (date == null) {
      date = null;
    }
    if (date === null) {
      date = new Date();
    }
    return Math.floor(+date / 1000);
  };

  Utl.militime = function(date, getAsFloat) {
    if (date == null) {
      date = null;
    }
    if (getAsFloat == null) {
      getAsFloat = false;
    }
    if (date === null) {
      date = new Date();
    }
    return +date / (getAsFloat ? 1000 : 1);
  };

  Utl.dateStr = function(date, dateSep) {
    if (date == null) {
      date = null;
    }
    if (dateSep == null) {
      dateSep = '-';
    }
    if (date === null) {
      date = new Date();
    }
    return '' + this.zerofill(date.getFullYear(), 4) + dateSep + this.zerofill(date.getMonth() + 1, 2) + dateSep + this.zerofill(date.getDate(), 2);
  };

  Utl.datetimeStr = function(date, dateSep, timeSep, betweenSep) {
    if (date == null) {
      date = null;
    }
    if (dateSep == null) {
      dateSep = '-';
    }
    if (timeSep == null) {
      timeSep = ':';
    }
    if (betweenSep == null) {
      betweenSep = ' ';
    }
    if (date === null) {
      date = new Date();
    }
    return this.dateStr(date, dateSep) + betweenSep + this.zerofill(date.getHours(), 2) + timeSep + this.zerofill(date.getMinutes(), 2) + timeSep + this.zerofill(date.getSeconds(), 2);
  };

  Utl.difftime = function(targetDate, baseDate, nowSec, nowStr, agoStr, secStr, minStr, hourStr, dayStr, monStr, yearStr) {
    var baseTime, d, diffTime, h, m, mo, targetTime, y;
    if (baseDate == null) {
      baseDate = null;
    }
    if (nowSec == null) {
      nowSec = 0;
    }
    if (nowStr == null) {
      nowStr = 'ついさっき';
    }
    if (agoStr == null) {
      agoStr = '前';
    }
    if (secStr == null) {
      secStr = '秒';
    }
    if (minStr == null) {
      minStr = '分';
    }
    if (hourStr == null) {
      hourStr = '時間';
    }
    if (dayStr == null) {
      dayStr = '日';
    }
    if (monStr == null) {
      monStr = '月';
    }
    if (yearStr == null) {
      yearStr = '年';
    }
    if (baseDate === null) {
      baseTime = this.time();
    }
    targetTime = this.time(targetDate);
    diffTime = baseTime - targetTime;
    if (diffTime < 0) {
      return null;
    }
    if (nowSec >= diffTime) {
      return nowStr;
    }
    y = Math.floor(diffTime / (60 * 60 * 24 * 30 * 12));
    if (y > 0) {
      return '' + y + yearStr + agoStr;
    }
    diffTime -= y * (60 * 60 * 24 * 30 * 12);
    mo = Math.floor(diffTime / (60 * 60 * 24 * 30));
    if (mo > 0) {
      return '' + mo + monStr + agoStr;
    }
    diffTime -= mo * (60 * 60 * 24 * 30);
    d = Math.floor(diffTime / (60 * 60 * 24));
    if (d > 0) {
      return '' + d + dayStr + agoStr;
    }
    diffTime -= d * (60 * 60 * 24);
    h = Math.floor(diffTime / (60 * 60));
    if (h > 0) {
      return '' + h + hourStr + agoStr;
    }
    diffTime -= h * (60 * 60);
    m = Math.floor(diffTime / 60);
    if (m > 0) {
      return '' + m + minStr + agoStr;
    }
    diffTime -= m * 60;
    if (diffTime > 0) {
      return '' + diffTime + secStr + agoStr;
    }
    return nowStr;
  };

  Utl.zerofill = function(num, digit) {
    return ('' + this.repeat('0', digit) + num).slice(-digit);
  };

  Utl.repeat = function(str, times) {
    return Array(1 + times).join(str);
  };

  Utl.shuffle = function(ary) {
    var i, n, ref;
    n = ary.length;
    while (n) {
      n--;
      i = this.rand(0, n);
      ref = [ary[n], ary[i]], ary[i] = ref[0], ary[n] = ref[1];
    }
    return ary;
  };

  Utl.inArray = function(needle, ary) {
    var j, len, v;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      if (v === needle) {
        return true;
      }
    }
    return false;
  };

  Utl.clone = function(obj) {
    var res;
    res = obj;
    if ($.isArray(obj)) {
      res = $.extend(true, [], obj);
    } else if (obj instanceof Object) {
      res = $.extend(true, {}, obj);
    }
    return res;
  };

  Utl.arrayFill = function(length, val) {
    var i, j, ref, res;
    if (val == null) {
      val = null;
    }
    res = [];
    for (i = j = 0, ref = length; 0 <= ref ? j < ref : j > ref; i = 0 <= ref ? ++j : --j) {
      res[i] = this.clone(val);
    }
    return res;
  };

  Utl.array2dFill = function(x, y, val) {
    var j, l, ref, ref1, res, xx, yAry, yy;
    if (y == null) {
      y = null;
    }
    if (val == null) {
      val = null;
    }
    if (y === null) {
      y = x;
    }
    res = [];
    yAry = [];
    for (yy = j = 0, ref = y; 0 <= ref ? j < ref : j > ref; yy = 0 <= ref ? ++j : --j) {
      yAry[yy] = this.clone(val);
    }
    for (xx = l = 0, ref1 = x; 0 <= ref1 ? l < ref1 : l > ref1; xx = 0 <= ref1 ? ++l : --l) {
      res[xx] = this.clone(yAry);
    }
    return res;
  };

  Utl.arraySum = function(ary) {
    var j, len, sum, v;
    sum = 0;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      sum += v;
    }
    return sum;
  };

  Utl.arrayMin = function(ary) {
    var j, len, min, v;
    min = null;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      if (min === null || min > v) {
        min = v;
      }
    }
    return min;
  };

  Utl.arrayMax = function(ary) {
    var j, len, max, v;
    max = null;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      if (max === null || max < v) {
        max = v;
      }
    }
    return max;
  };

  Utl.count = function(object) {
    return Object.keys(object).length;
  };

  Utl.uuid4 = function() {
    var i, j, random, uuid;
    uuid = '';
    for (i = j = 0; j < 32; i = ++j) {
      random = Math.random() * 16 | 0;
      if (i === 8 || i === 12 || i === 16 || i === 20) {
        uuid += '-';
      }
      uuid += (i === 12 ? 4 : (i === 16 ? random & 3 | 8 : random)).toString(16);
    }
    return uuid;
  };

  Utl.delLs = function(key) {
    return localStorage.removeItem(key);
  };

  Utl.setLs = function(key, value) {
    var json;
    if (value == null) {
      value = null;
    }
    if (value === null) {
      return this.delLs(key);
    }
    json = JSON.stringify(value);
    return localStorage.setItem(key, json);
  };

  Utl.getLs = function(key) {
    var res;
    res = localStorage.getItem(key);
    try {
      res = JSON.parse(res);
    } catch (error) {
      res = null;
    }
    return res;
  };

  return Utl;

})();

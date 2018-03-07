// Generated by CoffeeScript 2.2.2
var Panel;

Panel = (function() {
  class Panel {
    constructor(parentElement, object, posY = 0, posX = 0, isShowOverlay = true, isCharacterPallet = false) {
      this.parentElement = parentElement;
      this.object = object;
      this.posY = posY;
      this.posX = posX;
      this.isShowOverlay = isShowOverlay;
      this.isCharacterPallet = isCharacterPallet;
      this.divObject = $('<div>').addClass(this.constructor.CLASSNAME).css({
        width: this.constructor.SIZE_X,
        height: this.constructor.SIZE_Y,
        top: this.posY,
        left: this.posX
      }).appendTo(this.parentElement);
      this.draw();
    }

    // アイコンがドラッグ開始された時
    onIconDragStart(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // キャラクター出撃に使っていいパネルではないなら帰る
      if (!this.isCharacterPallet) {
        return;
      }
      // キャラクター出撃モードではないので帰る
      if (!GameManager.isMode.characterPick) {
        return;
      }
      // キャラクターではないので帰る
      if (!this.object.isCharacterObject()) {
        return;
      }
      if (this.object.isInField()) {
        // 既に出撃中なので帰る
        return true;
      }
      CharacterPalletManager.pickCharacter(this.object);
      return true;
    }

    draw(level = null) {
      $(this.divObject).find('*').remove();
      if (this.object !== null) {
        if (this.object.isCharacterObject()) {
          return this.drawCharacter(level);
        } else if (this.object.isEnemyObject()) {
          return this.drawEnemy();
        }
      } else {
        return this.clear();
      }
    }

    drawCharacter(level = null) {
      var attackImg;
      if (this.isShowOverlay) {
        // 出撃中判定
        if (this.object.isInField()) {
          $('<div>').addClass('in_field').css({
            left: 0,
            top: 0,
            "z-index": 9999,
            opacity: 0.5,
            "background-color": '#230381',
            width: this.constructor.SIZE_X,
            height: this.constructor.SIZE_Y,
            'font-size': '80px',
            color: '#000000',
            'text-align': 'center'
          }).html('出撃中').appendTo(this.divObject);
        // 療養中判定
        } else if (this.object.getComebackTurn() > 0) {
          $('<div>').addClass('comeback').css({
            left: 0,
            top: 0,
            "z-index": 9999,
            opacity: 0.5,
            "background-color": '#f3f93e',
            width: this.constructor.SIZE_X,
            height: this.constructor.SIZE_Y,
            'font-size': '80px',
            color: '#000000',
            'text-align': 'center'
          }).html('療養中' + this.object.getComebackTurn() + '').appendTo(this.divObject);
        }
      }
      // アイコン
      $(this.divObject).append($('<div>').addClass('field_icon').css({
        top: 20,
        left: 0,
        width: 90,
        height: 90,
        "background-image": 'url(' + this.object.getBaseImage() + ')'
      }).on('mousedown', (evt) => {
        if (evt.which === 1) {
          this.onIconDragStart.bind(this)(evt);
        }
        return true;
      }));
      // レベルラベル
      $(this.divObject).append($('<div>').addClass('label_level').css({
        top: 0,
        left: 0,
        width: 20,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('Lv'));
      // レベル
      $(this.divObject).append($('<div>').addClass('field_level').css({
        top: 0,
        left: 20,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html(this.object.getLevel(level)));
      // 名前
      $(this.divObject).append($('<div>').addClass('field_name').css({
        top: 0,
        left: 90,
        width: 120,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html(this.object.getCharacterName()));
      // 攻撃力ラベル
      $(this.divObject).append($('<div>').addClass('label_attack').css({
        top: 25,
        left: 90,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('攻撃'));
      // 攻撃タイプ
      attackImg = this.object.getAttackType() === '物理' ? './img/sword.png' : './img/magic.png';
      $(this.divObject).append($('<img>').addClass('field_attack_type').css({
        top: 25,
        left: 130,
        width: 20,
        height: 20
      }).attr('src', attackImg));
      // 攻撃力
      $(this.divObject).append($('<div>').addClass('field_attack').css({
        top: 25,
        left: 160,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getAttack(level)));
      // 物理防御力ラベル
      $(this.divObject).append($('<div>').addClass('label_pdef').css({
        top: 45,
        left: 90,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('物防'));
      // 物理防御力
      $(this.divObject).append($('<div>').addClass('field_pdef').css({
        top: 45,
        left: 160,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getPDef(level)));
      // 魔法防御力ラベル
      $(this.divObject).append($('<div>').addClass('label_mdef').css({
        top: 65,
        left: 90,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('魔防'));
      // 魔法防御力
      $(this.divObject).append($('<div>').addClass('field_mdef').css({
        top: 65,
        left: 160,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getMDef(level)));
      // HPラベル
      $(this.divObject).append($('<div>').addClass('label_hp').css({
        top: 0,
        left: 180,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('HP'));
      // HP
      $(this.divObject).append($('<div>').addClass('field_hp').css({
        top: 0,
        left: 220,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getHp()));
      // HPしきり
      $(this.divObject).append($('<div>').addClass('label_hp_split').css({
        top: 0,
        left: 280,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html('/'));
      // HP最大
      $(this.divObject).append($('<div>').addClass('field_hp_max').css({
        top: 0,
        left: 300,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getHpMax(level)));
      // 命中率ラベル
      $(this.divObject).append($('<div>').addClass('label_hit_rate').css({
        top: 25,
        left: 210,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('命中'));
      // 命中率
      $(this.divObject).append($('<div>').addClass('field_hit_rate').css({
        top: 25,
        left: 260,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getHitRate()));
      // 回避率ラベル
      $(this.divObject).append($('<div>').addClass('label_dodge_rate').css({
        top: 45,
        left: 210,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('回避'));
      // 回避率
      $(this.divObject).append($('<div>').addClass('field_dodge_rate').css({
        top: 45,
        left: 260,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getDodgeRate()));
      // 移動力ラベル
      $(this.divObject).append($('<div>').addClass('label_move').css({
        top: 25,
        left: 310,
        width: 50,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('移動'));
      // 移動力
      $(this.divObject).append($('<div>').addClass('field_move').css({
        top: 25,
        left: 360,
        width: 50,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getMove()));
      // 射程ラベル
      $(this.divObject).append($('<div>').addClass('label_range').css({
        top: 45,
        left: 310,
        width: 50,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('射程'));
      // 射程
      $(this.divObject).append($('<div>').addClass('field_range').css({
        top: 45,
        left: 360,
        width: 50,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getRange()));
      // 能力ラベル
      $(this.divObject).append($('<div>').addClass('label_ability').css({
        top: 85,
        left: 90,
        width: 50,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('能力'));
      // 能力
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
    }

    drawEnemy() {
      var attackImg;
      // アイコン
      $(this.divObject).append($('<div>').addClass('field_icon').css({
        top: 20,
        left: 0,
        width: 90,
        height: 90,
        "background-image": 'url(' + this.object.getBaseImage() + ')'
      }));
      // レベルラベル
      $(this.divObject).append($('<div>').addClass('label_level').css({
        top: 0,
        left: 0,
        width: 20,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('Lv'));
      // レベル
      $(this.divObject).append($('<div>').addClass('field_level').css({
        top: 0,
        left: 20,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html(this.object.getLevel()));
      // 名前
      $(this.divObject).append($('<div>').addClass('field_name').css({
        top: 0,
        left: 90,
        width: 120,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html(this.object.getCharacterName()));
      // 攻撃力ラベル
      $(this.divObject).append($('<div>').addClass('label_attack').css({
        top: 25,
        left: 90,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('攻撃'));
      // 攻撃タイプ
      attackImg = this.object.getAttackType() === '物理' ? './img/sword.png' : './img/magic.png';
      $(this.divObject).append($('<img>').addClass('field_attack_type').css({
        top: 25,
        left: 130,
        width: 20,
        height: 20
      }).attr('src', attackImg));
      // 攻撃力
      $(this.divObject).append($('<div>').addClass('field_attack').css({
        top: 25,
        left: 160,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getAttack()));
      // 物理防御力ラベル
      $(this.divObject).append($('<div>').addClass('label_pdef').css({
        top: 45,
        left: 90,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('物防'));
      // 物理防御力
      $(this.divObject).append($('<div>').addClass('field_pdef').css({
        top: 45,
        left: 160,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getPDef()));
      // 魔法防御力ラベル
      $(this.divObject).append($('<div>').addClass('label_mdef').css({
        top: 65,
        left: 90,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('魔防'));
      // 魔法防御力
      $(this.divObject).append($('<div>').addClass('field_mdef').css({
        top: 65,
        left: 160,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getMDef()));
      // HPラベル
      $(this.divObject).append($('<div>').addClass('label_hp').css({
        top: 0,
        left: 180,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('HP'));
      // HP
      $(this.divObject).append($('<div>').addClass('field_hp').css({
        top: 0,
        left: 220,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getHp()));
      // HPしきり
      $(this.divObject).append($('<div>').addClass('label_hp_split').css({
        top: 0,
        left: 280,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html('/'));
      // HP最大
      $(this.divObject).append($('<div>').addClass('field_hp_max').css({
        top: 0,
        left: 300,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getHpMax()));
      // 命中率ラベル
      $(this.divObject).append($('<div>').addClass('label_hit_rate').css({
        top: 25,
        left: 210,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('命中'));
      // 命中率
      $(this.divObject).append($('<div>').addClass('field_hit_rate').css({
        top: 25,
        left: 260,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getHitRate()));
      // 回避率ラベル
      $(this.divObject).append($('<div>').addClass('label_dodge_rate').css({
        top: 45,
        left: 210,
        width: 90,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('回避'));
      // 回避率
      $(this.divObject).append($('<div>').addClass('field_dodge_rate').css({
        top: 45,
        left: 260,
        width: 20,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getDodgeRate()));
      // 移動力ラベル
      $(this.divObject).append($('<div>').addClass('label_move').css({
        top: 25,
        left: 310,
        width: 50,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('移動'));
      // 移動力
      $(this.divObject).append($('<div>').addClass('field_move').css({
        top: 25,
        left: 360,
        width: 50,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getMove()));
      // 射程ラベル
      $(this.divObject).append($('<div>').addClass('label_range').css({
        top: 45,
        left: 310,
        width: 50,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('射程'));
      // 射程
      $(this.divObject).append($('<div>').addClass('field_range').css({
        top: 45,
        left: 360,
        width: 50,
        height: 20,
        "font-size": "16px"
      }).html(this.object.getRange()));
      // 能力ラベル
      $(this.divObject).append($('<div>').addClass('label_ability').css({
        top: 85,
        left: 90,
        width: 50,
        height: 20,
        "font-size": "16px",
        "background-color": '#ffffff'
      }).html('能力'));
      // 能力
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
    }

    clear() {
      return $(this.divObject).find('*').remove();
    }

    removeMe() {
      $(this.divObject).find('*').remove();
      return $(this.divObject).remove();
    }

  };

  Panel.SIZE_X = 400;

  Panel.SIZE_Y = 120;

  Panel.CLASSNAME = 'panel';

  return Panel;

}).call(this);

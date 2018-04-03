// Generated by CoffeeScript 2.2.4
var MenuManager;

MenuManager = (function() {
  class MenuManager {
    static init(parentElement, posX, posY) {
      this.parentElement = parentElement;
      this.posX = posX;
      this.posY = posY;
      this.divObject = $('<div>').attr('id', this.ID).css({
        width: this.SIZE_X,
        height: this.SIZE_Y,
        left: this.posX,
        top: this.posY
      });
      // 戦闘
      this.battle = $('<button>').addClass('menu live left').on('click', this.onClickBattle.bind(this)).appendTo(this.divObject);
      // 出撃
      this.pickCharacter = $('<button>').addClass('menu performance left').on('click', this.onClickCharacterPick.bind(this)).appendTo(this.divObject);
      // レベルアップ
      this.turnEnd = $('<button>').addClass('menu training left').on('click', this.onClickLevelup.bind(this)).appendTo(this.divObject);
      // アイテム
      this.item = $('<button>').addClass('menu item left').on('click', this.onClickItem.bind(this)).appendTo(this.divObject);
      // ガチャ
      this.gacha = $('<button>').addClass('menu gacha left').on('click', this.onClickGacha.bind(this)).appendTo(this.divObject);
      // 遊び方
      this.help = $('<button>').addClass('menu help left').on('click', function() {
        return window.open('./help.html');
      }).appendTo(this.divObject);
      // 前進
      this.walk = $('<button>').addClass('menu next_day right').on('click', this.onClickWalk.bind(this)).appendTo(this.divObject);
      // ターン終了
      this.turnEnd = $('<button>').addClass('menu turn_end right').on('click', this.onClickTurnEnd.bind(this)).appendTo(this.divObject);
      // やりなおし
      this.undo = $('<button>').addClass('menu redo right').on('click', this.onClickUndo.bind(this)).appendTo(this.divObject);
      return this.divObject.appendTo(this.parentElement);
    }

    // 出撃
    static onClickCharacterPick(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // 出撃できないモードなら返る
      if (!GameManager.isEnable.characterPick) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      // キャラクター出撃モードにする
      GameManager.resetFlags();
      GameManager.isMode.characterPick = true;
      // 遷移可能
      GameManager.isEnable.characterPick = false;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = true;
      GameManager.isEnable.turnEnd = false;
      GameManager.isEnable.walk = false;
      GameManager.isEnable.undo = false;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      GameManager.isEnable.leftPanel = false;
      GameManager.isEnable.rightPanel = false;
      this.reflectEnable();
      GameManager.flags.isCellObjectAnimation = false;
      // コストをセット
      CostManager.updateCostNow();
      // パネル再描画
      CharacterPalletManager.draw();
      SoundManager.play('change_mode');
      GameManager.doCharacterPick();
      return true;
    }

    // 戦闘
    static onClickBattle(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // 戦闘にできないモードなら返る
      if (!GameManager.isEnable.battle) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      // 戦闘モードにする
      GameManager.resetFlags();
      GameManager.isMode.battle = true;
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = true;
      GameManager.isEnable.turnEnd = true;
      GameManager.isEnable.walk = true;
      GameManager.isEnable.undo = true;
      GameManager.isEnable.leftPanel = true;
      GameManager.isEnable.rightPanel = true;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      this.reflectEnable();
      GameManager.flags.isCellObjectAnimation = true;
      SoundManager.play('change_mode');
      GameManager.doBattle();
      return true;
    }

    // ターン終了
    static onClickTurnEnd(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // 前進できないモードなら返る
      if (!GameManager.isEnable.turnEnd) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      GameManager.doTurnEnd();
      return true;
    }

    // レベルアップ
    static onClickLevelup(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // 前進できないモードなら返る
      if (!GameManager.isEnable.levelup) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      // レベルアップモードにする
      GameManager.resetFlags();
      GameManager.isMode.levelup = true;
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = false;
      GameManager.isEnable.battle = true;
      GameManager.isEnable.turnEnd = false;
      GameManager.isEnable.walk = false;
      GameManager.isEnable.undo = false;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      GameManager.isEnable.leftPanel = false;
      GameManager.isEnable.rightPanel = false;
      this.reflectEnable();
      GameManager.flags.isCellObjectAnimation = false;
      LevelupManager.draw();
      SoundManager.play('change_mode');
      GameManager.doLevelup();
      return true;
    }

    // 前進
    static onClickWalk(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // 前進できないモードなら返る
      if (!GameManager.isEnable.walk) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      GameManager.doWalk();
      return true;
    }

    // 移動やりなおし
    static onClickUndo(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // やりなおし不可能なら返る
      if (GameManager.flags.moveToCell === null) {
        return;
      }
      // やりなおしできないモードなら返る
      if (!GameManager.isEnable.undo) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      GameManager.doUndo();
      return true;
    }

    // アイテム画面へ
    static onClickItem(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // アイテムモードにできないなら返る
      if (!GameManager.isEnable.item) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      // 描画
      ItemManager.repick();
      ItemManager.calcUsedItemCount();
      ItemCharacterPicker.draw();
      ItemEditor.draw();
      // アイテムモードにする
      GameManager.resetFlags();
      GameManager.isMode.item = true;
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = true;
      GameManager.isEnable.turnEnd = false;
      GameManager.isEnable.walk = false;
      GameManager.isEnable.undo = false;
      GameManager.isEnable.item = false;
      GameManager.isEnable.gacha = true;
      GameManager.isEnable.leftPanel = false;
      GameManager.isEnable.rightPanel = false;
      this.reflectEnable();
      GameManager.flags.isCellObjectAnimation = false;
      SoundManager.play('change_mode');
      GameManager.doItem();
      return true;
    }

    // ガチャ画面へ
    static onClickGacha(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // ガチャモードにできないなら返る
      if (!GameManager.isEnable.gacha) {
        return;
      }
      // コントロール禁止
      GameManager.changeControllable(false);
      // ガチャモードにする
      GameManager.resetFlags();
      GameManager.isMode.gacha = true;
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = true;
      GameManager.isEnable.turnEnd = false;
      GameManager.isEnable.walk = false;
      GameManager.isEnable.undo = false;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = false;
      GameManager.isEnable.leftPanel = false;
      GameManager.isEnable.rightPanel = false;
      this.reflectEnable();
      GameManager.flags.isCellObjectAnimation = false;
      SoundManager.play('change_mode');
      GameManager.doGacha();
      return true;
    }

    static reflectEnable() {
      var isEnable, key, mode, ref, ref1, results;
      $('button.menu').prop('disabled', false);
      $('button.menu').removeClass('hover');
      ref = GameManager.isEnable;
      for (key in ref) {
        isEnable = ref[key];
        $('button.' + this.enableKey2class(key)).prop('disabled', !isEnable);
      }
      ref1 = GameManager.isMode;
      results = [];
      for (key in ref1) {
        mode = ref1[key];
        if (mode) {
          results.push($('button.' + this.enableKey2class(key)).addClass('hover'));
        } else {
          results.push(void 0);
        }
      }
      return results;
    }

    static enableKey2class(enableKey) {
      switch (enableKey) {
        case 'battle':
          return 'live';
        case 'characterPick':
          return 'performance';
        case 'levelup':
          return 'training';
        case 'turnEnd':
          return 'turn_end';
        case 'walk':
          return 'next_day';
        case 'undo':
          return 'redo';
        case 'item':
          return 'item';
        case 'gacha':
          return 'gacha';
        default:
          return enableKey;
      }
    }

  };

  MenuManager.ID = 'menu';

  MenuManager.SIZE_X = 1320;

  MenuManager.SIZE_Y = 80;

  MenuManager.elements = {
    pickCharacter: null
  };

  return MenuManager;

}).call(this);

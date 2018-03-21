// Generated by CoffeeScript 2.2.2
var Cell;

Cell = (function() {
  class Cell {
    constructor(parentElement, xIndex, yIndex, borderSize) {
      this.stepObjectAnimation = this.stepObjectAnimation.bind(this);
      this.removeMe = this.removeMe.bind(this);
      this.parentElement = parentElement;
      this.xIndex = xIndex;
      this.yIndex = yIndex;
      this.elements = {
        mother: null,
        collision: null,
        background: null,
        object: null,
        movable: null,
        knockout: null
      };
      this.object = null;
      this.tempObject = null;
      this.wayStack = null;
      this.knockout = null;
      this.initElements(borderSize);
    }

    onMouseMiddleUp(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      return GameManager.changeControllable(true);
    }

    async onMouseRightUp(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      
      // キャラ移動選択をキャンセルするトライ
      if ((await this.tryMovePickCancel(evt))) {

      } else if ((await this.tryAttackCancel(evt))) {

      } else if ((await this.tryEnemyLockCancel(evt))) {

      } else if ((await this.tryShowMenu(evt))) {

      } else {
        return GameManager.changeControllable(true);
      }
    }

    async onMouseLeftUp(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      // キャラを仮置きするトライ
      if ((await this.tryCharacterPut(evt))) {

      } else if ((await this.tryMovePick(evt))) {

      } else if ((await this.tryMoveTo(evt))) {

      } else if ((await this.tryAttack(evt))) {

      } else if ((await this.tryEnemyLock(evt))) {

      } else if ((await this.tryEnemyLockCancel(evt))) {

      } else {
        return GameManager.changeControllable(true);
      }
    }

    onMouseLeftDown(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      // 仮置きがあった場合はつかむ
      if (this.tempObject !== null) {
        CharacterPalletManager.pickCharacter(this.tempObject);
        this.tempObject = null;
        CostManager.updateCostNow();
        CharacterPalletManager.drawOverlay();
      }
      return GameManager.changeControllable(true);
    }

    onMouseMiddleDown(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      return GameManager.changeControllable(true);
    }

    onMouseRightDown(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      return GameManager.changeControllable(true);
    }

    onMouseMove(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      // マス目移動時のパネルキャラ切り替え
      return this.changePanels(evt);
    }

    onMouseLeave(evt) {
      if (!GameManager.isControllable()) {
        return;
      }
      GameManager.changeControllable(false);
      return GameManager.changeControllable(true);
    }

    setTempObject(object) {
      // 仮置きに置く
      this.tempObject = object;
      // 出撃中にする
      object.setInField(true);
      // マスの再描画
      return this.draw();
    }

    setObject(object) {
      this.object = object;
      this.tempObject = null;
      return this.draw();
    }

    switchTemp() {
      if (this.tempObject !== null) {
        this.object = this.tempObject;
        this.tempObject = null;
        return this.draw();
      }
    }

    initElements(borderSize) {
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
      this.elements.collision = $('<div>').addClass('cell cell_collision').css(cssPos).css(cssSize).on('mousemove', this.onMouseMove.bind(this)).on('mouseup', (evt) => {
        switch (evt.which) {
          case 1:
            return this.onMouseLeftUp.bind(this)(evt);
          case 2:
            return this.onMouseMiddleUp.bind(this)(evt);
          case 3:
            return this.onMouseRightUp.bind(this)(evt);
        }
      }).on('mousedown', (evt) => {
        switch (evt.which) {
          case 1:
            return this.onMouseLeftDown.bind(this)(evt);
          case 2:
            return this.onMouseMiddleDown.bind(this)(evt);
          case 3:
            return this.onMouseRightDown.bind(this)(evt);
        }
      }).on('mouseleave', this.onMouseLeave.bind(this)).appendTo(this.elements.mother);
      this.elements.background = $('<div>').addClass('cell cell_background').addClass(GameManager.CELL_CLASS).css(cssPos).css(cssSize).appendTo(this.elements.mother);
      this.elements.object = $('<img>').addClass('cell cell_object').css({
        left: 0,
        bottom: 10
      }).css({
        width: '100%'
      }).appendTo(this.elements.mother);
      this.elements.movable = $('<div>').addClass('cell cell_movable').css(cssPos).css(cssSize).addClass('no_display').appendTo(this.elements.mother);
      this.elements.fin = $('<div>').addClass('cell cell_fin').css(cssPos).css(cssSize).addClass('no_display').appendTo(this.elements.mother);
      this.elements.knockout = $('<div>').addClass('cell cell_knockout').addClass('no_display').appendTo(this.elements.mother);
      this.elements.animation = $('<div>').addClass('cell cell_animation').css(cssPos).css(cssSize).addClass('no_display').appendTo(this.elements.mother);
      this.elements.receiveTurn = $('<span>').addClass('cell cell_receive_turn').addClass('no_display badge').appendTo(this.elements.mother);
      this.elements.hpBar = $('<div>').addClass('cell cell_hp_bar').css({
        height: this.constructor.SIZE_Y
      }).addClass('no_display').append($('<div>').addClass('cell_hp_bar_hp')).appendTo(this.elements.mother);
      this.changeMovable(this.constructor.IMAGE_MOVABLE);
      this.changeFin(this.constructor.IMAGE_FIN);
      return $(this.elements.mother).appendTo(this.parentElement);
    }

    changeObject(imagePath = null) {
      if (imagePath === null) {
        return this.elements.object.addClass('no_display');
      } else {
        return this.elements.object.attr('src', imagePath).removeClass('no_display');
      }
    }

    changeAttackable(imagePath = null) {
      if (imagePath === null) {
        return this.elements.attackable.addClass('no_display');
      } else {
        return this.elements.attackable.css('background-image', 'url(' + imagePath + ')').removeClass('no_display');
      }
    }

    changeMovable(imagePath) {
      return this.elements.movable.css('background-image', 'url(' + imagePath + ')');
    }

    changeFin(imagePath) {
      return this.elements.fin.css('background-image', 'url(' + imagePath + ')');
    }

    changeKnockout(imagePath, num = '') {
      if (num !== '') {
        num = '' + num + '%';
      }
      return this.elements.knockout.css('background-image', 'url(' + imagePath + ')').html(num).removeClass('no_display');
    }

    showAnimation(imagePath) {
      return this.elements.animation.css('background-image', 'url(' + imagePath + ')').removeClass('no_display');
    }

    hideAnimation() {
      return this.elements.animation.css('background-image', 'none').addClass('no_display');
    }

    showObject() {
      return this.elements.object.removeClass('no_display');
    }

    hideObject() {
      return this.elements.object.addClass('no_display');
    }

    showMovable(bool = true) {
      if (bool) {
        return this.elements.movable.removeClass('no_display');
      } else {
        return this.elements.movable.addClass('no_display');
      }
    }

    showFin(bool = true) {
      if (bool) {
        return this.elements.fin.removeClass('no_display');
      } else {
        return this.elements.fin.addClass('no_display');
      }
    }

    showKnockout(bool = true) {
      if (bool) {
        return this.elements.knockout.removeClass('no_display');
      } else {
        return this.elements.knockout.addClass('no_display');
      }
    }

    // 吹き出しを出す
    async showPopover(text = null, msec = null) {
      var position;
      if (text === null) {
        return $(this.elements.mother).popover('destroy');
      } else {
        position = this.xIndex < 2 ? 'right' : FieldManager.CELL_X - 2 <= this.xIndex ? 'left' : this.yIndex < 2 ? 'bottom' : 'top';
        $(this.elements.mother).popover({
          content: text,
          placement: position,
          container: 'body'
        }).popover('show');
        if (msec !== null) {
          await Utl.sleep(msec);
          return $(this.elements.mother).popover('destroy');
        }
      }
    }

    // 描画
    draw() {
      // オブジェクト
      if (this.object !== null) {
        this.changeObject(this.object.getBaseImage());
      } else if (this.tempObject !== null) {
        this.changeObject(this.tempObject.getBaseImage());
      } else {
        this.changeObject();
      }
      // 移動可能
      this.drawMovable();
      // 行動終了
      this.drawFin();
      // 倒す
      this.drawKnockout();
      // 受取期限
      this.drawReceiveTurn();
      // HP
      return this.drawHpBar();
    }

    isDroppableCharacter() {
      return this.xIndex <= this.constructor.PUT_FIELD_MAX_X && this.object === null;
    }

    // 進入可能か
    isEnterable() {
      return this.object === null;
    }

    tryCharacterPut(evt) {
      var redrawCharacter;
      if (GameManager.flags.pickedCharacterObject === null && GameManager.flags.pickedCharacterElement === null) {
        return;
      }
      redrawCharacter = null;
      // キャラクター出撃モードで、キャラクターがピックされている場合
      if (GameManager.flags.pickedCharacterObject !== null && this.isDroppableCharacter()) {
        // ここに置いてあった仮キャラを全削除
        FieldManager.removeAllTempObject(this.tempObject);
        // このセルに仮キャラを配置する
        this.setTempObject(GameManager.flags.pickedCharacterObject);
        redrawCharacter = GameManager.flags.pickedCharacterObject;
      }
      // 出撃選択を解除
      if (GameManager.flags.pickedCharacterElement !== null) {
        GameManager.flags.pickedCharacterElement.remove();
        GameManager.flags.pickedCharacterElement = null;
        if (redrawCharacter !== null) {
          CharacterPalletManager.redraw(redrawCharacter);
        }
        GameManager.flags.pickedCharacterObject = null;
      }
      // コスト更新
      CostManager.updateCostNow();
      CharacterPalletManager.drawOverlay();
      // ウインドウを再出現
      CharacterPalletManager.skeleton(false);
      GameManager.changeControllable(true);
      return true;
    }

    tryMovePick(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 既に移動させたいキャラを選んでいる場合はダメ
      if (GameManager.flags.movePickCell !== null) {
        return;
      }
      // 攻撃待ち専用モードの時はダメ
      if (GameManager.flags.waitAttackCell !== null) {
        return;
      }
      // 敵ロックだとダメ
      if (GameManager.flags.lockedEnemyCell !== null) {
        return;
      }
      // キャラクターが置かれている場合のみ
      if (!(this.object !== null && this.object.isCharacterObject())) {
        return;
      }
      // 行動済みでない場合のみ
      if (this.object.isMoved()) {
        return;
      }
      // 戦闘中の特殊行動禁止
      GameManager.isEnable.characterPick = false;
      GameManager.isEnable.levelup = false;
      GameManager.isEnable.battle = false;
      GameManager.isEnable.turnEnd = false;
      GameManager.isEnable.walk = false;
      GameManager.isEnable.undo = false;
      GameManager.isEnable.item = false;
      GameManager.isEnable.gacha = false;
      MenuManager.reflectEnable();
      // 移動選択
      GameManager.movePick(this);
      // 左キャラ固定
      GameManager.isEnable.leftPanel = false;
      GameManager.changeControllable(true);
      return true;
    }

    tryMovePickCancel(evt) {
      var body, cell, i, j, len, len1, ref, x, y;
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 既に移動させたいキャラを選んでいない場合はダメ
      if (GameManager.flags.movePickCell === null) {
        return;
      }
      // 敵ロックだとダメ
      if (GameManager.flags.lockedEnemyCell !== null) {
        return;
      }
      // 移動可能モード
      GameManager.flags.movePickCell = null;
      // 攻撃可能モード
      GameManager.flags.waitAttackCell = null;
      ref = FieldManager.cells;
      // 移動可能などをすべて消す
      for (x = i = 0, len = ref.length; i < len; x = ++i) {
        body = ref[x];
        for (y = j = 0, len1 = body.length; j < len1; y = ++j) {
          cell = body[y];
          cell.setWayStack(null);
          cell.setKnockout(null);
          cell.drawMovable();
          cell.drawKnockout();
        }
      }
      // パネル解放
      GameManager.isEnable.leftPanel = true;
      GameManager.isEnable.rightPanel = true;
      // 戦闘中の特殊行動禁止解除
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = false;
      GameManager.isEnable.turnEnd = true;
      GameManager.isEnable.walk = true;
      GameManager.isEnable.undo = true;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      MenuManager.reflectEnable();
      // 操作可能に
      GameManager.changeControllable(true);
      return true;
    }

    async tryMoveTo(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 既に移動させたいキャラを選んでいない場合はダメ
      if (GameManager.flags.movePickCell === null) {
        return;
      }
      // ここにキャラがいる場合はダメ
      if (this.object !== null) {
        return;
      }
      // ここにいけない場合はダメ
      if (this.wayStack === null) {
        return;
      }
      // 敵ロックだとダメ
      if (GameManager.flags.lockedEnemyCell !== null) {
        return;
      }
      await FieldManager.moveObject(GameManager.flags.movePickCell, this);
      // 移動後に行動がないなら禁止解除
      if (GameManager.flags.waitAttackCell === null) {
        GameManager.isEnable.characterPick = true;
        GameManager.isEnable.levelup = true;
        GameManager.isEnable.battle = false;
        GameManager.isEnable.turnEnd = true;
        GameManager.isEnable.walk = true;
        GameManager.isEnable.undo = true;
        GameManager.isEnable.item = true;
        GameManager.isEnable.gacha = true;
        MenuManager.reflectEnable();
        // セーブ
        SaveManager.save();
      }
      GameManager.changeControllable(true);
      return true;
    }

    async tryAttack(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 攻撃待ちでなければダメ
      if (GameManager.flags.waitAttackCell === null) {
        return;
      }
      // 攻撃可能が設定されてないとダメ
      if (this.knockout === null) {
        return;
      }
      // 敵ロックだとダメ
      if (GameManager.flags.lockedEnemyCell !== null) {
        return;
      }
      // 敵ロックを解除
      GameManager.flags.lockedEnemyCell = null;
      // 攻撃する
      await GameManager.attack(this.knockout, this);
      // 移動・攻撃・戻る・敵ロックモードを解除
      GameManager.flags.movePickCell = null;
      GameManager.flags.moveToCell = null;
      GameManager.flags.waitAttackCell = null;
      GameManager.isEnable.leftPanel = true;
      GameManager.isEnable.rightPanel = true;
      GameManager.flags.lockedEnemyCell = null;
      // 戦闘中の特殊行動禁止解除
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = false;
      GameManager.isEnable.turnEnd = true;
      GameManager.isEnable.walk = true;
      GameManager.isEnable.undo = true;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      MenuManager.reflectEnable();
      // セーブ
      SaveManager.save();
      // 操作可能にする
      return GameManager.changeControllable(true);
    }

    tryAttackCancel(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 攻撃待ちでなければダメ
      if (GameManager.flags.waitAttackCell === null) {
        return;
      }
      // 移動・攻撃モードを解除
      GameManager.flags.movePickCell = null;
      GameManager.flags.waitAttackCell = null;
      GameManager.isEnable.leftPanel = true;
      GameManager.isEnable.rightPanel = true;
      GameManager.flags.lockedEnemyCell = null;
      
      // 戦闘中の特殊行動禁止解除
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = false;
      GameManager.isEnable.turnEnd = true;
      GameManager.isEnable.walk = true;
      GameManager.isEnable.undo = true;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      MenuManager.reflectEnable();
      // セーブ
      SaveManager.save();
      // コールバックで操作可能にする
      return GameManager.changeControllable(true);
    }

    tryEnemyLock(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 移動待ちではダメではダメ
      if (GameManager.flags.movePickCell !== null) {
        return;
      }
      // 攻撃待ちではダメ
      if (GameManager.flags.waitAttackCell !== null) {
        return;
      }
      // 敵性オブジェクト以外はダメ
      if (!(this.object !== null && (this.object.isEnemyObject() || this.object.isPresentboxObject()))) {
        return;
      }
      // 戦闘中の特殊行動禁止
      GameManager.isEnable.characterPick = false;
      GameManager.isEnable.levelup = false;
      GameManager.isEnable.battle = false;
      GameManager.isEnable.turnEnd = false;
      GameManager.isEnable.walk = false;
      GameManager.isEnable.undo = false;
      GameManager.isEnable.item = false;
      GameManager.isEnable.gacha = false;
      MenuManager.reflectEnable();
      // 敵ロックモードを設定
      GameManager.flags.lockedEnemyCell = this;
      // 右パネルを変更不可
      GameManager.isEnable.rightPanel = false;
      // 右パネルに敵をロック
      RightInfoManager.setObject(this.object);
      // 移動可能セルを描画
      FieldManager.removeAllWayStack();
      FieldManager.drawMovableCells(this, FieldManager.getMovableMap(this), true);
      // コールバックで操作可能にする
      return GameManager.changeControllable(true);
    }

    tryEnemyLockCancel(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 敵ロックでないとダメ
      if (GameManager.flags.lockedEnemyCell === null) {
        return;
      }
      // 敵ロックモードを解除
      GameManager.flags.lockedEnemyCell = null;
      // waystack削除
      FieldManager.removeAllWayStack();
      // フィールドを再描画
      FieldManager.draw();
      // 右パネルを解放
      GameManager.isEnable.rightPanel = true;
      // 戦闘中の特殊行動禁止解除
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = false;
      GameManager.isEnable.turnEnd = true;
      GameManager.isEnable.walk = true;
      GameManager.isEnable.undo = true;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      MenuManager.reflectEnable();
      // コールバックで操作可能にする
      return GameManager.changeControllable(true);
    }

    
    // 右クリックメニュー
    async tryShowMenu(evt) {
      // 戦闘モード時のみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 移動待ちではダメ
      if (GameManager.flags.movePickCell !== null) {
        return;
      }
      // 攻撃待ちではダメ
      if (GameManager.flags.waitAttackCell !== null) {
        return;
      }
      // 敵ロックではダメ
      if (GameManager.flags.lockedEnemyCell !== null) {
        return;
      }
      // キャラじゃないとダメ
      if (!(this.object !== null && this.object.isCharacterObject())) {
        return;
      }
      if (!window.confirm(this.object.getName() + 'を休憩させますか？')) {
        return;
      }
      this.object.setHp(0);
      await FieldManager.checkDeath();
      // コールバックで操作可能にする
      return GameManager.changeControllable(true);
    }

    setWayStack(wayStack) {
      return this.wayStack = wayStack;
    }

    setKnockout(knockout) {
      return this.knockout = knockout;
    }

    drawMovable() {
      return this.showMovable(this.wayStack !== null);
    }

    drawKnockout() {
      var attack, attackType, def, hp, knockout;
      if (this.object !== null && this.knockout !== null) {
        // 攻撃側の攻撃タイプ
        attackType = this.knockout.object.getAttackType();
        // 攻撃側の攻撃力
        attack = this.knockout.object.getAttack();
        // 防御側の防御力
        def = attackType === ObjectBase.ATTACK_TYPE.PHYSIC ? this.object.getPDef() : this.object.getMDef();
        // 防御側のHP
        hp = this.object.getHp();
        knockout = ObjectBase.getKnockoutRate(hp, attack, def);
        if (knockout === +2e308) {
          return this.changeKnockout(ObjectBase.KNOCKOUT.OK);
        } else if (knockout === -2e308) {
          return this.changeKnockout(ObjectBase.KNOCKOUT.NG);
        } else {
          return this.changeKnockout(ObjectBase.KNOCKOUT.MAY, knockout);
        }
      } else {
        return this.showKnockout(false);
      }
    }

    drawFin() {
      if (this.object !== null && (this.object.isCharacterObject() || this.object.isEnemyObject()) && this.object.isMoved()) {
        return this.showFin(true);
      } else {
        return this.showFin(false);
      }
    }

    drawHpBar() {
      var hpRate;
      if (this.object === null) {
        return this.elements.hpBar.addClass('no_display');
      } else {
        this.elements.hpBar.removeClass('no_display');
        hpRate = this.object.getHp() / this.object.getHpMax();
        return this.elements.hpBar.children('div').css({
          height: this.constructor.SIZE_Y * hpRate
        });
      }
    }

    drawReceiveTurn() {
      if (this.object !== null && this.object.isPresentboxObject()) {
        return this.elements.receiveTurn.html(this.object.getReceiveTurn()).removeClass('no_display');
      } else {
        return this.elements.receiveTurn.addClass('no_display');
      }
    }

    stepObjectAnimation(index) {
      if (this.object === null) {
        return this.hideObject();
      }
      if (this.object.getImage(index) === null) {
        index = 0;
      }
      return this.changeObject(this.object.getImage(index));
    }

    removeMe() {
      var e, i, len, ref, results;
      ref = this.elements;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        e = ref[i];
        results.push(e.remove());
      }
      return results;
    }

    changePanels(evt) {
      // 戦闘中モードのみ
      if (!GameManager.isMode.battle) {
        return;
      }
      // 左パネル切り替え可能
      if (GameManager.isEnable.leftPanel) {
        if (this.object === null) {
          LeftInfoManager.setObject(null);
        } else if (this.object.isCharacterObject()) {
          LeftInfoManager.setObject(this.object);
        } else if (this.object.isEnemyObject()) {
          LeftInfoManager.setObject(null);
        } else if (this.object.isPresentboxObject()) {
          LeftInfoManager.setObject(null);
        }
      }
      // 右パネル切り替え可能
      if (GameManager.isEnable.rightPanel) {
        if (this.object === null) {
          return RightInfoManager.setObject(null);
        } else if (this.object.isCharacterObject()) {
          return RightInfoManager.setObject(null);
        } else if (this.object.isEnemyObject()) {
          return RightInfoManager.setObject(this.object);
        } else if (this.object.isPresentboxObject()) {
          return RightInfoManager.setObject(this.object);
        }
      }
    }

  };

  Cell.SIZE_X = 72;

  Cell.SIZE_Y = 72;

  // セルのオブジェクトのアニメーションの間隔msec
  Cell.OBJECT_ANIMATION_MSEC = 500;

  // キャラ出撃で置けるxIndex
  Cell.PUT_FIELD_MAX_X = 1;

  // 画像
  Cell.IMAGE_MOVABLE = './img/movable.png';

  Cell.IMAGE_FIN = './img/fin.png';

  Cell.IMAGE_SNIPE = './img/target.png';

  return Cell;

}).call(this);

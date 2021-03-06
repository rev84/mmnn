// Generated by CoffeeScript 2.2.2
var GameManager;

GameManager = (function() {
  class GameManager {
    static onMouseMiddleDown(evt) {
      if (!this.isControllable()) {
        return;
      }
      return true;
    }

    static onMouseMiddleUp(evt) {
      if (!this.isControllable()) {
        return;
      }
      return true;
    }

    static onMouseRightDown(evt) {
      if (!this.isControllable()) {
        return;
      }
      return true;
    }

    static onMouseRightUp(evt) {
      if (!this.isControllable()) {
        return;
      }
      return true;
    }

    static onMouseLeftDown(evt) {
      if (!this.isControllable()) {
        return;
      }
      return true;
    }

    static onMouseLeftUp(evt) {
      if (!this.isControllable()) {
        return;
      }
      console.log('game mouseup');
      // 出撃選択を解除
      if (this.flags.pickedCharacterObject !== null) {
        this.flags.pickedCharacterObject = null;
      }
      if (this.flags.pickedCharacterElement !== null) {
        this.flags.pickedCharacterElement.remove();
        this.flags.pickedCharacterElement = null;
      }
      return true;
    }

    static onMouseLeave(evt) {
      if (!this.isControllable()) {
        return;
      }
      return true;
    }

    static onMouseMove(evt) {
      if (!this.isControllable()) {
        return;
      }
      // マウスの位置は常に記録
      [this.mousePos.x, this.mousePos.y] = Utl.e2localPos(evt);
      // キャラクター出撃モードで、キャラクターがピックされている場合
      if (this.flags.pickedCharacterElement !== null) {
        this.followPickedCharacterElement(evt);
      }
      return true;
    }

    // キャラクターの絵をマウスに追随させる
    static followPickedCharacterElement(evt) {
      // キャラクター出撃モードで、キャラクターがピックされている場合
      if (this.flags.pickedCharacterElement !== null) {
        // そのキャラクターの絵をマウスに追随させる
        return this.flags.pickedCharacterElement.css({
          left: this.mousePos.x - 90 / 2,
          top: this.mousePos.y - 90 / 2
        }).removeClass('no_display');
      }
    }

    // 戦闘に移行
    static doBattle(isSoon = false) {
      this.partsAnimation(this.POSITION.BATTLE, isSoon);
      // キャラクター設置を確定
      CharacterPalletManager.onExit();
      // セーブ
      SaveManager.save();
      // コントロール可能に
      return this.changeControllable(true);
    }

    // キャラクター出撃に移行
    static doCharacterPick(isSoon = false) {
      // セーブ
      SaveManager.save();
      return this.partsAnimation(this.POSITION.CHARACTER_PICK, isSoon);
    }

    
    // ターン終了
    static async doTurnEnd(isSoon = false) {
      var c, k, ref;
      // 疲労ダメージ
      await FieldManager.turnEndDamage();
      // 動ける敵がいる限り動かす
      while ((await this.enemyMove())) {}
      await FieldManager.turnPresents();
      // 階層進行制限解除
      this.flags.isWalkInThisTurn = false;
      ref = this.characters;
      for (k in ref) {
        c = ref[k];
        // 全キャラの復帰を進行
        c.decreaseComeback();
      }
      // 味方ターン開始時イベント走査
      FieldManager.onCharacterTurnStart();
      // セーブ
      SaveManager.save();
      // コントロール可能に
      return this.changeControllable(true);
    }

    // レベルアップ
    static doLevelup(isSoon = false) {
      this.partsAnimation(this.POSITION.LEVELUP, isSoon);
      // キャラクター設置を確定
      CharacterPalletManager.onExit();
      this.flags.isCellObjectAnimation = false;
      // セーブ
      SaveManager.save();
      // コントロール可能に
      return this.changeControllable(true);
    }

    // アイテム画面
    static doItem(isSoon = false) {
      this.partsAnimation(this.POSITION.ITEM, isSoon);
      // キャラクター設置を確定
      CharacterPalletManager.onExit();
      // セーブ
      SaveManager.save();
      // コントロールを戻す
      return this.changeControllable(true);
    }

    // ガチャ画面
    static doGacha(isSoon = false) {
      // ボタン更新
      GachaManager.refreshButton();
      this.partsAnimation(this.POSITION.GACHA, isSoon);
      // キャラクター設置を確定
      CharacterPalletManager.onExit();
      // セーブ
      SaveManager.save();
      // コントロールを戻す
      return this.changeControllable(true);
    }

    static partsAnimation(ary, isSoon = false) {
      var animationMsec, id, pos, ref;
      // 操作不能にする
      this.changeControllable(false);
      animationMsec = isSoon ? 0 : this.ANIMATION_MSEC;
      ref = this.POSITION.COMMON;
      // COMMONをマージ
      for (id in ref) {
        pos = ref[id];
        if (!(id in ary)) {
          ary[id] = pos;
        }
      }
// アニメーション登録
      for (id in ary) {
        pos = ary[id];
        // 消す
        if (pos === null) {
          $('#' + id).fadeOut(animationMsec);
        } else {
          // 表す
          $('#' + id).animate({
            left: pos[0],
            top: pos[1]
          }, animationMsec).fadeIn(animationMsec);
        }
      }
      // 指定時間後に操作可能
      Utl.sleep(animationMsec);
      return this.changeControllable(true);
    }

    // 初期化
    static init() {
      var savedata, savedataCharacters, savedataEnv, savedataField, savedataItems;
      // 右クリック禁止
      $(document).on('contextmenu', function() {
        return !GameManager.DEBUG_CONFIG.DISABLE_RIGHT_CLICK_MENU;
      });
      this.gameElement = $('<div>').attr('id', this.ID).on('mousemove', this.onMouseMove.bind(this)).on('mouseup', (evt) => {
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
      }).on('mouseleave', this.onMouseLeave.bind(this));
      // セーブデータを読み込む
      savedata = SaveManager.load();
      savedataItems = savedata !== null && 'items' in savedata ? savedata.items : null;
      savedataCharacters = savedata !== null && 'characters' in savedata ? savedata.characters : null;
      savedataField = savedata !== null && 'field' in savedata ? savedata.field : null;
      savedataEnv = savedata !== null && 'env' in savedata ? savedata.env : null;
      // 階を進んだか
      if (savedata !== null && 'flags' in savedata) {
        if ('isWalkInThisTurn' in savedata.flags) {
          this.flags.isWalkInThisTurn = savedata.flags.isWalkInThisTurn;
        }
      }
      this.initItems(savedataItems);
      this.initCharacters(savedataCharacters);
      this.initEnemys(null);
      this.initField(savedataField);
      this.initEnv(savedataEnv);
      this.initMenu(null);
      this.initPanels(null);
      this.initLevelup(null);
      this.initItemWindow(null);
      this.initBattleResult(null);
      this.initGacha();
      this.initCostManager();
      this.gameElement.appendTo('body');
      // 戦闘モードにする
      GameManager.resetFlags();
      GameManager.isMode.battle = true;
      GameManager.isEnable.characterPick = true;
      GameManager.isEnable.levelup = true;
      GameManager.isEnable.battle = true;
      GameManager.isEnable.turnEnd = true;
      GameManager.isEnable.walk = true;
      GameManager.isEnable.undo = true;
      GameManager.isEnable.item = true;
      GameManager.isEnable.gacha = true;
      GameManager.isEnable.leftPanel = true;
      GameManager.isEnable.rightPanel = true;
      MenuManager.reflectEnable();
      GameManager.flags.isCellObjectAnimation = true;
      return this.doBattle(true);
    }

    static initMenu(savedata) {
      if (this.initialized.menu) {
        return;
      }
      this.initialized.menu = true;
      return MenuManager.init(this.gameElement);
    }

    static initField(savedata) {
      if (this.initialized.field) {
        return;
      }
      this.initialized.field = true;
      return FieldManager.init(this.gameElement, savedata);
    }

    static initEnv(savedata) {
      if (this.initialized.env) {
        return;
      }
      this.initialized.env = true;
      EnvManager.init(this.gameElement);
      // デバッグ
      /*
      EnvManager.setLife 5
      EnvManager.setExp (if @DEBUG_CONFIG.START_EXP is false then 0 else @DEBUG_CONFIG.START_EXP)
      EnvManager.setFloor 1
      EnvManager.setJewel (if @DEBUG_CONFIG.START_JUWEL is false then 0 else @DEBUG_CONFIG.START_JUWEL)
      */
      if (savedata !== null) {
        if ('life' in savedata) {
          EnvManager.setLife(savedata.life);
        }
        if ('floor' in savedata) {
          EnvManager.setFloor(savedata.floor);
        }
        if ('exp' in savedata) {
          EnvManager.setExp(savedata.exp);
        }
        if ('jewel' in savedata) {
          return EnvManager.setJewel(savedata.jewel);
        }
      }
    }

    static initPanels(savedata) {
      if (this.initialized.panels) {
        return;
      }
      this.initialized.panels = true;
      LeftInfoManager.init(this.gameElement);
      return RightInfoManager.init(this.gameElement);
    }

    static initLevelup(savedata) {
      if (this.initialized.levelup) {
        return;
      }
      this.initialized.levelup = true;
      LevelupManager.init(this.gameElement);
      return LevelupManager.draw();
    }

    static initBattleResult(savedata) {
      if (this.initialized.battleResult) {
        return;
      }
      this.initialized.battleResult = true;
      return BattleResultManager.init(this.gameElement);
    }

    static initGacha() {
      if (this.initialized.gacha) {
        return;
      }
      this.initialized.gacha = true;
      return GachaManager.init(this.gameElement);
    }

    // キャラ初期化
    static initCharacters(savedata) {
      var characterId, characterObject, className, params, ref, ref1;
      if (this.initialized.characters) {
        return;
      }
      this.initialized.characters = true;
      CharacterPalletManager.init(this.gameElement);
      this.characters = {};
      ref = window.CharacterList;
      for (characterId in ref) {
        className = ref[characterId];
        if (savedata !== null && characterId in savedata) {
          params = savedata[characterId];
        } else {
          params = {
            joined: null,
            level: 1,
            hp: null,
            items: [],
            inField: false,
            moved: false,
            itemCapacityPlus: 0
          };
        }
        this.characters[characterId] = new window.CharacterList[characterId](params);
      }
      ref1 = this.characters;
      for (characterId in ref1) {
        characterObject = ref1[characterId];
        CharacterPalletManager.addCharacter(characterObject);
      }
      return CharacterPalletManager.draw();
    }

    // キャラ初期化
    static initEnemys(savedata) {
      if (this.initialized.enemys) {
        return;
      }
      this.initialized.enemys = true;
      this.enemys = window.EnemyList;
      return window.EnemyList = void 0;
    }

    // アイテム初期化
    static initItems(savedata) {
      if (this.initialized.items) {
        return;
      }
      this.initialized.items = true;
      this.items = window.ItemList;
      window.ItemList = void 0;
      return ItemManager.init(this.gameElement, savedata);
    }

    // アイテムウインドウ初期化
    static initItemWindow(savedata) {
      if (this.initialized.itemWindow) {
        return;
      }
      this.initialized.itemWindow = true;
      return ItemWindow.init(savedata);
    }

    // アイテムウインドウ初期化
    static initCostManager() {
      if (this.initialized.cost_manager) {
        return;
      }
      this.initialized.cost_manager = true;
      return CostManager.init(this.gameElement);
    }

    static isControllable() {
      return this.flags.controllable;
    }

    static changeControllable(bool) {
      return this.flags.controllable = !!bool;
    }

    static switchTempAll() {
      return $.each(FieldManager.cells, function() {
        return $.each(this, function() {
          return this.switchTemp();
        });
      });
    }

    static movePick(cell) {
      var attackableCell, attackables, i, len;
      FieldManager.removeAllWayStack();
      FieldManager.removeAllKnockout();
      // 移動可能モード
      this.flags.movePickCell = cell;
      // 攻撃可能モード
      this.flags.waitAttackCell = cell;
      // 動けるマスを描画
      FieldManager.drawMovableCells(cell, FieldManager.getMovableMap(cell));
      // 攻撃可能判定
      attackables = FieldManager.getAttackableCellsByCell(cell);
      for (i = 0, len = attackables.length; i < len; i++) {
        attackableCell = attackables[i];
        attackableCell.knockout = cell;
      }
      return FieldManager.drawKnockout();
    }

    // 敵が行動する
    static async enemyMove() {
      var _, acts, atkCell, atkObj, attackables, beatLevel, beatPossibility, c, damage, debugCount, def, ending, enemyCell, getAct, hp, i, isDeath, j, l, len, len1, len2, level, m, mBody, movableMap, moveToCell, myAttack, myAttackType, n, ref, ref1, ref2, wayStack, x, xMove, y, yMove;
      debugCount = 0;
      this.changeControllable(false);
      // 戻すは不可能になる
      this.flags.moveToCell = null;
      // 全マスのwayStack解除
      FieldManager.removeAllWayStack();
      // 全マスの移動可能表示解除
      FieldManager.removeAllKnockout();
      // 全マスの再描画
      FieldManager.drawMovable();
      FieldManager.drawKnockout();
      // 終了時の処理
      ending = async() => {
        // パネルリセット
        LeftInfoManager.setObject(null);
        RightInfoManager.setObject(null);
        FieldManager.resetAllMoved();
        FieldManager.drawMovable();
        FieldManager.drawKnockout();
        FieldManager.drawFin();
        // 移動・攻撃・戻るモードを解除
        this.flags.movePickCell = null;
        this.flags.moveToCell = null;
        this.flags.waitAttackCell = null;
        // 敵を湧かせる
        await FieldManager.randomEnemyAppear();
        return false;
      };
      // 全マスから未行動の敵を探す
      enemyCell = null;
      enemysearch://;
      for (x = i = 0, ref = FieldManager.cells.length; (0 <= ref ? i < ref : i > ref); x = 0 <= ref ? ++i : --i) {
        for (y = j = 0, ref1 = FieldManager.cells[x].length; (0 <= ref1 ? j < ref1 : j > ref1); y = 0 <= ref1 ? ++j : --j) {
          c = FieldManager.cells[x][y];
          // 未行動の敵
          if (c.object !== null && c.object.isEnemyObject() && !c.object.isMoved()) {
            enemyCell = c;
            break enemysearch;
          }
        }
      }
      // 行動してない敵はいなかった
      if (enemyCell === null) {
        return ending();
      }
      //###################################################################
      // 全行動表

      // [0]評価構造体
      //   [life] 減らせるライフ
      //   [beatLevel]倒せるレベル
      //   [beatPossibility]倒せる可能性
      //   [damage]ダメージ量
      //   [xMove]移動後のx座標
      //   [moveAmount]移動距離
      // [1]移動先のセル
      // [2]攻撃対象(-1:自爆してフィールドライフを減らす)

      // ★優先度
      // ライフ減らせる＞
      // 確実に倒せる味方を倒せる（レベル高い順）＞
      // 倒せる可能性の高い味方を攻撃する（可能性順）＞
      // 与えるダメージが大きい味方に攻撃する（最高ダメージ順）＞
      // なるべく端に近づく（近い順）＞
      // 移動距離が長い
      //###################################################################
      getAct = function(params) {
        var rtn;
        rtn = {
          life: 0,
          beatLevel: 0,
          beatPossibility: -2e308,
          damage: 0,
          xMove: +2e308,
          moveAmount: +2e308
        };
        if ('life' in params) {
          rtn.life = params.life;
        }
        if ('beatLevel' in params) {
          rtn.beatLevel = params.beatLevel;
        }
        if ('beatPossibility' in params) {
          rtn.beatPossibility = params.beatPossibility;
        }
        if ('damage' in params) {
          rtn.damage = params.damage;
        }
        if ('xMove' in params) {
          rtn.xMove = params.xMove;
        }
        if ('moveAmount' in params) {
          rtn.moveAmount = params.moveAmount;
        }
        return rtn;
      };
      acts = [];
      
      // 移動できる場所
      movableMap = FieldManager.getMovableMap(enemyCell);
      
      // 攻撃側の攻撃タイプ
      myAttackType = enemyCell.object.getAttackType();
      
      // 攻撃側の攻撃力
      myAttack = enemyCell.object.getAttack();
      
      // すべての位置で攻撃可能な分岐をおこない、点数化する
      actsearch://;
      for (xMove = l = 0, len = movableMap.length; l < len; xMove = ++l) {
        mBody = movableMap[xMove];
        for (yMove = m = 0, len1 = mBody.length; m < len1; yMove = ++m) {
          wayStack = mBody[yMove];
          if (!(wayStack !== null && (0 <= (ref2 = wayStack.length) && ref2 <= enemyCell.object.getMove()))) {
            // 行けないので飛ばす
            continue;
          }
          // 行き先のセル
          moveToCell = FieldManager.cells[xMove][yMove];
          // 行き先にwayStackをセットしちゃう
          moveToCell.setWayStack(wayStack);
          // 端っこに到達して、なおまだ移動力がある場合
          if (xMove === 0 && (enemyCell.object.getMove() - wayStack.length) > 0) {
            // 突っ込む
            acts.push([
              getAct({
                life: 1,
                moveAmount: wayStack.length
              }),
              moveToCell,
              -1
            ]);
          }
          //`break actsearch`

          // ここでじっとするプランをまず入れる
          acts.push([
            getAct({
              xMove: xMove,
              moveAmount: wayStack.length
            }),
            moveToCell,
            null
          ]);
          // 攻撃可能な相手
          attackables = FieldManager.getAttackableCells(enemyCell.object, xMove, yMove);
          for (n = 0, len2 = attackables.length; n < len2; n++) {
            atkCell = attackables[n];
            atkObj = atkCell.object;
            // 防御側の防御力
            def = myAttackType === ObjectBase.ATTACK_TYPE.PHYSIC ? atkObj.getPDef() : atkObj.getMDef();
            // 防御側のHP
            hp = atkObj.getHp();
            // 防御側のレベル
            level = atkObj.getLevel();
            // 倒せる確率
            beatPossibility = ObjectBase.getKnockoutRate(hp, myAttack, def);
            // 与えられる最高ダメージ
            damage = ObjectBase.getDamageMax(myAttack, def);
            beatLevel = beatPossibility === +2e308 ? level : 0;
            acts.push([
              getAct({
                beatLevel: beatLevel,
                beatPossibility: beatPossibility,
                damage: damage,
                xMove: xMove,
                moveAmount: wayStack.length
              }),
              moveToCell,
              atkCell
            ]);
          }
        }
      }
      
      // 点数順にソートする
      acts.sort(function(aAry, bAry) {
        var a, b;
        a = aAry[0];
        b = bAry[0];
        if (a.life > b.life) {
          return -1;
        }
        if (a.life < b.life) {
          return 1;
        }
        if (a.life > 0 && b.life > 0 && a.moveAmount !== b.moveAmount) {
          // ライフ減少できているもの同士は、移動距離が短い方がいいとする
          return a.moveAmount - b.moveAmount;
        }
        if (a.beatLevel > b.beatLevel) {
          return -1;
        }
        if (a.beatLevel < b.beatLevel) {
          return 1;
        }
        if (a.beatPossibility > b.beatPossibility) {
          return -1;
        }
        if (a.beatPossibility < b.beatPossibility) {
          return 1;
        }
        if (a.damage > b.damage) {
          return -1;
        }
        if (a.damage < b.damage) {
          return 1;
        }
        if (a.xMove < b.xMove) {
          return -1;
        }
        if (a.xMove > b.xMove) {
          return 1;
        }
        if (a.moveAmount > b.moveAmount) {
          return -1;
        }
        if (a.moveAmount < b.moveAmount) {
          return 1;
        }
        return 0;
      });
      // 最高評価のものをおこなう
      [_, moveToCell, atkCell] = acts[0];
      // 移動
      await FieldManager.moveObject(enemyCell, moveToCell);
      // 攻撃しない
      if (atkCell === null) {
        moveToCell.object.setMoved(true);
        moveToCell.drawFin();
      // 自爆する
      } else if (atkCell === -1) {
        isDeath = (await this.terror(moveToCell));
        if (isDeath) {
          // 死んでたら終わり
          return false;
        }
      } else {
        // 攻撃する
        await this.attack(moveToCell, atkCell);
      }
      return true;
    }

    static async attack(attackerCell, defenderCell) {
      var attack, attackType, attacker, character, damage, def, defender, enemy, hp, hpBase, hpMax, hpTo, i, index, isCharacterOffence, leftObject, ref, rightObject, times;
      // それぞれのオブジェクト
      attacker = attackerCell.object;
      defender = defenderCell.object;
      // パネル用
      this.isEnable.leftObject = false;
      this.isEnable.rightObject = false;
      leftObject = attacker.isCharacterObject() ? attacker : defender;
      rightObject = attacker.isCharacterObject() ? defender : attacker;
      // 左に味方の情報
      LeftInfoManager.setObject(leftObject);
      // 右に敵の情報
      RightInfoManager.setObject(rightObject);
      // ターゲットマークを点滅させる
      times = 5;
      for (index = i = 0, ref = times; (0 <= ref ? i < ref : i > ref); index = 0 <= ref ? ++i : --i) {
        defenderCell.showAnimation('./img/target.png');
        await Utl.sleep(100);
        defenderCell.hideAnimation();
        await Utl.sleep(100);
      }
      await Utl.sleep(50);
      // 攻撃側の攻撃タイプ
      attackType = attacker.getAttackType();
      // 攻撃側の攻撃力
      attack = attacker.getAttack();
      // 防御側の防御力
      def = attackType === ObjectBase.ATTACK_TYPE.PHYSIC ? defender.getPDef() : defender.getMDef();
      // 防御側のHP
      hp = defender.getHp();
      // ダメージ
      damage = ObjectBase.getDamage(attack, def);
      // 攻撃アニメーション
      if (attacker.isCharacterObject()) {
        character = attacker;
        enemy = defender;
        isCharacterOffence = true;
      } else {
        character = defender;
        enemy = attacker;
        isCharacterOffence = false;
      }
      hpMax = defender.getHpMax();
      hpBase = defender.getHp();
      hpTo = defender.getHp() - damage;
      if (hpTo < 0) {
        hpTo = 0;
      }
      // アニメーションを待つ
      await BattleResultManager.animate(character, enemy, isCharacterOffence, hpMax, hpBase, hpTo);
      await Utl.sleep(100);
      // ダメージを与える
      defender.damage(damage);
      // 倒したキャラの台詞チェック
      await FieldManager.checkDeath();
      // 攻撃側を行動終了にする
      attacker.setMoved(true);
      // 再描画
      attackerCell.draw();
      defenderCell.draw();
      // 移動・攻撃対象を解除
      FieldManager.removeAllWayStack();
      FieldManager.removeAllKnockout();
      FieldManager.drawMovable();
      return FieldManager.drawKnockout();
    }

    // 自爆
    static terror(cell) {
      // ライフを1下げる
      EnvManager.decreaseLife();
      // 敵を消し去る
      cell.object = null;
      cell.draw();
      // チェック
      return EnvManager.deathPenalty();
    }

    // 指定した階層で出得る敵を一体返す
    static getEnemyObject(level = EnvManager.getFloor()) {
      var enemyClass, id, ids, ref, targetId;
      ids = [];
      ref = GameManager.enemys;
      for (id in ref) {
        enemyClass = ref[id];
        if (enemyClass.appearance <= level) {
          ids.push(id);
        }
      }
      if (ids.length <= 0) {
        return null;
      }
      targetId = Utl.shuffle(ids).pop();
      return new GameManager.enemys[targetId]({
        level: level,
        hp: null,
        inField: true,
        moved: false
      });
    }

    // 階層をひとつ進める
    static async doWalk() {
      var cell, i, j, l, len, m, n, nextField, ref, ref1, ref2, ref3, ref4, x, y;
      this.changeControllable(false);
      // 既にこのターン進んでいた場合
      if (this.flags.isWalkInThisTurn) {
        window.alert('このターンは既に階層を進んだので、次のターンになるまで進めません');
        return this.changeControllable(true);
      }
      ref = FieldManager.cells[0];
      // 左端に味方がいるので進めない場合
      for (i = 0, len = ref.length; i < len; i++) {
        cell = ref[i];
        if (cell.object !== null && cell.object.isCharacterObject()) {
          window.alert('左端に味方がいるので進めません');
          return this.changeControllable(true);
        }
      }
      // 次の列を生んでおく
      nextField = FieldManager.generateNextField();
      // 全マスずらすアニメーション
      $.each(FieldManager.cells, function() {
        return $.each(this, function() {
          this.xIndex--;
          return this.elements.mother.animate({
            left: this.xIndex * this.constructor.SIZE_X + FieldManager.BORDER_SIZE * (this.xIndex + 1)
          }, 1000);
        });
      });
      $.each(nextField, function() {
        this.xIndex--;
        return this.elements.mother.animate({
          left: this.xIndex * this.constructor.SIZE_X + FieldManager.BORDER_SIZE * (this.xIndex + 1)
        }, 1000);
      });
      await Utl.sleep(1100);
// 左端のセルをぜんぶ消す
      for (y = j = 0, ref1 = FieldManager.cells[0].length; (0 <= ref1 ? j < ref1 : j > ref1); y = 0 <= ref1 ? ++j : --j) {
        FieldManager.cells[0][y].removeMe();
      }
// 既存のセルをいっこ左にずらす
      for (x = l = 1, ref2 = FieldManager.cells.length; (1 <= ref2 ? l < ref2 : l > ref2); x = 1 <= ref2 ? ++l : --l) {
        for (y = m = 0, ref3 = FieldManager.cells[x].length; (0 <= ref3 ? m < ref3 : m > ref3); y = 0 <= ref3 ? ++m : --m) {
          FieldManager.cells[x - 1][y] = FieldManager.cells[x][y];
        }
      }
// 右端に新規の列を追加する
      for (y = n = 0, ref4 = nextField.length; (0 <= ref4 ? n < ref4 : n > ref4); y = 0 <= ref4 ? ++n : --n) {
        FieldManager.cells[FieldManager.CELL_X - 1][y] = nextField[y];
      }
      // 階層インクリメント
      EnvManager.increaseFloor(1);
      // 階層進行制限
      this.flags.isWalkInThisTurn = true;
      // 移動やりなおし不可
      this.flags.moveToCell = null;
      
      // セーブ
      SaveManager.save();
      return this.changeControllable(true);
    }

    static doUndo() {
      var nowCell, preCell;
      this.changeControllable(false);
      // 戻す
      [preCell, nowCell] = this.flags.moveToCell;
      preCell.object = nowCell.object;
      nowCell.object = null;
      // 行動終了を解除
      preCell.object.setMoved(false);
      // 戻せなくする
      this.flags.moveToCell = null;
      // 再描画
      preCell.draw();
      nowCell.draw();
      // セーブ
      SaveManager.save();
      // コントロールを戻す
      return this.changeControllable(true);
    }

    static resetFlags() {
      var key, ref, ref1, results, val;
      ref = this.isEnable;
      for (key in ref) {
        val = ref[key];
        this.isEnable[key] = false;
      }
      ref1 = this.isMode;
      results = [];
      for (key in ref1) {
        val = ref1[key];
        results.push(this.isMode[key] = false);
      }
      return results;
    }

  };

  GameManager.DEBUG_CONFIG = {
    
    // 右クリックでメニューをでなくする
    DISABLE_RIGHT_CLICK_MENU: false,
    // 初期経験値（falseでデバッグ無効）
    START_EXP: 10000,
    // 初期ジュエル（falseでデバッグ無効）
    START_JUWEL: 10000,
    // アイテムが0個でも表示する
    IS_SHOW_ALL_ITEMS: true,
    // セーブ
    AUTO_SAVE: true
  };

  GameManager.ID = 'game';

  GameManager.mousePos = {
    x: 0,
    y: 0
  };

  GameManager.gameElement = null;

  GameManager.characters = [];

  GameManager.enemys = [];

  GameManager.items = [];

  GameManager.initialized = {
    characters: false,
    field: false,
    menu: false,
    enemys: false,
    levelup: false,
    env: false,
    items: false,
    gacha: false,
    cost_manager: false
  };

  GameManager.isMode = {
    battle: false,
    characterPick: false,
    levelup: false,
    item: false,
    gacha: false
  };

  GameManager.isEnable = {
    battle: false,
    characterPick: false,
    levelup: false,
    turnEnd: false,
    walk: false,
    undo: false,
    leftPanel: false,
    rightPanel: false,
    item: false,
    gacha: false
  };

  GameManager.flags = {
    
    // 操作可能か
    controllable: true,
    // セルのオブジェクトのアニメーションを有効にするか
    isCellObjectAnimation: true,
    // キャラクター出撃をしている場合、現在ドラッグされているキャラクターオブジェクト
    pickedCharacterObject: null,
    // キャラクター出撃をしている場合、現在ドラッグされているキャラクターの要素
    pickedCharacterElement: null,
    // 戦闘モードでキャラクターを動かしている場合、現在対象になっているセル
    movePickCell: null,
    // 「元に戻す」で戻れるセルのオブジェクト
    // [0]元のセル [1]移動先のセル
    moveToCell: null,
    // 戦闘モードで攻撃待ちの場合、現在対象になっているセル
    waitAttackCell: null,
    // このターン、階層を進めたか
    isWalkInThisTurn: false,
    // 戦闘モードで敵をロックしてる場合
    lockedEnemyCell: null
  };

  // アニメーション関係
  GameManager.POSITION = {
    COMMON: {
      menu: [0, 0],
      exp: [1000, 675],
      floor: [0, 735],
      jewel: [1000, 735],
      life: [0, 685]
    },
    BATTLE: {
      character_pallet: null,
      field_visible: [0, 25],
      left_info: [200, 675],
      right_info: [600, 675],
      levelup: null,
      item: null,
      gacha: null,
      cost_manager: null
    },
    CHARACTER_PICK: {
      character_pallet: [144, 75],
      field_visible: [0, 25],
      left_info: null,
      right_info: null,
      levelup: null,
      item: null,
      gacha: null,
      cost_manager: [200, 675]
    },
    LEVELUP: {
      character_pallet: null,
      field_visible: [0, 25],
      left_info: null,
      right_info: null,
      levelup: [0, 75],
      item: null,
      gacha: null,
      cost_manager: null
    },
    ITEM: {
      character_pallet: null,
      field_visible: null,
      left_info: null,
      right_info: null,
      levelup: null,
      item: [0, 75],
      gacha: null,
      cost_manager: null
    },
    GACHA: {
      character_pallet: null,
      field_visible: null,
      left_info: null,
      right_info: null,
      levelup: null,
      item: null,
      gacha: [0, 75],
      cost_manager: null
    }
  };

  GameManager.ANIMATION_MSEC = 300;

  return GameManager;

}).call(this);

// Generated by CoffeeScript 2.2.2
var FieldManager;

FieldManager = (function() {
  class FieldManager {
    static init(parentElement, savedata) {
      var i, j, k, ref, ref1, ref2, x, y;
      this.parentElement = parentElement;
      this.SIZE_X = this.CELL_X * Cell.SIZE_X + this.BORDER_SIZE * (this.CELL_X + 1);
      this.SIZE_Y = this.CELL_Y * Cell.SIZE_Y + this.BORDER_SIZE * (this.CELL_Y + 1) + 50;
      // 見える領域を制限するためにしかたなく置いた親エレメント
      this.visibleObject = $('<div>').attr('id', 'field_visible').css({
        width: this.CELL_X * Cell.SIZE_X + this.BORDER_SIZE * (this.CELL_X + 1),
        height: this.CELL_Y * Cell.SIZE_Y + this.BORDER_SIZE * (this.CELL_Y + 1) + 50
      }).appendTo(this.parentElement);
      this.divObject = $('<div>').attr('id', this.ID).css({
        width: this.CELL_X * Cell.SIZE_X + this.BORDER_SIZE * (this.CELL_X + 1),
        height: this.CELL_Y * Cell.SIZE_Y + this.BORDER_SIZE * (this.CELL_Y + 1)
      }).appendTo(this.visibleObject);
      
      // フィールド初期化
      this.cells = [];
      for (x = i = 0, ref = this.CELL_X; (0 <= ref ? i < ref : i > ref); x = 0 <= ref ? ++i : --i) {
        this.cells[x] = [];
        for (y = j = 0, ref1 = this.CELL_Y; (0 <= ref1 ? j < ref1 : j > ref1); y = 0 <= ref1 ? ++j : --j) {
          this.cells[x][y] = new Cell(this.divObject, x, y, this.BORDER_SIZE);
          // セーブ復元
          if (savedata !== null && x in savedata && y in savedata[x]) {
            // なし
            if (savedata[x][y] === null) {

            } else if (savedata[x][y].type === ObjectBase.OBJECT_TYPE.CHARACTER) {
              this.cells[x][y].object = GameManager.characters[savedata[x][y].id];
              this.cells[x][y].draw();
            // 敵
            } else if (savedata[x][y].type === ObjectBase.OBJECT_TYPE.ENEMY) {
              this.cells[x][y].object = EnemyBase.getInstance(savedata[x][y].id, savedata[x][y]);
              this.cells[x][y].draw();
            // プレゼント
            } else if (savedata[x][y].type === ObjectBase.OBJECT_TYPE.PRESENTBOX) {
              this.cells[x][y].object = PresentboxBase.getInstance(savedata[x][y]);
              this.cells[x][y].draw();
            }
          }
        }
      }
      // 次の列
      this.nextField = [];
      for (y = k = 0, ref2 = this.CELL_Y; (0 <= ref2 ? k < ref2 : k > ref2); y = 0 <= ref2 ? ++k : --k) {
        this.nextField[y] = null;
      }
      // アニメーションスタート
      return this.startCellAnimation();
    }

    // このキャラオブジェクトに該当する仮置きを全削除
    static removeAllTempObject(characterObject) {
      if (characterObject === null) {
        return;
      }
      return $.each(this.cells, function() {
        return $.each(this, function() {
          if (this.tempObject !== null && this.tempObject.isCharacterObject() && this.tempObject.getId() === characterObject.getId()) {
            // 出撃中を解除
            this.tempObject.setInField(false);
            // 仮オブジェクトを削除
            this.tempObject = null;
            // セルの再描画
            return this.draw();
          }
        });
      });
    }

    static removeAllWayStack() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.wayStack = null;
        });
      });
    }

    static removeAllKnockout() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.knockout = null;
        });
      });
    }

    static resetAllMoved() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          if (this.object !== null && (this.object.isCharacterObject() || this.object.isEnemyObject())) {
            this.object.setMoved(false);
          }
          return true;
        });
      });
    }

    static removeAllObject() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.object = null;
        });
      });
    }

    static draw() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.draw();
        });
      });
    }

    static drawMovable() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.drawMovable();
        });
      });
    }

    static drawKnockout() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.drawKnockout();
        });
      });
    }

    static drawFin() {
      return $.each(this.cells, function() {
        return $.each(this, function() {
          return this.drawFin();
        });
      });
    }

    static show() {
      return $(this.divObject).removeClass('no_display');
    }

    static hide() {
      return $(this.divObject).addClass('no_display');
    }

    static startCellAnimation() {
      FieldManager.stopObjectAnimation();
      return FieldManager.cellAnimationTimer = setInterval(() => {
        if (!GameManager.flags.isCellObjectAnimation) {
          return;
        }
        $.each(FieldManager.cells, function() {
          return $.each(this, function() {
            return this.stepObjectAnimation(FieldManager.stepIndex);
          });
        });
        return FieldManager.stepIndex = (FieldManager.stepIndex === 0 ? 1 : 0);
      }, Cell.OBJECT_ANIMATION_MSEC);
    }

    static stopObjectAnimation() {
      if (FieldManager.cellAnimationTimer !== false) {
        return clearInterval(FieldManager.cellAnimationTimer);
      }
    }

    
    // 動ける範囲を描画
    static drawMovableCells(cell, movableMap, isContainMe = false) {
      var body, cond, i, j, len, len1, wayStack, x, y;
      // 自身を含むか
      cond = function(wayStack) {
        var ref, ref1;
        if (isContainMe) {
          return (0 <= (ref = wayStack.length) && ref <= cell.object.getMove());
        } else {
          return (0 < (ref1 = wayStack.length) && ref1 <= cell.object.getMove());
        }
      };
// 移動可能判定
      for (x = i = 0, len = movableMap.length; i < len; x = ++i) {
        body = movableMap[x];
        for (y = j = 0, len1 = body.length; j < len1; y = ++j) {
          wayStack = body[y];
          if (wayStack !== null && cond(wayStack)) {
            FieldManager.cells[x][y].setWayStack(wayStack);
          } else {
            FieldManager.cells[x][y].setWayStack(null);
          }
        }
      }
      return FieldManager.drawMovable();
    }

    static async moveObject(startCell, endCell) {
      var charaObject, finish, nextCell, prevCell, wayStack;
      GameManager.changeControllable(false);
      // 移動しないのですぐ返る
      if (startCell === endCell) {
        return;
      }
      wayStack = endCell.wayStack;
      // 全wayStack削除、再描画
      FieldManager.removeAllWayStack();
      FieldManager.removeAllKnockout();
      FieldManager.drawMovable();
      FieldManager.drawKnockout();
      charaObject = startCell.object;
      finish = (startCell, endCell) => {
        var attackableCell, attackables, i, len;
        GameManager.flags.movePickCell = null;
        GameManager.flags.moveToCell = [startCell, endCell];
        
        // 攻撃できるセル
        attackables = FieldManager.getAttackableCellsByCell(endCell);
        // 攻撃できるセルがないなら終了
        if (attackables.length === 0) {
          GameManager.flags.waitAttackCell = null;
          if (endCell.object === null) {
            console.log(endCell);
          }
          endCell.object.setMoved(true);
          // パネル解放
          if (endCell.object.isCharacterObject()) {
            GameManager.isEnable.leftPanel = true;
            GameManager.isEnable.rightPanel = true;
          }
        } else {
          // あるなら攻撃選択待ちに
          GameManager.flags.waitAttackCell = endCell;
          for (i = 0, len = attackables.length; i < len; i++) {
            attackableCell = attackables[i];
            attackableCell.knockout = endCell;
          }
          FieldManager.drawKnockout();
        }
        // 移動選択を解除
        GameManager.flags.movePickCell = null;
        return endCell.draw();
      };
      prevCell = startCell;
      while (wayStack.length > 0) {
        nextCell = wayStack.shift();
        prevCell.setObject(null);
        nextCell.setObject(charaObject);
        prevCell.draw();
        nextCell.draw();
        await Utl.sleep(FieldManager.MOVE_SPEED);
        prevCell = nextCell;
      }
      return finish(startCell, endCell);
    }

    // 指定したセルにいるオブジェクトから攻撃することができるセルを返す
    static getAttackableCellsByCell(cell) {
      return this.getAttackableCells(cell.object, cell.xIndex, cell.yIndex);
    }

    static getAttackableCells(object, x, y) {
      var body, dist, i, j, len, len1, ref, res, targetCell, targetType, xIndex, yIndex;
      
      // 何もない
      // キャラクター
      // 敵キャラクター 
      targetType = object === null ? [] : object.isCharacterObject() ? [ObjectBase.OBJECT_TYPE.ENEMY] : object.isEnemyObject() ? [ObjectBase.OBJECT_TYPE.CHARACTER] : [];
      // 対象のタイプがないんじゃ攻撃対象もない
      if (targetType.length <= 0) {
        return [];
      }
      res = [];
      ref = this.cells;
      for (xIndex = i = 0, len = ref.length; i < len; xIndex = ++i) {
        body = ref[xIndex];
        for (yIndex = j = 0, len1 = body.length; j < len1; yIndex = ++j) {
          targetCell = body[yIndex];
          dist = Math.abs(x - targetCell.xIndex) + Math.abs(y - targetCell.yIndex);
          // 攻撃可能
          if (dist <= object.getRange()) {
            // ターゲットである
            if (targetCell.object !== null && Utl.inArray(targetCell.object.getObjectType(), targetType)) {
              res.push(targetCell);
            }
          }
        }
      }
      return res;
    }

    static getMovableMap(cell) {
      var allCellChecked, body, i, j, k, len, len1, len2, loopCount, movableMap, ref, ref1, ref2, wayStack, x, xPlus, y, yPlus;
      movableMap = Utl.array2dFill(this.CELL_X, this.CELL_Y, null);
      movableMap[cell.xIndex][cell.yIndex] = [];
      // セルの数以上の移動距離はありえないので上限を設定
      loopCount = 0;
      while (!allCellChecked && (loopCount <= this.CELL_X * this.CELL_Y)) {
        loopCount++;
        //Utl.dumpNumArray2d movableMap
        allCellChecked = true;
        for (x = i = 0, len = movableMap.length; i < len; x = ++i) {
          body = movableMap[x];
          for (y = j = 0, len1 = body.length; j < len1; y = ++j) {
            wayStack = body[y];
            // まだ未調査のマス
            if (wayStack === null) {
              // 進入不可でないなら、未調査であっては終われない
              if (this.cells[x][y].isEnterable()) {
                allCellChecked = false;
              }
            } else {
              ref = [[-1, 0], [1, 0], [0, -1], [0, 1]];
              // 調査済みのマス
              for (k = 0, len2 = ref.length; k < len2; k++) {
                [xPlus, yPlus] = ref[k];
                if (!((0 <= (ref1 = x + xPlus) && ref1 < this.cells.length))) {
                  // 調査する
                  continue;
                }
                if (!((0 <= (ref2 = y + yPlus) && ref2 < this.cells[0].length))) {
                  continue;
                }
                if (FieldManager.cells[x + xPlus][y + yPlus].isEnterable() && (movableMap[x + xPlus][y + yPlus] === null || wayStack.length + 1 < movableMap[x + xPlus][y + yPlus].length)) {
                  movableMap[x + xPlus][y + yPlus] = wayStack.concat([this.cells[x + xPlus][y + yPlus]]);
                }
              }
            }
          }
        }
      }
      return movableMap;
    }

    static async randomEnemyAppear() {
      var c, cnt, enemyAmount, i, j, putEnemy, ref, targetCells;
      // 一時的にアニメーションしないようにする
      GameManager.flags.isCellObjectAnimation = false;
      enemyAmount = Utl.gacha([[0, 50], [1, 500], [2, 400], [3, 30], [4, 10], [5, 10], [6, 10]]);
      putEnemy = (enemyObject) => {
        var cell, emptyCells, i, j, len, ref, ref1, ref2, targetCell, x;
        if (enemyObject === null) {
          return false;
        }
        // 空いてるセルを探す
        emptyCells = [];
        for (x = i = ref = this.cells.length - this.ENEMY_APPEAR_WIDTH, ref1 = this.cells.length; (ref <= ref1 ? i < ref1 : i > ref1); x = ref <= ref1 ? ++i : --i) {
          ref2 = this.cells[x];
          for (j = 0, len = ref2.length; j < len; j++) {
            cell = ref2[j];
            if (cell.object === null) {
              emptyCells.push(cell);
            }
          }
        }
        if (emptyCells.length <= 0) {
          return false;
        }
        targetCell = Utl.shuffle(emptyCells).pop();
        targetCell.setObject(enemyObject);
        return targetCell;
      };
      targetCells = [];
      for (cnt = i = 0, ref = enemyAmount; (0 <= ref ? i < ref : i > ref); cnt = 0 <= ref ? ++i : --i) {
        c = putEnemy(GameManager.getEnemyObject());
        if (c !== false) {
          targetCells.push(c);
        }
      }
      // 敵が出たならアニメーション待ち
      if (targetCells.length > 0) {
        for (cnt = j = 0; j < 5; cnt = ++j) {
          $.each(targetCells, function() {
            return this.hideObject();
          });
          await Utl.sleep(50);
          $.each(targetCells, function() {
            return this.showObject();
          });
          await Utl.sleep(50);
        }
      }
      // アニメーション復活
      Utl.sleep(100);
      GameManager.flags.isCellObjectAnimation = true;
      return true;
    }

    // 全キャラを見ていって、やられていたら台詞を言わせながら戻す
    static async checkDeath() {
      var body, c, i, len, noExistDeath, ref, results;
      noExistDeath = true;
      ref = FieldManager.cells;
      results = [];
      for (i = 0, len = ref.length; i < len; i++) {
        body = ref[i];
        results.push((await (async function() {
          var j, len1, results1;
          results1 = [];
          for (j = 0, len1 = body.length; j < len1; j++) {
            c = body[j];
            // 死んでる
            if (c.object !== null && c.object.getHp() <= 0) {
              // 死んでるのがキャラクターなら
              if (c.object.isCharacterObject()) {
                await c.showPopover(c.object.getTextOnDeath(), 2000);
                // 復帰待ちにする
                c.object.death();
              // 死んでるのが敵キャラなら
              } else if (c.object.isEnemyObject()) {
                // 敵が死んだなら経験値加算
                EnvManager.increaseExp(c.object.getExp());
                // アイテム入手判定
                await c.object.dropItem();
              // 死んでるのが宝箱なら
              } else if (c.object.isPresentboxObject()) {
                // アイテム入手判定
                await c.object.dropItem();
              }
              // オブジェクト消す
              c.object = null;
              // 再描画
              c.draw();
              // 別のキャラを走査
              results1.push(this.checkDeath());
            } else {
              results1.push(void 0);
            }
          }
          return results1;
        }).call(FieldManager)));
      }
      return results;
    }

    // 次の列を生成する
    static generateNextField() {
      var GACHA_ORDER, PRESENT_ORDER, cell, i, nextField, ref, yIndex;
      GACHA_ORDER = [
        [
          'ENEMY',
          20 // ランダムな敵
        ],
        [
          'PRESENT',
          5 // プレゼント
        ],
        [
          'EMPTY',
          60 // 空っぽ
        ]
      ];
      PRESENT_ORDER = [[PresentboxN, 100000], [PresentboxR, 10000], [PresentboxSR, 1000], [PresentboxSRp, 100], [PresentboxSSR, 10], [PresentboxSSRp, 1]];
      nextField = [];
      for (yIndex = i = 0, ref = this.CELL_Y; (0 <= ref ? i < ref : i > ref); yIndex = 0 <= ref ? ++i : --i) {
        cell = new Cell(this.divObject, this.CELL_X, yIndex, this.BORDER_SIZE);
        switch (Utl.gacha(GACHA_ORDER)) {
          case 'ENEMY':
            cell.object = GameManager.getEnemyObject(EnvManager.getFloor() + 1);
            break;
          case 'PRESENT':
            cell.object = new (Utl.gacha(PRESENT_ORDER))({
              level: EnvManager.getFloor() + 1
            });
            break;
          case 'EMPTY':
        }
        nextField.push(cell);
        cell.draw();
      }
      return nextField;
    }

    // プレゼントの受け取りターンを1減少させ、0になったら消す
    static async turnPresents() {
      var c, cnt, i, j, k, l, len, len1, len2, len3, len4, m, n, results, targetCells;
      targetCells = [];
      $.each(this.cells, function() {
        return $.each(this, function() {
          if (this.object !== null && this.object.isPresentboxObject()) {
            if (this.object.decreaseTurn()) {
              targetCells.push(this);
            }
            return this.draw();
          }
        });
      });
      if (targetCells.length > 0) {
        for (i = 0, len = targetCells.length; i < len; i++) {
          c = targetCells[i];
          c.hideObject();
        }
        for (cnt = j = 0; j < 5; cnt = ++j) {
          await Utl.sleep(100);
          for (k = 0, len1 = targetCells.length; k < len1; k++) {
            c = targetCells[k];
            c.showObject();
          }
          await Utl.sleep(50);
          for (l = 0, len2 = targetCells.length; l < len2; l++) {
            c = targetCells[l];
            c.hideObject();
          }
        }
        for (m = 0, len3 = targetCells.length; m < len3; m++) {
          c = targetCells[m];
          c.setObject(null);
        }
        await Utl.sleep(1);
        results = [];
        for (n = 0, len4 = targetCells.length; n < len4; n++) {
          c = targetCells[n];
          results.push(c.showPopover('受取期限を過ぎました', 2000));
        }
        return results;
      }
    }

    // フィールドにいるキャラの合計コストを取得
    static getFieldCost() {
      var i, j, obj, ref, ref1, totalCost, x, y;
      totalCost = 0;
      for (x = i = 0, ref = this.cells.length; (0 <= ref ? i < ref : i > ref); x = 0 <= ref ? ++i : --i) {
        for (y = j = 0, ref1 = this.cells[x].length; (0 <= ref1 ? j < ref1 : j > ref1); y = 0 <= ref1 ? ++j : --j) {
          obj = this.cells[x][y].object;
          if (obj !== null && obj.isCharacterObject()) {
            totalCost += obj.getCost();
          }
        }
      }
      return totalCost;
    }

    // 仮キャラも含めての値を取得
    static getFieldCostContainTemp() {
      var i, j, obj, ref, ref1, tempObj, totalCost, x, y;
      totalCost = 0;
      for (x = i = 0, ref = this.cells.length; (0 <= ref ? i < ref : i > ref); x = 0 <= ref ? ++i : --i) {
        for (y = j = 0, ref1 = this.cells[x].length; (0 <= ref1 ? j < ref1 : j > ref1); y = 0 <= ref1 ? ++j : --j) {
          obj = this.cells[x][y].object;
          tempObj = this.cells[x][y].tempObject;
          if (obj !== null && obj.isCharacterObject()) {
            totalCost += obj.getCost();
          } else if (tempObj !== null && tempObj.isCharacterObject()) {
            totalCost += tempObj.getCost();
          }
        }
      }
      return totalCost;
    }

    // 味方ターン開始時の走査
    static onCharacterTurnStart() {
      var c, cBody, i, len, ref, results, x, y;
      ref = this.cells;
      results = [];
      for (x = i = 0, len = ref.length; i < len; x = ++i) {
        cBody = ref[x];
        results.push((function() {
          var j, len1, results1;
          results1 = [];
          for (y = j = 0, len1 = cBody.length; j < len1; y = ++j) {
            c = cBody[y];
            if (c.object !== null) {
              results1.push(c.object.onCharacterTurnStart(c));
            } else {
              results1.push(void 0);
            }
          }
          return results1;
        })());
      }
      return results;
    }

    // 敵ターン開始時の走査
    static onEnemyTurnStart() {
      var c, cBody, i, len, ref, results, x, y;
      ref = this.cells;
      results = [];
      for (x = i = 0, len = ref.length; i < len; x = ++i) {
        cBody = ref[x];
        results.push((function() {
          var j, len1, results1;
          results1 = [];
          for (y = j = 0, len1 = cBody.length; j < len1; y = ++j) {
            c = cBody[y];
            if (c.object !== null) {
              results1.push(c.object.onEnemyTurnStart(c));
            } else {
              results1.push(void 0);
            }
          }
          return results1;
        })());
      }
      return results;
    }

    // 味方キャラ全員に自然ダメージ
    static turnEndDamage() {
      var c, cBody, i, j, len, len1, ref, x, y;
      ref = this.cells;
      for (x = i = 0, len = ref.length; i < len; x = ++i) {
        cBody = ref[x];
        for (y = j = 0, len1 = cBody.length; j < len1; y = ++j) {
          c = cBody[y];
          if (c.object !== null && c.object.isCharacterObject()) {
            // 階層✕2のダメージ
            c.object.damage(EnvManager.getFloor() * 2);
          }
        }
      }
      return this.draw();
    }

  };

  FieldManager.ID = 'field';

  FieldManager.CELL_X = 18;

  FieldManager.CELL_Y = 8;

  FieldManager.BORDER_SIZE = 1;

  // キャラが移動する時のmsec/マス
  FieldManager.MOVE_SPEED = 50;

  // 敵が湧くのは右から何マスか
  FieldManager.ENEMY_APPEAR_WIDTH = 5;

  FieldManager.divObject = null;

  FieldManager.cells = [];

  FieldManager.cellAnimationTimer = false;

  FieldManager.stepIndex = 0;

  return FieldManager;

}).call(this);

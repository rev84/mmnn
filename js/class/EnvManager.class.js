// Generated by CoffeeScript 2.2.3
var EnvManager;

EnvManager = (function() {
  class EnvManager {
    static init(parentElement) {
      this.parentElement = parentElement;
      this.lifeObject = $('<div>').attr('id', 'life').appendTo(this.parentElement);
      this.floorObject = $('<div>').attr('id', 'floor').appendTo(this.parentElement);
      this.expObject = $('<div>').attr('id', 'exp').appendTo(this.parentElement);
      this.jewelObject = $('<div>').attr('id', 'jewel').appendTo(this.parentElement);
      // デスペナルティのウインドウ
      this.deathPenaltyWindow = $('#death_penalty_window').on('hidden.bs.modal', this.onCloseDeathPenaltyWindow.bind(this));
      this.deathPenaltyFloor = $('#death_penalty_decrease_floor');
      return this.draw();
    }

    static draw() {
      this.lifeObject.html('&#9829;' + this.life);
      this.expObject.html(this.exp);
      $('<span>').html('EXP').css({
        left: 0,
        height: 60,
        position: 'absolute'
      }).appendTo(this.expObject);
      this.floorObject.html('公演' + this.floor + '日目');
      this.jewelObject.html(this.jewel);
      return $('<img>').attr('src', './img/jewel.png').css({
        left: 0,
        height: 60,
        position: 'absolute'
      }).appendTo(this.jewelObject);
    }

    static increaseExp(amount) {
      if (amount < 1) {
        return false;
      }
      this.exp += amount;
      this.draw();
      return this.exp;
    }

    static decreaseExp(amount) {
      if (amount < 1) {
        return false;
      }
      if (this.exp < amount) {
        return false;
      }
      this.exp -= amount;
      this.draw();
      return this.exp;
    }

    static getExp() {
      return this.exp;
    }

    static setExp(exp) {
      if (exp < 0) {
        return false;
      }
      this.exp = exp;
      this.draw();
      return this.exp;
    }

    static increaseFloor(amount = 1) {
      if (amount < 1) {
        return false;
      }
      this.floor += amount;
      this.draw();
      return this.floor;
    }

    static decreaseFloor(amount) {
      if (amount < 1) {
        return false;
      }
      if (this.floor - amount < 1) {
        return false;
      }
      this.floor -= amount;
      if (this.floor < 1) {
        this.floor = 1;
      }
      this.draw();
      return this.floor;
    }

    static getFloor() {
      return this.floor;
    }

    static setFloor(floor) {
      if (floor < 1) {
        return false;
      }
      this.floor = floor;
      this.draw();
      return this.floor;
    }

    static increaseLife(amount = 1) {
      if (amount < 1) {
        return false;
      }
      this.life += amount;
      this.draw();
      return this.life;
    }

    static decreaseLife(amount = 1) {
      if (amount < 1) {
        return false;
      }
      if (this.life < amount) {
        return false;
      }
      this.life -= amount;
      if (this.life < 0) {
        this.life = 0;
      }
      this.draw();
      return this.life;
    }

    static resetLife() {
      return this.life = this.DEFAULT.lifeMax;
    }

    static getLife() {
      return this.life;
    }

    static setLife(life) {
      if (life < 0) {
        return false;
      }
      this.life = life;
      this.draw();
      return this.life;
    }

    static increaseJewel(amount) {
      if (amount < 1) {
        return false;
      }
      this.jewel += amount;
      this.draw();
      return this.jewel;
    }

    static decreaseJewel(amount) {
      if (amount < 1) {
        return false;
      }
      if (this.jewel < amount) {
        return false;
      }
      this.jewel -= amount;
      if (this.jewel < 0) {
        this.jewel = 0;
      }
      this.draw();
      return this.jewel;
    }

    static getJewel() {
      return this.jewel;
    }

    static setJewel(jewel) {
      if (jewel < 0) {
        return false;
      }
      this.jewel = jewel;
      this.draw();
      return this.jewel;
    }

    // ライフが0になった時の処理
    static async deathPenalty() {
      var cId, cObj, decreaseFloor, i, ref, ref1, t;
      if (this.getLife() > 0) {
        return false;
      }
      await Utl.sleep(2000);
      this.DEATH_PENALTY_CLOSED = false;
      // 戻す日数
      decreaseFloor = Math.ceil(this.getFloor() * 0.1);
      if (100 < decreaseFloor) {
        decreaseFloor = 100;
      }
      if (this.getFloor() - decreaseFloor < 1) {
        decreaseFloor = 0;
      }
      this.deathPenaltyFloor.html(this.getFloor() - decreaseFloor);
      this.deathPenaltyWindow.modal('show');
      this.DEATH_PENALTY_CLOSED = false;
      while (!this.DEATH_PENALTY_CLOSED) {
        await Utl.sleep(1000);
      }
      for (t = i = 0, ref = decreaseFloor; (0 <= ref ? i < ref : i > ref); t = 0 <= ref ? ++i : --i) {
        this.decreaseFloor(1);
        await Utl.sleep(10);
      }
      // 全消去
      FieldManager.removeAllObject();
      FieldManager.removeAllKnockout();
      FieldManager.removeAllWayStack();
      FieldManager.draw();
      ref1 = GameManager.characters;
      // 全キャラ復活
      for (cId in ref1) {
        cObj = ref1[cId];
        cObj.setComebackTurn(0);
        cObj.setInField(false);
        cObj.hp = null;
      }
      // 移動・攻撃・戻るモードを解除
      GameManager.flags.movePickCell = null;
      GameManager.flags.moveToCell = null;
      GameManager.flags.waitAttackCell = null;
      // ライフを復活
      this.resetLife();
      return true;
    }

    static onCloseDeathPenaltyWindow() {
      return this.DEATH_PENALTY_CLOSED = true;
    }

  };

  EnvManager.ID = 'env';

  EnvManager.DEFAULT = {
    exp: 0,
    floor: 1,
    lifeMax: 5,
    life: 5,
    jewel: 0
  };

  EnvManager.exp = 0;

  EnvManager.floor = 0;

  EnvManager.life = 0;

  EnvManager.jewel = 0;

  EnvManager.DEATH_PENALTY_CLOSED = true;

  return EnvManager;

}).call(this);

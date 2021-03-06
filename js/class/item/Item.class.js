// Generated by CoffeeScript 2.2.2
var Item;

Item = class Item {
  constructor(itemId, params) {
    var i, level, ref;
    this.itemId = itemId;
    this.params = params;
    this.amount = [];
    for (level = i = 0, ref = this.params.cost.length; (0 <= ref ? i < ref : i > ref); level = 0 <= ref ? ++i : --i) {
      this.amount[level] = 0;
    }
  }

  serialize() {
    return {
      id: this.itemId,
      amount: this.amount
    };
  }

  getId() {
    return this.itemId;
  }

  // 持ってる数を設定
  setAmount(level, amount) {
    return this.amount[level] = amount;
  }

  getAmount(level) {
    return this.amount[level];
  }

  upgrade(level) {
    var ref;
    if (!((this.getMinLevel() <= level && level <= this.getMaxLevel()))) {
      return false;
    }
    if (!((this.getMinLevel() <= (ref = level + 1) && ref <= this.getMaxLevel()))) {
      return false;
    }
    if (this.decreaseAmount(level) === false) {
      return false;
    }
    return this.increaseAmount(level + 1);
  }

  increaseAmount(level, amount = 1) {
    if (!((this.getMinLevel() <= level && level <= this.getMaxLevel()))) {
      return false;
    }
    if (amount <= 0) {
      return false;
    }
    return this.amount[level] += amount;
  }

  decreaseAmount(level, amount = 1) {
    if (!((this.getMinLevel() <= level && level <= this.getMaxLevel()))) {
      return false;
    }
    if (amount <= 0) {
      return false;
    }
    if (this.getAmount(level) - amount < 0) {
      return false;
    }
    return this.amount[level] -= amount;
  }

  getId() {
    return this.itemId;
  }

  getImage() {
    //'./img/item/'+@getId()+'.png'
    return './img/item/default.png';
  }

  // 名前を取得
  getName() {
    return this.params.name;
  }

  // レベルを含んだ名前を取得
  getNameWithLevel(level) {
    if (this.getMaxLevel() - this.getMinLevel() === 0) {
      return this.getName();
    } else {
      return this.getName() + this.constructor.level2char(level);
    }
  }

  
  // 説明を取得
  getDescription() {
    return this.params.description;
  }

  getExpense(fromLevel, toLevel) {
    if (toLevel - fromLevel !== 1) {
      return false;
    }
    if (!((this.getMinLevel() <= fromLevel && fromLevel <= this.getMaxLevel()))) {
      return false;
    }
    if (!((this.getMinLevel() <= toLevel && toLevel <= this.getMaxLevel()))) {
      return false;
    }
    return this.params.expense[fromLevel];
  }

  getHpFixRate() {
    if (this.params.hpRate === null) {
      return 0;
    } else {
      return this.params.hpRate;
    }
  }

  getAttackFixRate() {
    if (this.params.atkRate === null) {
      return 0;
    } else {
      return this.params.atkRate;
    }
  }

  getPDefRateFixRate() {
    if (this.params.pDefRate === null) {
      return 0;
    } else {
      return this.params.pDefRate;
    }
  }

  getMDefRateFixRate() {
    if (this.params.mDefRate === null) {
      return 0;
    } else {
      return this.params.mDefRate;
    }
  }

  getCostRateFixRate() {
    if (this.params.costRate === null) {
      return 0;
    } else {
      return this.params.costRate;
    }
  }

  getMoveFixPlus() {
    if (this.params.movePlus === null) {
      return 0;
    } else {
      return this.params.movePlus;
    }
  }

  getRangeFixPlus() {
    if (this.params.rangePlus === null) {
      return 0;
    } else {
      return this.params.rangePlus;
    }
  }

  getHitFixPlus() {
    if (this.params.hitPlus === null) {
      return 0;
    } else {
      return this.params.hitPlus;
    }
  }

  getDodgeFixPlus() {
    if (this.params.dodgePlus === null) {
      return 0;
    } else {
      return this.params.dodgePlus;
    }
  }

  getReturnFixPlus() {
    if (this.params.returnPlus === null) {
      return 0;
    } else {
      return this.params.returnPlus;
    }
  }

  // コスト
  getCost(level) {
    return this.params.cost[level];
  }

  // 最低レベル
  getMinLevel() {
    return 0;
  }

  // 最大レベル
  getMaxLevel() {
    return this.params.cost.length - 1;
  }

  // 表示順
  getDisplayOrder() {
    return this.params.displayOrder;
  }

  // ひとつも持ってないか
  isNothing() {
    var am, i, len, ref;
    ref = this.amount;
    for (i = 0, len = ref.length; i < len; i++) {
      am = ref[i];
      if (am !== 0) {
        return false;
      }
    }
    return true;
  }

  // テーブルIDにおける出現確率
  getItemRate(itemTableId) {
    return this.params.itemTable[itemTableId - 1];
  }

  static level2char(level) {
    switch (level + 1) {
      case 1:
        return 'Ⅰ';
      case 2:
        return 'Ⅱ';
      case 3:
        return 'Ⅲ';
      case 4:
        return 'Ⅳ';
      case 5:
        return 'Ⅴ';
    }
  }

};

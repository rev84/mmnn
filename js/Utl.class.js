// Generated by CoffeeScript 2.2.4
var Utl;

Utl = class Utl {
  //###########################################

  // 数値にカンマを入れる

  // @param Number num
  // @return String

  //###########################################
  static numFormat(num) {
    return String(num).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
  }

  //###########################################

  // min <= n <= max の整数乱数を生成

  // @param Number min
  // @param Number max
  // @return String

  //###########################################
  static rand(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  //###########################################

  // length 文字のランダムな文字列を生成

  // @param Number length
  // @return String

  //###########################################
  static genPassword(length = 4) {
    var chars, i, j, ref, res;
    chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    res = '';
    for (i = j = 0, ref = length; (0 <= ref ? j < ref : j > ref); i = 0 <= ref ? ++j : --j) {
      res += chars.substr(this.rand(0, chars.length - 1), 1);
    }
    return res;
  }

  //###########################################

  // アドレスバーを変更

  // @param String url
  // @return String

  //###########################################
  static adrBar(url) {
    return window.history.replaceState('', '', '' + url);
  }

  //###########################################

  // getクエリを取得

  // @return Object

  //###########################################
  static getQuery(key = null, defaultValue = null) {
    var j, k, len, p, params, query, res, v;
    query = document.location.search.substring(1);
    params = query.split('&');
    res = {};
    for (j = 0, len = params.length; j < len; j++) {
      p = params[j];
      [k, v] = p.split('=');
      res[k] = v;
    }
    if (key === null) {
      return res;
    }
    if (res[key] != null) {
      return res[key];
    }
    return defaultValue;
  }

  //###########################################

  // 数値を min <= num < max の範囲で正規化する

  // @param Number num
  // @param Number min
  // @param Number max
  // @return String

  //###########################################
  static normalize(num, min = 0, max = 1) {
    var range;
    range = Math.abs(max - min);
    if (num < min) {
      num += range * Math.ceil(Math.abs(num - min) / range);
    } else if (max <= num) {
      num -= range * (Math.floor(Math.abs(num - max) / range) + 1);
    }
    return num;
  }

  //###########################################

  // 現在秒を取得

  // @return int

  //###########################################
  static time(date = null) {
    if (date === null) {
      date = new Date();
    }
    return Math.floor(+date / 1000);
  }

  //###########################################

  // 現在ミリ秒を取得

  // @return int/float

  //###########################################
  static militime(date = null, getAsFloat = false) {
    if (date === null) {
      date = new Date();
    }
    return +date / (getAsFloat ? 1000 : 1);
  }

  //###########################################

  // 現在日を YYYY-MM-DD で取得

  // @param Date date
  // @param String dateSep 日付のセパレータ
  // @return String

  //###########################################
  static dateStr(date = null, dateSep = '-') {
    if (date === null) {
      date = new Date();
    }
    return '' + this.zerofill(date.getFullYear(), 4) + dateSep + this.zerofill(date.getMonth() + 1, 2) + dateSep + this.zerofill(date.getDate(), 2);
  }

  //###########################################

  // 現在日時を YYYY-MM-DD HH:ii:ssで取得

  // @param Date date
  // @param String dateSep 日付のセパレータ
  // @param String timeSep 時間のセパレータ
  // @param boolean betweenSep 日付と時間の間の文字
  // @return String

  //###########################################
  static datetimeStr(date = null, dateSep = '-', timeSep = ':', betweenSep = ' ') {
    if (date === null) {
      date = new Date();
    }
    return this.dateStr(date, dateSep) + betweenSep + this.zerofill(date.getHours(), 2) + timeSep + this.zerofill(date.getMinutes(), 2) + timeSep + this.zerofill(date.getSeconds(), 2);
  }

  //###########################################

  // baseDate と targetDate の時刻の差を「何分前」のような表記で取得

  // @param Date targetDate 対象となる日時
  // @param Date baseDate 基準となる日時
  // @param unsigned_int nowSec ついさっき表記する上限の秒数
  // @param String agoStr ついさっき表記の文字列
  // @param String secStr 秒の表記
  // @param String minStr 分の表記
  // @param String hourStr 時間の表記
  // @param String dayStr 日の表記
  // @param String monStr 月の表記
  // @param String yearStr 年の表記
  // @return String

  //###########################################
  static difftime(targetDate, baseDate = null, nowSec = 0, nowStr = 'ついさっき', agoStr = '前', secStr = '秒', minStr = '分', hourStr = '時間', dayStr = '日', monStr = '月', yearStr = '年') {
    var baseTime, d, diffTime, h, m, mo, targetTime, y;
    if (baseDate === null) {
      baseTime = this.time();
    }
    targetTime = this.time(targetDate);
    diffTime = baseTime - targetTime;
    if (diffTime < 0) {
      // 未来
      return null;
    }
    if (nowSec >= diffTime) {
      // ついさっきと表示する基準の秒数
      return nowStr;
    }
    // 一年以上
    y = Math.floor(diffTime / (60 * 60 * 24 * 30 * 12));
    if (y > 0) {
      return '' + y + yearStr + agoStr;
    }
    diffTime -= y * (60 * 60 * 24 * 30 * 12);
    // 一ヶ月以上
    mo = Math.floor(diffTime / (60 * 60 * 24 * 30));
    if (mo > 0) {
      return '' + mo + monStr + agoStr;
    }
    diffTime -= mo * (60 * 60 * 24 * 30);
    // 一日以上
    d = Math.floor(diffTime / (60 * 60 * 24));
    if (d > 0) {
      return '' + d + dayStr + agoStr;
    }
    diffTime -= d * (60 * 60 * 24);
    // 一時間以上
    h = Math.floor(diffTime / (60 * 60));
    if (h > 0) {
      return '' + h + hourStr + agoStr;
    }
    diffTime -= h * (60 * 60);
    // 一分以上
    m = Math.floor(diffTime / 60);
    if (m > 0) {
      return '' + m + minStr + agoStr;
    }
    diffTime -= m * 60;
    if (diffTime > 0) {
      // 一秒以上
      return '' + diffTime + secStr + agoStr;
    }
    // ついさっき
    return nowStr;
  }

  //###########################################

  // 数値をゼロ埋めする

  // @param int num
  // @param int digit 桁数
  // @return int

  //###########################################
  static zerofill(num, digit) {
    return ('' + this.repeat('0', digit) + num).slice(-digit);
  }

  //###########################################

  // str を times 回繰り返した文字列を返す

  // @param String str
  // @param int times
  // @return String

  //###########################################
  static repeat(str, times) {
    return Array(1 + times).join(str);
  }

  //###########################################

  // 配列をシャッフル

  // @param Array ary シャッフルする配列
  // @return Array

  //###########################################
  static shuffle(ary) {
    var i, n;
    n = ary.length;
    while (n) {
      n--;
      i = this.rand(0, n);
      [ary[i], ary[n]] = [ary[n], ary[i]];
    }
    return ary;
  }

  //###########################################

  // 配列 ary に needle が存在するかを調べる

  // @param mixed needle 値
  // @param Array ary
  // @return boolean 存在する場合はtrue, そうでないなら false

  //###########################################
  static inArray(needle, ary) {
    var j, len, v;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      if (v === needle) {
        return true;
      }
    }
    return false;
  }

  //###########################################

  // 配列のコピーを返す

  // @param Array ary
  // @return Array

  //###########################################
  static clone(obj) {
    var res;
    res = obj;
    if ($.isArray(obj)) {
      res = $.extend(true, [], obj);
    } else if (obj instanceof Object) {
      res = $.extend(true, {}, obj);
    }
    return res;
  }

  //###########################################

  // 長さ length の配列を val で満たして返す

  // @param int length
  // @param mixed val
  // @return Array

  //###########################################
  static arrayFill(length, val = null) {
    var i, j, ref, res;
    res = [];
    for (i = j = 0, ref = length; (0 <= ref ? j < ref : j > ref); i = 0 <= ref ? ++j : --j) {
      res[i] = this.clone(val);
    }
    return res;
  }

  //###########################################

  // x * y の配列を val で満たして返す

  // @param int x
  // @param int y 省略時は x と同じ長さ
  // @param mixed val
  // @return Array

  //###########################################
  static array2dFill(x, y = null, val = null) {
    var j, l, ref, ref1, res, xx, yAry, yy;
    if (y === null) {
      y = x;
    }
    res = [];
    yAry = [];
    for (yy = j = 0, ref = y; (0 <= ref ? j < ref : j > ref); yy = 0 <= ref ? ++j : --j) {
      yAry[yy] = this.clone(val);
    }
    for (xx = l = 0, ref1 = x; (0 <= ref1 ? l < ref1 : l > ref1); xx = 0 <= ref1 ? ++l : --l) {
      res[xx] = this.clone(yAry);
    }
    return res;
  }

  //###########################################

  // 配列の合計を返す

  // @param Array ary
  // @return Array

  //###########################################
  static arraySum(ary) {
    var j, len, sum, v;
    sum = 0;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      sum += v;
    }
    return sum;
  }

  //###########################################

  // 配列の最小値を返す

  // @param Array ary
  // @return Array

  //###########################################
  static arrayMin(ary) {
    var j, len, min, v;
    min = null;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      if (min === null || min > v) {
        min = v;
      }
    }
    return min;
  }

  //###########################################

  // 配列の最大値を返す

  // @param Array ary
  // @return Array

  //###########################################
  static arrayMax(ary) {
    var j, len, max, v;
    max = null;
    for (j = 0, len = ary.length; j < len; j++) {
      v = ary[j];
      if (max === null || max < v) {
        max = v;
      }
    }
    return max;
  }

  //###########################################

  // 連想配列のキーの数を返す

  // @param Object object
  // @return int

  //###########################################
  static count(object) {
    return Object.keys(object).length;
  }

  //###########################################

  // uuid を生成（バージョン4）

  // @return String

  //###########################################
  static uuid4() {
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
  }

  //###########################################

  // ローカルストレージの値を削除

  // @param String key
  // @param mixed value
  // @return undefined

  //###########################################
  static delLs(key) {
    return localStorage.removeItem(key);
  }

  //###########################################

  // ローカルストレージに値を設定

  // @param String key
  // @param mixed value
  // @return undefined

  //###########################################
  static setLs(key, value = null) {
    var json;
    if (value === null) {
      // null は削除
      return this.delLs(key);
    }
    json = JSON.stringify(value);
    return localStorage.setItem(key, json);
  }

  //###########################################

  // ローカルストレージから値を取得

  // @param String key
  // @return undefined

  //###########################################
  static getLs(key) {
    var res;
    res = localStorage.getItem(key);
    try {
      res = JSON.parse(res);
    } catch (error) {
      res = null;
    }
    return res;
  }

  //###########################################

  // 現環境でホイールイベント名を取得

  // @return String

  //###########################################
  static getOnWheel() {
    if ('onwheel' in document) {
      return 'wheel';
    }
    if ('onmousewheel' in document) {
      return 'mousewheel';
    }
    return 'DOMMouseScroll';
  }

  //###########################################

  // マウスイベントから要素内座標を取得

  // @param eventObject e
  // @return Array [x, y]

  //###########################################
  static e2localPos(e) {
    var boundingClientRect;
    boundingClientRect = e.currentTarget.getBoundingClientRect();
    //[e.clientX - boundingClientRect.left, boundingClientRect.height - (e.clientY - boundingClientRect.top)]
    return [e.clientX - boundingClientRect.left, e.clientY - boundingClientRect.top];
  }

  static dumpNumArray2d(ary) {
    var j, l, ref, ref1, res, x, y;
    res = '';
    for (y = j = 0, ref = ary[0].length; (0 <= ref ? j < ref : j > ref); y = 0 <= ref ? ++j : --j) {
      for (x = l = 0, ref1 = ary.length; (0 <= ref1 ? l < ref1 : l > ref1); x = 0 <= ref1 ? ++l : --l) {
        if (ary[x][y] === null) {
          res += '-';
        } else if (ary[x][y] === 10) {
          res += 'A';
        } else if (ary[x][y] === 11) {
          res += 'B';
        } else if (ary[x][y] === 12) {
          res += 'C';
        } else if (ary[x][y] === 13) {
          res += 'D';
        } else if (ary[x][y] === 14) {
          res += 'E';
        } else if (ary[x][y] === 15) {
          res += 'F';
        } else if (ary[x][y] === 16) {
          res += 'G';
        } else if (ary[x][y] === 17) {
          res += 'H';
        } else {
          res += '' + ary[x][y];
        }
      }
      res += "\n";
    }
    return console.log(res);
  }

  static gacha(map) {
    var j, l, len, len1, p, pTotal, seed, target;
    if (map.length <= 0) {
      return false;
    }
    pTotal = 0;
    for (j = 0, len = map.length; j < len; j++) {
      [target, p] = map[j];
      pTotal += p;
    }
    if (pTotal <= 0) {
      return false;
    }
    seed = Utl.rand(1, pTotal);
    pTotal = 0;
    for (l = 0, len1 = map.length; l < len1; l++) {
      [target, p] = map[l];
      pTotal += p;
      if (seed <= pTotal) {
        return target;
      }
    }
    return map[map.legnth - 1][0];
  }

  static sleep(msec) {
    return new Promise((resolve, reject) => {
      return setTimeout(() => {
        return resolve();
      }, msec);
    });
  }

  static base64encode(string) {
    return btoa(unescape(encodeURIComponent(string)));
  }

  static base64decode(string) {
    return decodeURIComponent(escape(atob(string)));
  }

};

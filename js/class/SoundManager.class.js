// Generated by CoffeeScript 2.2.4
var SoundManager;

SoundManager = (function() {
  class SoundManager {
    static init(savedata) {
      var cnt, filename, key, ref, results;
      if (savedata !== null) {
        this.volume = savedata.volume;
      } else {
        this.volume = this.MAX_VOLUME;
      }
      ref = this.FILENAMES;
      results = [];
      for (key in ref) {
        filename = ref[key];
        this.audios[key] = [];
        results.push((function() {
          var i, ref1, results1;
          results1 = [];
          for (cnt = i = 0, ref1 = this.OBJECT_COUNT; (0 <= ref1 ? i < ref1 : i > ref1); cnt = 0 <= ref1 ? ++i : --i) {
            results1.push(this.audios[key].push(this.getAudio(filename)));
          }
          return results1;
        }).call(this));
      }
      return results;
    }

    static getAudio(filename) {
      return new Audio('./sound/' + filename);
    }

    static serialize() {
      return {
        volume: this.volume
      };
    }

    static play(key) {
      var audio;
      audio = this.audios[key].shift();
      audio.volume = this.volume;
      audio.play();
      return this.audios[key].push(this.getAudio(this.FILENAMES[key]));
    }

  };

  SoundManager.FILENAMES = {
    cell_hover: 'button66.mp3',
    levelup: 'powerup02.wav',
    change_mode: 'decision-7.mp3'
  };

  SoundManager.MAX_VOLUME = 0.3;

  SoundManager.OBJECT_COUNT = 10;

  SoundManager.volume = 0;

  SoundManager.audios = {};

  return SoundManager;

}).call(this);
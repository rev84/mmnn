class SoundManager
  @FILENAMES:
    cell_hover: 'button66.mp3'
    levelup: 'powerup02.wav'
    change_mode: 'decision-7.mp3'

  @MAX_VOLUME: 0.3
  @OBJECT_COUNT: 10

  @volume: 0
  @audios:{}

  @init:(savedata)->
    if savedata isnt null
      @volume = savedata.volume
    else
      @volume = @MAX_VOLUME

    for key, filename of @FILENAMES
      @audios[key] = []
      @audios[key].push @getAudio(filename) for cnt in [0...@OBJECT_COUNT]


  @getAudio:(filename)->
    new Audio('./sound/'+filename)

  @serialize:->
    {
      volume: @volume
    }

  @play:(key)->
    audio = @audios[key].shift()
    audio.volume = @volume
    audio.play()
    @audios[key].push @getAudio(@FILENAMES[key])


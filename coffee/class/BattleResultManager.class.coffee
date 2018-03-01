class BattleResultManager
  @ID: 'battle_result'

  # アニメーションまで待つ時間
  @ANIMATION_WAIT_BEFORE_MSEC: 1000
  # HPが減る時間
  @ANIMATION_DECREASE_MSEC: 1000
  # HPが減るFPS
  @ANIMATION_DECREASE_FPS = 30
  # アニメーション終わってから待つ時間
  @ANIMATION_WAIT_AFTER_MSEC: 1000

  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).addClass('no_display')

    @progress = $('<div>').addClass('progress')
                .appendTo(@divObject)
    @progressBar = $('<div>').addClass('progress-bar')
                   .attr('role', 'progressbar')
                   .appendTo(@progress)
    @character = $('<div>').addClass('character')
                 .appendTo(@divObject)
    @characterType = $('<div>').addClass('character_type')
                 .appendTo(@divObject)
    @enemy     = $('<div>').addClass('enemy')
                 .appendTo(@divObject)
    @enemyType = $('<div>').addClass('enemy_type')
                 .appendTo(@divObject)

    @divObject.appendTo(@parentElement)
    #@divObject.removeClass('no_display')

  # HPを減らす演出
  @animate:(characterObject, enemyObject, isCharacterOffence, hpMax, hpBase, hpTo)->
    characterTypeImg = 
      if characterObject.getAttackType() is ObjectBase.ATTACK_TYPE.PHYSIC and isCharacterOffence
        './img/sword.png'
      else if characterObject.getAttackType() is ObjectBase.ATTACK_TYPE.MAGIC and isCharacterOffence
        './img/magic.png'
      else if characterObject.getAttackType() is ObjectBase.ATTACK_TYPE.PHYSIC and !isCharacterOffence
        './img/shield.png'
      else
        './img/resist.png'
    enemyTypeImg = 
      if enemyObject.getAttackType() is ObjectBase.ATTACK_TYPE.PHYSIC and !isCharacterOffence
        './img/sword.png'
      else if enemyObject.getAttackType() is ObjectBase.ATTACK_TYPE.MAGIC and !isCharacterOffence
        './img/magic.png'
      else if enemyObject.getAttackType() is ObjectBase.ATTACK_TYPE.PHYSIC and isCharacterOffence
        './img/shield.png'
      else
        './img/resist.png'
    @character.css('background-image', 'url('+characterObject.getBaseImage()+')')
    @characterType.css('background-image', 'url('+characterTypeImg+')')
    @enemy.css('background-image', 'url('+enemyObject.getBaseImage()+')')
    @enemyType.css('background-image', 'url('+enemyTypeImg+')')

    @setRate(hpBase / hpMax)

    @divObject.removeClass 'no_display'

    # 規定秒待つ
    await Utl.sleep @ANIMATION_WAIT_BEFORE_MSEC

    restTime = Math.ceil(@ANIMATION_DECREASE_MSEC / @ANIMATION_DECREASE_FPS)
    nowRate = hpBase / hpMax
    decreaseRate = (nowRate - (hpTo / hpMax)) / restTime

    decrease = (restTime, nowRate, decreaseRate)=>
      nowRate -= decreaseRate
      restTime--
      @setRate nowRate
      if restTime > 0
        decrease restTime, nowRate, decreaseRate
        await Utl.sleep(1 / @ANIMATION_DECREASE_FPS)
      else
        @divObject.addClass 'no_display'
        await Utl.sleep @ANIMATION_WAIT_AFTER_MSEC
    await decrease restTime, nowRate, decreaseRate

  @setRate:(rate)->
    rate = 1 if rate > 1
    rate = 0 if rate < 0
    @progressBar.css('width', ''+rate*100+'%')
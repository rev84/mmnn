class ExpManager
  @expAmount = 5

  @init:(@gameElement, @xPos, @yPos)->

  @increaseExp:(amount)->
    @expAmount += amount
    @expAmount

  @decreaseExp:(amount)->
    return false if @expAmount < amount
    @expAmount -= amount
    @expAmount

  @get:->
    @expAmount

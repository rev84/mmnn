class ExpManager
  @expAmount = 99990

  @init:(@gameElement, @xPos, @yPos)->

  @plusExp:(amount)->
    @expAmount += amount

  @get:->
    @expAmount

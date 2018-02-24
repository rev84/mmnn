class ExpManager
  @expAmount = 0

  @init:(@gameElement, @xPos, @yPos)->

  @plusExp:(amount)->
    @expAmount += amount

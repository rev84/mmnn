class CostManager
  @ID: 'cost_manager'
  # 最初からあるコスト
  @DEFAULT: 8

  @init:(@parentElement)->
    @divObject = $('<div>').attr('id', @ID).appendTo(@parentElement)

    @now = $('<span>').addClass('cost_now').appendTo(@divObject)
    @max = $('<span>').addClass('cost_max').appendTo(@divObject)

    @updateCostNow()

  @draw:->
    @setMax @getCostMax()
    @setNow @getCostNow()

  @setNow:(v)->
    @now.html(v)

  @setMax:(v)->
    @max.html(v)

  @getCostMax:->
    @DEFAULT + EnvManager.getFloor() * 2

  @getCostNow:->
    @costNow

  @updateCostNow:->
    @costNow = FieldManager.getFieldCostContainTemp()
    @draw()
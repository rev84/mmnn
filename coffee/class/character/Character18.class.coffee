# イヴ・サンタクロース
class Character18 extends Character18Base
  constructor:(params)->
    super(params)

  # プレゼントに対して攻撃力2倍
  onAttackDamage:(myCell, opCell, damage)->
    opObj = opCell.object
    
    if opObj isnt null and opObj.isPresentboxObject()
      await myCell.showPopover 'プレゼントだ！', @constructor.POPOVER_MSEC
      damage * 2
    else
      damage

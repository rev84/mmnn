class ObjectBase
  @OBJECT_TYPE:
    CHARACTER : 'CHARACTER'
    ENEMY : 'ENEMY'

  constructor:(objectType)->
    @objectType = objectType
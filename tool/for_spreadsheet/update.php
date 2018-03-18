<?php

require_once dirname(__FILE__).'/SpreadsheetClient.php';

define('SPREAD_SHEET_ID', '1QtuXjepseAXTZ27y4lLrMs_DJHbjUTutheaTVeezUMs');

updateCharacter();
updateEnemy();
updateItem();
updateUnit();

function updateUnit()
{
  $c = SpreadsheetClient::getClient();

  $service = new Google_Service_Sheets($c);

  # キャラクターIDを取得
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'キャラ設定!A3:C');
  $values = $response->getValues();
  $name2id = [];
  foreach ($values as $vAry) {
    list($id, $_, $name) = $vAry;
    $name = mb_convert_encoding($name, 'UTF-8');
    $name2id[$name] = (int)$id;
  }

  # ユニットを取得
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'ユニット効果!A2:J');
  $values = $response->getValues();
  $errors = [];
  $units = [];
  foreach ($values as $vAry) {
    list($name, $hp, $atk, $pdef, $mdef, $hit, $dodge, $move, $range, $member) = $vAry;
    $name = mb_convert_encoding($name, 'UTF-8');
    $member = mb_convert_encoding($member, 'UTF-8');
    $members = explode('、', $member);
    var_dump($members);
    $ids = [];
    foreach ($members as $m) {
      if (!array_key_exists($m, $name2id)) {
        $errors[] = '「'.$name.'」の「'.$m.'」がいません';
      }
      $ids[] = $name2id[$m];
    }
    
    $units[] = [
      'name' => $name,
      'id' => $ids,
      'fix' => [
        'hp' => $hp == '' ? null : (float)$hp,
        'atk' => $atk == '' ? null : (float)$atk,
        'pdef'   => $pdef == '' ? null : (float)$pdef,
        'mdef' => $mdef == '' ? null : (float)$mdef,
        'hit' => $hit == '' ? null : (int)$hit,
        'dodge' => $dodge == '' ? null : (int)$dodge,
        'move' => $move == '' ? null : (int)$move,
        'range' => $range == '' ? null : (int)$range,
      ],
    ];
  }

  file_put_contents(dirname(__FILE__).'/../../coffee/class/character/UnitList.coffee', 'window.UnitList = '.json_encode($units).';');
  file_put_contents(dirname(__FILE__).'/errors.txt', join("\n", $errors));
}


function updateItem()
{
  $c = SpreadsheetClient::getClient();

  $service = new Google_Service_Sheets($c);

  $script = '';

  # キャラクター
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'アイテム設定!A3:AE');
  $values = $response->getValues();
  $items = [];
  foreach ($values as $vAry) {
    list($itemId, $displayOrder, $name, $description, $cost1, $cost2, $cost3, $cost4, $cost5, $expense2, $expense3, $expense4, $expense5, $hpRate, $atkRate, $pDefRate, $mDefRate, $costRate, $movePlus, $rangePlus, $hitPlus, $dodgePlus, $returnPlus,
      $itemTableN, $itemTableR, $itemTableSR, $itemTableSSR, 
      $itemTableGacha,
      $itemTable1 
    ) = array_merge($vAry, array_fill(0, 100, null));

    $imgFile = './img/item/'.$itemId.'.png';

    $items[$itemId] = [
      'displayOrder' => (int)$displayOrder,
      'name' => $name,
      'description' => $description,
      'cost' => [
        (int)$cost1,(int)$cost2,(int)$cost3,(int)$cost4,(int)$cost5,
      ],
      'expense' => [
        (int)$expense2, (int)$expense3, (int)$expense4, (int)$expense5,
      ],
      'hpRate' => ($hpRate == '' ? null : (float)$hpRate),
      'atkRate' => ($atkRate == '' ? null : (float)$atkRate),
      'pDefRate' => ($pDefRate == '' ? null : (float)$pDefRate),
      'mDefRate' => ($mDefRate == '' ? null : (float)$mDefRate),
      'costRate' => ($costRate == '' ? null : (float)$costRate),
      'movePlus' => ($movePlus == '' ? null : (int)$movePlus),
      'rangePlus' => ($rangePlus == '' ? null : (int)$rangePlus),
      'hitPlus' => ($hitPlus == '' ? null : (int)$hitPlus),
      'dodgePlus' => ($dodgePlus == '' ? null : (int)$dodgePlus),
      'returnPlus' => ($returnPlus == '' ? null : (int)$returnPlus),
      'itemTable' => [
        ($itemTableN == '' ? null : (float)$itemTableN),
        ($itemTableR == '' ? null : (float)$itemTableR),
        ($itemTableSR == '' ? null : (float)$itemTableSR),
        ($itemTableSSR == '' ? null : (float)$itemTableSSR),
        ($itemTableGacha == '' ? null : (float)$itemTableGacha),
        ($itemTable1 == '' ? null : (float)$itemTable1),
      ],
    ];
  }

  file_put_contents(dirname(__FILE__).'/../../coffee/class/item/ItemList.coffee', 'window.ItemList = '.json_encode($items).';');
}

function updateEnemy()
{
  // 既存キャラを消す
  $targetDir = dirname(__FILE__).'/../../coffee/class/enemy';
  $list = getFilelist($targetDir);
  foreach ($list as $file) {
    if (in_array($file, [
      '000_EnemyBase.class.coffee'
    ])) continue;
    $path = $targetDir.'/'.$file;
    unlink($path);
  }


  $c = SpreadsheetClient::getClient();

  $service = new Google_Service_Sheets($c);

  $script = '';
  $characterList = <<<EOM
window.EnemyList = {

EOM;

  $id2Class = [];

  # キャラクター
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, '敵キャラ設定!A3:S');
  $values = $response->getValues();
  foreach ($values as $vAry) {
    list($characterId, $className, $characterName, $hpBase, $attackTypeBase, $attackBase, $pDefBase, $mDefBase, $moveBase, $rangeBase, $hitRateBase, $dodgeRateBase, $abilityName, $abilityDesc, $appearance, $expRate, $itemRate, $itemTableId, $itemJewelAmount) = $vAry;

    $itemTableId = getItemTableId($itemTableId);

    $attackTypeBase = ($attackTypeBase == '物理' ? 'ObjectBase.ATTACK_TYPE.PHYSIC' : 'ObjectBase.ATTACK_TYPE.MAGIC');

    $targetImgDir = dirname(__FILE__).'/../../img/enemy/'.$characterId;
    $files = getFilelist($targetImgDir);
    sort($files);
    for ($index = 0; $index < count($files); $index++) {
      $files[$index] = '"./img/enemy/'.$characterId.'/'.$files[$index].'"';
    }
    $filelist = join(',', $files);

    $id2Class[$characterId] = $className;

    $characterList .= '  "'.$characterId.'" : '.$className."\n";

    $script .= <<<EOM
class {$className}Base extends EnemyBase
  # ID
  @characterId = {$characterId}
  # キャラ名
  @characterName = "{$characterName}"
  # 画像のリスト
  @images = [{$filelist}]
  # 基本攻撃タイプ
  @attackTypeBase = {$attackTypeBase}
  # 成長率：攻撃力
  @attackBase = {$attackBase}
  # 成長率：HP
  @hpBase = {$hpBase}
  # 成長率：物理防御
  @pDefBase = {$pDefBase}
  # 成長率：魔法防御
  @mDefBase = {$mDefBase}
  # 基本移動力
  @moveBase = {$moveBase}
  # 基本射程
  @rangeBase = {$rangeBase}
  # 基本命中率
  @hitRateBase = {$hitRateBase}
  # 基本回避率
  @dodgeRateBase = {$dodgeRateBase}
  # 出現階層
  @appearance = {$appearance}
  # 経験値係数
  @expRate = {$expRate}
  # アイテムを落とす確率
  @itemRate = {$itemRate}
  # アイテムのドロップテーブルID
  @itemTableId = {$itemTableId}
  # アイテムがジュエルになる時の額
  @itemJewelAmount = {$itemJewelAmount}

  @abilityName = "{$abilityName}"
  @abilityDesc = "{$abilityDesc}"

  constructor:(params)->
    super(params)

EOM;
    
    $filename = dirname(__FILE__).'/../../coffee/class/enemy/'.$className.'.class.coffee';
    if (!file_exists($filename)) {
      $buf = <<<EOM
# {$characterName}
class {$className} extends {$className}Base
  constructor:(params)->
    super(params)

EOM;
      file_put_contents($filename, $buf);
    }
  }

  $characterList .= '}';
  file_put_contents(dirname(__FILE__).'/../../coffee/class/enemy/ZZZ_EnemyList.coffee', $characterList);

  file_put_contents(dirname(__FILE__).'/../../coffee/class/enemy/001_EnemyBaseAll.class.coffee', $script);

  $json = '';
  foreach ($id2Class as $key => $val) {
    $json .= '      "'.$key.'" : '.$val."\n";
  }
  $script = <<<EOM
class EnemyDefine
  @getClasses:->
    {
{$json}
    }
EOM;
  file_put_contents(dirname(__FILE__).'/../../coffee/class/enemy/002_EnemyDefine.class.coffee', $script);

}



function updateCharacter()
{
  // 既存キャラを消す
  $targetDir = dirname(__FILE__).'/../../coffee/class/character';
  $list = getFilelist($targetDir);
  foreach ($list as $file) {
    if (in_array($file, [
      '000_CharacterBase.class.coffee'
    ])) continue;
    if (preg_match('`Character\d+\.class\.coffee$`', $file)) continue;
    $path = $targetDir.'/'.$file;
    unlink($path);
  }


  $c = SpreadsheetClient::getClient();

  $service = new Google_Service_Sheets($c);

  $script = '';
  $characterList = <<<EOM
window.CharacterList = {

EOM;

  # キャラクター
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'キャラ設定!A3:T');
  $values = $response->getValues();
  foreach ($values as $vAry) {
    list($characterId, $className, $characterName, $hpBase, $attackTypeBase, $attackBase, $pDefBase, $mDefBase, $moveBase, $rangeBase, $hitRateBase, $dodgeRateBase, $itemStart, $itemEnd, $cost, $expRate, $abilityName, $abilityDesc, $defaultJoin, $textDeath) = $vAry;
    $defaultJoin = $defaultJoin == '' ? 'false' : 'true';

    $attackTypeBase = ($attackTypeBase == '物理' ? 'ObjectBase.ATTACK_TYPE.PHYSIC' : 'ObjectBase.ATTACK_TYPE.MAGIC');

    $targetImgDir = dirname(__FILE__).'/../../img/character/'.$characterId;
    $files = getFilelist($targetImgDir);
    sort($files);
    for ($index = 0; $index < count($files); $index++) {
      $files[$index] = '"./img/character/'.$characterId.'/'.$files[$index].'"';
    }
    $filelist = join(',', $files);

    $characterList .= '  "'.$characterId.'" : '.$className."\n";

    $script .= <<<EOM
class {$className}Base extends CharacterBase
  # ID
  @characterId = {$characterId}
  # キャラ名
  @characterName = "{$characterName}"
  # 最初からいるか
  @defaultJoin = {$defaultJoin}
  # 画像のリスト
  @images = [{$filelist}]
  # 基本攻撃タイプ
  @attackTypeBase = {$attackTypeBase}
  # 成長率：攻撃力
  @attackBase = {$attackBase}
  # 成長率：HP
  @hpBase = {$hpBase}
  # 成長率：物理防御
  @pDefBase = {$pDefBase}
  # 成長率：魔法防御
  @mDefBase = {$mDefBase}
  # 基本移動力
  @moveBase = {$moveBase}
  # 基本射程
  @rangeBase = {$rangeBase}
  # 基本命中率
  @hitRateBase = {$hitRateBase}
  # 基本回避率
  @dodgeRateBase = {$dodgeRateBase}
  # アイテム装備可能数（開始時）
  @itemCapacityStart = {$itemStart}
  # アイテム装備可能数（限界）
  @itemCapacityLimit = {$itemEnd}
  # コスト
  @costBase = {$cost}
  # 必要経験値
  @expRate = {$expRate}
  # 死んだ時の台詞
  @textDeath = "{$textDeath}"

  @abilityName = "{$abilityName}"
  @abilityDesc = "{$abilityDesc}"

  constructor:(params)->
    super(params)

EOM;
    
    $filename = dirname(__FILE__).'/../../coffee/class/character/'.$className.'.class.coffee';
    if (!file_exists($filename)) {
      $buf = <<<EOM
# {$characterName}
class {$className} extends {$className}Base
  constructor:(params)->
    super(params)

EOM;
      file_put_contents($filename, $buf);
    }
  }

  $characterList .= '}';
  file_put_contents(dirname(__FILE__).'/../../coffee/class/character/ZZZ_CharacterList.coffee', $characterList);

  file_put_contents(dirname(__FILE__).'/../../coffee/class/character/001_CharacterBaseAll.class.coffee', $script);

}


function getFilelist($dir){
  if($handle = opendir($dir)){
    $files = [];
    while(false !== ($entry = readdir($handle))){
      if(($entry != '.' && $entry != '..') && !is_dir($entry)){
        $files[] = $entry;
      }
    }
    
    return $files;
  }
  
  return [];
}

function getItemTableId($itemId)
{
  switch ($itemId) {
    case 'プN':
      return 1;
    case 'プR':
      return 2;
    case 'プSR':
      return 3;
    case 'プSSR':
      return 4;
    case 'ガチャ':
      return 5;
    default:
      return 6+(int)$itemId;
  }
}
<?php

require_once dirname(__FILE__).'/SpreadsheetClient.php';

define('SPREAD_SHEET_ID', '1QtuXjepseAXTZ27y4lLrMs_DJHbjUTutheaTVeezUMs');

updateCharacter();

function updateCharacter()
{
  $c = SpreadsheetClient::getClient();

  $service = new Google_Service_Sheets($c);

  $script = '';
  $characterList = <<<EOM
window.CharacterList = {

EOM;

  # キャラクター
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'キャラ設定!A2:P');
  $values = $response->getValues();
  foreach ($values as $vAry) {
    list($characterId, $className, $characterName, $hpBase, $attackTypeBase, $attackBase, $pDefBase, $mDefBase, $moveBase, $rangeBase, $hitRateBase, $dodgeRateBase, $itemMax, $abilityName, $abilityDesc, $defaultJoin) = $vAry;
    $defaultJoin = $defaultJoin == '' ? 'false' : 'true';


    $targetImgDir = dirname(__FILE__).'/../../img/character/'.$characterId;
    $files = getFilelist($targetImgDir);
    sort($files);
    for ($index = 0; $index < count($files); $index++) {
      $files[$index] = '"./img/character/'.$characterId.'/'.$files[$index].'"';
    }
    $filelist = join(',', $files);

    $characterList .= '  "'.$characterId.'" : "'.$className."\"\n";

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
  @attackTypeBase = "{$attackTypeBase}"
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

  @itemMax = {$itemMax}

  @abilityName = "{$abilityName}"
  @abilityDesc = "{$abilityDesc}"

  constructor:(params)->
    super(params)

EOM;
    
    $filename = dirname(__FILE__).'/../../coffee/class/character/'.$className.'.class.coffee';
    if (!file_exists($filename)) {
      $buf = <<<EOM
class {$className} extends {$className}Base
  constructor:(params)->
    super(params)

EOM;
      file_put_contents($filename, $buf);
    }
  }

  $characterList .= '}';
  file_put_contents(dirname(__FILE__).'/../../coffee/class/character/CharacterList.coffee', $characterList);

  file_put_contents(dirname(__FILE__).'/../../coffee/class/character/CharacterBaseAll.class.coffee', $script);

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
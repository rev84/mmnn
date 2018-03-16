<?php

require_once dirname(__FILE__).'/../for_spreadsheet/SpreadsheetClient.php';

define('SPREAD_SHEET_ID', '1QtuXjepseAXTZ27y4lLrMs_DJHbjUTutheaTVeezUMs');

updateCharacter();

function updateCharacter()
{
  $c = SpreadsheetClient::getClient();

  $service = new Google_Service_Sheets($c);

  # キャラクター
  $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'キャラ設定!A3:C');
  $values = $response->getValues();
  foreach ($values as $vAry) {
    list($characterId, $className, $characterName) = $vAry;

    $imgFilepath = dirname(__FILE__).'/img/idol_'.mb_convert_encoding($characterName, 'Shift_JIS').'_1.png';
    var_dump(file_exists($imgFilepath));
    if (file_exists($imgFilepath)) {
      mkdir(dirname(__FILE__).'/res/'.$characterId);
      copy($imgFilepath, dirname(__FILE__).'/res/'.$characterId.'/1.png');
      copy($imgFilepath, dirname(__FILE__).'/res/'.$characterId.'/2.png');
    }
  }
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
    case 'プSR+':
      return 4;
    case 'プSSR':
      return 5;
    case 'プSSR+':
      return 6;
    case 'ガチャ':
      return 7;
    default:
      return 7+(int)$itemId;
  }
}
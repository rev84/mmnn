<?php

require_once dirname(__FILE__).'/SpreadsheetClient.php';

define('SPREAD_SHEET_ID', '1QtuXjepseAXTZ27y4lLrMs_DJHbjUTutheaTVeezUMs');

updateDefinedCards();
updateCardRank();
updateCardClub();
updateCardActionBase();

function updateDefinedCards()
{
    $c = SpreadsheetClient::getClient();

    $service = new Google_Service_Sheets($c);

    $script = '  @getDefinedCards = ->'."\n".
              '    ['."\n";

    # card_club
    $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'card_club!A2:J');
    $values = $response->getValues();
    foreach ($values as $vAry) {
        list($className, $name, $type, $description, $img, $carry, $run, $total, $incidence, $rank) = $vAry;
        $script .= "      [{$className}, {$incidence}]\n";
    }

    # card_action
    $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'card_action!A2:G');
    $values = $response->getValues();
    foreach ($values as $vAry) {
        list($className, $name, $type, $description, $img, $incidence, $rank) = $vAry;
        $script .= "      [{$className}, {$incidence}]\n";
    }

    $script .= "    ]\n";

    return replaceCode('CardManager.class.coffee', $script, '########## DefinedCards');
}

function updateCardRank()
{
    $c = SpreadsheetClient::getClient();

    $service = new Google_Service_Sheets($c);

    $script = '  @getCardRank = ->'."\n".
              '    ['."\n";

    # card_club
    $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'card_club!A2:J');
    $values = $response->getValues();
    foreach ($values as $vAry) {
        list($className, $name, $type, $description, $img, $carry, $run, $total, $incidence, $rank) = $vAry;
        $script .= "      [{$className}, {$rank}]\n";
    }

    # card_action
    $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'card_action!A2:G');
    $values = $response->getValues();
    foreach ($values as $vAry) {
        list($className, $name, $type, $description, $img, $incidence, $rank) = $vAry;
        $script .= "      [{$className}, {$rank}]\n";
    }

    $script .= "    ]\n";

    return replaceCode('CardManager.class.coffee', $script, '########## CardRank');
}



function updateCardActionBase()
{
    $c = SpreadsheetClient::getClient();

    $service = new Google_Service_Sheets($c);

    $script = '';

    # card_action
    $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'card_action!A2:G');
    $values = $response->getValues();
    foreach ($values as $vAry) {
        list($className, $name, $type, $description, $img, $incidence, $rank) = $vAry;

        $script .= <<<EOM
class {$className}Base extends CardActionBase
  # 画像ファイル名
  @img = './img/{$img}.png'
  # カード名
  @cardName = '{$name}'
  # 説明
  @description = "{$description}"
  # カード種類
  @type = @CONST.TYPE.{$type}
  # ランク
  @rank = {$rank}
  # 出現頻度
  @incidence = {$incidence}

EOM;
    }

    return replaceCode('CardActionBase.class.coffee', $script, '########## CardActionBaseUpdate');
}

function updateCardClub()
{
    $c = SpreadsheetClient::getClient();

    $service = new Google_Service_Sheets($c);

    $script = '';

    $response = $service->spreadsheets_values->get(SPREAD_SHEET_ID, 'card_club!A2:J');
    $values = $response->getValues();
    foreach ($values as $vAry) {
        list($className, $name, $type, $description, $img, $carry, $run, $total, $incidence, $rank) = $vAry;
        $description = str_replace("\n", '\n', $description);

        $script .= <<<EOM
class {$className} extends CardClubBase
  # キャリー距離
  @carry = {$carry}
  # ラン距離
  @run = {$run}
  # 画像ファイル名
  @img = './img/{$img}.png'
  # カード名
  @cardName = '{$name}'
  # 説明
  @description = "{$description}"
  # カード種類
  @type = @CONST.TYPE.{$type}
  # ランク
  @rank = {$rank}
  # 出現頻度
  @incidence = {$incidence}

EOM;
    }

    return replaceCode('CardClub.class.coffee', $script, '########## CardClubUpdate');
}

function replaceCode($filename, $code, $target)
{
    $fileAry = explode("\n", str_replace(["\r\n", "\r"], "\n", file_get_contents(dirname(__FILE__).'/../../coffee/'.$filename)));
    $newFileAry = [];
    $reading = true;
    foreach ($fileAry as $f) {
        if (preg_match('`'.$target.' START'.'`', $f)) {
            $reading = false;
            $newFileAry[] = $f;
            $newFileAry[] = $code;
        }
        elseif (preg_match('`'.$target.' END'.'`', $f)) {
            $reading = true;
            $newFileAry[] = $f;
        }
        elseif ($reading) {
            $newFileAry[] = $f;
        }
    }

    return file_put_contents(dirname(__FILE__).'/../../coffee/'.$filename, join("\n", $newFileAry));
}


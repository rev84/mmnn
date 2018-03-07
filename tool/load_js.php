<?php

const HEAD_FILES = [
  'ObjectBase.class.js',
];

$list = getJs('./js');
$jsList = ['<!-- my_js_start -->'];
foreach ($list as $li) {
  $jsList[] = '<script src="'.$li.'"></script>';
}
$jsList[] = '<!-- my_js_end -->';

$html = file_get_contents('./index.html');
$html = preg_replace('`<!-- my_js_start -->.*<!-- my_js_end -->`s', join("\n", $jsList), $html);
var_dump($html);

file_put_contents('./index.html', $html);

function getJs($dir){
  if($handle = opendir($dir)){
    $files = [];
    while(false !== ($entry = readdir($handle))){
      if($entry == '.' || $entry == '..') continue;
      var_dump($entry);
      if (is_dir($dir.'/'.$entry)) {
        $files = array_merge($files, getJs($dir.'/'.$entry));
      }
      elseif (preg_match('`\.js$`i', $entry)) {
        if (in_array($entry, HEAD_FILES)) {
          array_unshift($files, $dir.'/'.$entry);
        }
        else {
          $files[] = $dir.'/'.$entry;
        }
      }
    }
    
    return $files;
  }
  
  return [];
}
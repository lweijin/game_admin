<?php
// just create from the proto file a pb_prot[NAME].php file
require_once('plugin/parser/pb_parser.php');
$test = new PBParser();
$test->parse($argv[1],$argv[2]);

?>
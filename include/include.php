<?php
header("Content-type: text/html; charset=utf-8"); 
ini_set('date.timezone','Asia/Hong_Kong'); //Asia/Hong_Kong      Asia/Shanghai  
define("ROOT_DIR",dirname(dirname(__FILE__)));

require_once(ROOT_DIR."/config/config.inc.php");//配置文件

require_once(ROOT_DIR."/include/func.php"); //基础工具方法

require_once(ROOT_DIR."/lib/db/class.DBPDO.php");// 数据库配置文件

require_once(ROOT_DIR."/lib/smarty/Smarty.class.php");//smarty 基础类
require_once(ROOT_DIR."/lib/base/base.php");// 数据库单例
require_once(ROOT_DIR."/lib/base/object.php");//smarty基础配置
require_once(ROOT_DIR."/lib/base/curl.php");// curl

require_once (ROOT_DIR."/proto/message/pb_message.php");

require __DIR__.'/auto_load.php';
if (!function_exists('spl_autoload_register')){
	throw new RuntimeException('spl_autoload_register() not found.');
}
spl_autoload_register('auto_load::load');
?>
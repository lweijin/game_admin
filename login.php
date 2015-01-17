<?php
	session_start();
	require_once("include/include.php"); 
	require_once("action/login.class.php"); //调用类函数
	try{
		$login = new login();
		$login->main();
	}catch(\Exception $e){
		echo 'Caught exception: ',$e->getFile(),":",$e->getLine(),"\n" ,  $e->getMessage(), "<br>";
		echo $e->getTraceAsString();
	}
?>
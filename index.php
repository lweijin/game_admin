<?php
	session_start(); 
	require_once("include/include.php");
	try{
		check_login();
		$index = new index();  //$_REQUEST
		$index->main();
	}catch(\Exception $e){
		echo 'Caught exception: ',$e->getFile(),":",$e->getLine(),"\n" ,  $e->getMessage(), "<br>";
		echo $e->getTraceAsString();
	}
?>
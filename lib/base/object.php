<?php
class CObject
 {
    public $SQL;
    public $TPL;	
	function __construct()
	{
		$this->SQL = new CHandleData();
		$this->TPL = new CHandlePage();
		$this->page_url = $_SERVER["PHP_SELF"];
	}
	
	/**
	 * 用于页面显示
	 **/
	function show_page($action)
	{ 
		$tpl_file = $action . ".tpl"; //tpl 文件
		$this->TPL->display($tpl_file); // smarty 显示
	}
 } 
?>
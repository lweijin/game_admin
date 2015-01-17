<?php
class CHandleData
{
    private static $db;
	function __construct()
	{
	}

	function get_instance()
	{
		if (self::$db) {
			return self::$db;
		}

		self::$db = new DBPDO();
		return self::$db;
	}

	function prep_query($query){
		return $this->get_instance()->prep_query($query);
	}

	function table_exists($table_name){
		return $this->get_instance()->table_exists($table_name);
	}


	function execute($query, $values = null){
		$stmt = $this->get_instance()->execute($query, $values);
		return $stmt->rowCount();
	}

	function fetch($query, $values = null){
		return $this->get_instance()->fetch($query, $values);
	}

	function fetch_all($query, $values = null, $key = null){
		return $this->get_instance()->fetchAll($query, $values,$key);
	}

	function last_insert_id(){
		return $this->get_instance()->lastInsertId();
	}
}	

class CHandlePage extends Smarty
{
	function __construct()
	{
		$this->template_dir = "tpl";
		$this->compile_dir = "tmp";
		$this->config_dir = "config";
		$this->cache_dir = "cache";
		$this->left_delimiter  = '{#';
		$this->right_delimiter = '#}';
		$this->caching = false;
		
		$this->HandleHeader();
		$this->HandleFooter();
	}
	
	function HandleHeader()
	{

	}
	
	function HandleFooter()
	{
		
	}
	
}		
?>
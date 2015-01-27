<?php

class gateway_manager extends CObject
{	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function main()
	{
		switch(get_param('act'))  
		{
			case 'hotup':
				$this->hotup();
				break;
			case 'shot_down':
				$this->shot_down();
				break;
			case 'edit':
				$this->edit();
				break;
			default:
				$this->show();
				break;
		}
	}

	private function show()
	{
		if_has_level('gateway_manager');
		$sql = "select * from gateway_list";
		$gateway_list = $this->SQL->fetch_all($sql);
		$this->TPL->assign("gateway_list",$gateway_list);
		$this->TPL->assign("game_server_name",'游服管理');
		$this->TPL->assign("gateway_name",'网关服管理');
		$this->TPL->assign("command",'gateway_manager');
		$this->show_page("gateway_manager");
	}

	private function hotup()
	{
		$gateway_id = get_param('gateway_id');
		$sql = "select * from gateway_list where gateway_id = $gateway_id";
		$gateway_info = $this->SQL->fetch($sql);
		if ($gateway_info) {
			$curl = new curl();
			$url = $gateway_info['host'] . "/admin?q=hotup";
			$ret = $curl->get($url,$gateway_info['http_port']);
			go_back('更新成功','index.php&command=gateway_manager');
		}else{
			go_back('服务器不存在','index.php&command=gateway_manager');
		}
	}

	private function shot_down()
	{
		$gateway_id = get_param('gateway_id');
		$sql = "select * from gateway_list where gateway_id = $gateway_id";
		$server_info = $this->SQL->fetch($sql);
		if ($server_info) {
			$curl = new curl();
			$url = $server_info['host'] . "/admin?q=shot_down";
			$ret = $curl->get($url,$server_info['http_port']);
			go_back('成功关闭','index.php&command=gateway_manager');
		}else{
			go_back('服务器不存在，刷新列表后重试','index.php&command=gateway_manager');
		}
	}

	private function edit()
	{
		$k = get_param("k");
		$v = get_param("v");
		$gateway_id = get_param("gateway_id");
		$sql = "update gateway_list set $k = '$v' where gateway_id = '$gateway_id'";
		$ret = $this->SQL->execute($sql);
		if ($ret) {
			go_back('更新成功','index.php&command=gateway_manager');
		}else{
			go_back('更新失败','index.php&command=gateway_manager');
		}
	}
}
?>
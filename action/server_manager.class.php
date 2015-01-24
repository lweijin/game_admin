<?php

class server_manager extends CObject
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
			case 'do_query_list':
				$this->update_server_info();
				break;
			default:
				$this->show();
				break;
		}
	}

	private function show()
	{
		if_has_level('server_manager');
		$sql = "select * from server_list";
		$server_list = $this->SQL->fetch_all($sql);
		$this->TPL->assign("server_list",$server_list);
		$this->TPL->assign("game_server_name",'游服管理');
		$this->TPL->assign("gateway_name",'网关服管理');
		$this->TPL->assign("command",'server_manager');
		$this->show_page("server_manager");
	}

	private function hotup()
	{
		$srv_id = get_param('srv_id');
		$sql = "select * from server_list where server_id = $srv_id";
		$server_info = $this->SQL->fetch($sql);
		if ($server_info) {
			$curl = new curl();
			$url = $server_info['host'] . "/admin?q=hotup";
			$ret = $curl->get($url,$server_info['http_port']);
			go_back('更新成功' . $ret,'index.php&command=server_manager');
		}else{
			go_back('服务器不存在，刷新列表后重试','index.php&command=server_manager');
		}
	}

	private function shot_down()
	{
		$srv_id = get_param('srv_id');
		$sql = "select * from server_list where server_id = $srv_id";
		$server_info = $this->SQL->fetch($sql);
		if ($server_info) {
			$curl = new curl();
			$url = $server_info['host'] . "/admin?q=shot_down";
			$ret = $curl->get($url,$server_info['http_port']);
			go_back('成功关闭','index.php&command=server_manager');
		}else{
			go_back('服务器不存在，刷新列表后重试','index.php&command=server_manager');
		}
	}

	private function update_server_info()
	{
		$curl = new curl();
		$sql = "select * from gateway_list";
		$ret = $this->SQL->fetch_all($sql);
		$sql_value = '';
		$server_list = array();
		$now = date("Y-m-d H:i:s");
		foreach ($ret as $key => $value) {
			$url = $value['host'] . "/admin?q=server_list";
			$server_info = $curl->get($url,$value['http_port']);
			$server_info = json_decode($server_info,true);
			$server_info = current($server_info);
			$server_list[] = $server_info;
			if (empty($sql_value)) {
                $sql_value = "({$server_info['id']},'{$server_info['info']['serName']}','{$server_info['info']['host']}',{$server_info['info']['ioPort']},{$server_info['info']['httpPort']},{$server_info['num']},{$value['gateway_id']},'{$now}')";
			}else{
                $sql_value = ",({$server_info['id']},'{$server_info['info']['serName']}','{$server_info['info']['host']}',{$server_info['info']['ioPort']},{$server_info['info']['httpPort']},{$server_info['num']},{$value['gateway_id']},'{$now}')";
			}
		}

		if (!empty($sql_value)) {
			$truncate = 'truncate table server_list';
			$this->SQL->execute($truncate);
			$sql = "replace into server_list (server_id,server_name,host,io_port,http_port,online_num,gateway_id,update_time)VALUES" . $sql_value;
			$this->SQL->execute($sql);
		}
		$this->show();
	}
}
?>
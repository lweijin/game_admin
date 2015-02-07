<?php

class game_manager extends CObject
{	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function main()
	{
		switch(get_param('act'))  
		{
			case 'query_user_info':
				$this->query_user_info();
				break;
			case 'query_log':
				$this->query_log();
				break;
			default:
				$this->show('');
				break;
		}
	}

	private function show($account)
	{
		if_has_level('gm');
		$this->TPL->assign("account",$account);
		$this->show_page("game_user_info");
	}

	private function do_offline_query($account){
		$curl = new curl();
		$sql = "select * from server_list where server_id = -1";
		$offline_server_info = $this->SQL->fetch($sql);
		$table_list = get_param('table_list');
		$game_user_info = array(); //moduel => array(info => array(p1=>array(info,des)),list=>array(array(info,des)))

		foreach ($table_list as $key => $table_name) {
			# code...
			$url = $offline_server_info['host'] . "/admin?q=offline_user_info&account={$account}&tableName={$table_name}";
			$ret = $curl->get($url,$offline_server_info['http_port']);
			$parse_func = "parse_" . $table_name;
			$game_user_info[$table_name] = $this->$parse_func($ret);
		}

		$this->TPL->assign("account",$account);
		$this->TPL->assign("game_user_info",$game_user_info);

		$this->show_page("game_user_info");
	}

	private function do_online_query($account){
		$sql = "select * from gateway_list";
		$gateway_info = $this->SQL->fetch_all($sql);
		$table_list = get_param('table_list');
		$curl = new curl();
		foreach ($gateway_info as $key => $value) {
			$url = $value['host'] . "/admin?q=online_user_info&account={$account}";
			$ret = $curl->get($url,$value['http_port']);
			$ret = json_decode($ret,true);
			if ($ret['is_online']) {
				$online_srv = $ret['online_srv'];
				$sql = "select * from server_list where server_id = {$online_srv}";
				$server_info = $this->SQL->fetch($sql);
				foreach ($table_list as $key => $table_name) {
					# code...
					$url = $server_info['host'] . "/admin?q=online_user_info&account={$account}&tableName={$table_name}";
					$ret = $curl->get($url,$server_info['http_port']);
					$parse_func = "parse_" . $table_name;
					$game_user_info[$table_name] = $this->$parse_func($ret);
				}
				$this->TPL->assign("account",$account);
				$this->TPL->assign("online_srv",$online_srv);
				$this->TPL->assign("game_user_info",$game_user_info);
		
				$this->show_page("game_user_info");
				return;
			}
		}
		echo "玩家不在线";
	}

	private function query_user_info(){
		//var_dump($_REQUEST);
		$account = get_param('account');
		$query_offline = get_param('query_offline');
		if (empty($account)) {
			go_back('账号不能为空','index.php&command=game_manager');
		}

		if ($query_offline) {
			$this->do_offline_query($account);
		}else{
			$this->do_online_query($account);
		}
	}

	private function query_log(){
		//var_dump($_REQUEST);
		$code = get_param('code');
		$user_id = get_param('user_id');
		$start_time = get_param('start_time');
		$end_time = get_param('end_time');
		$where = '';
		if (!empty($user_id)) {
			$where .= " user_id = {$user_id}";
		}

		if (!empty($code)) {
			$where .= " and code = {$code}";
		}
		if (!empty($where)) {
			$db_name = "game_db_";
			$sql = "select * from game_log.game_db_20150124_15 where {$where}";
			$log = $this->SQL->fetch_all($sql);
			$this->TPL->assign("log",$log);
		}
		$this->TPL->assign("code",$code);
		$this->TPL->assign("start_time",$start_time);
		$this->TPL->assign("end_time",$end_time);
		$this->TPL->assign("user_id",$user_id);
		$this->show_page("query_log");
	}

	private function parse_hero_package($data)
	{
		require_once (ROOT_DIR."/proto/hero.php");
		$hero_package = new \playerdata\hero\HeroPackage();
		$hero_package->parseFromString($data);
		$ret = array('des' => "英雄背包",'info' => array(),'list' => array(),'list_des' => "英雄列表");
		$ret['info'][] = array('info' => $hero_package->heros_size(),'des' => "英雄数量");
		$ret['info'][] = array('info' => $hero_package->hero_chip(),'des' => "英雄碎片");
		$ret['info'][] = array('info' => $hero_package->skill_exp(),'des' => "技能经验");


		$heros = $hero_package->get_heros();
		foreach ($heros as $key => $hero) {
			$ret['list'][] = array(
				array('info' => $hero->id(),'des' => "英雄id"),
				array('info' => $hero->sn(),'des' => "英雄sn"),
				array('info' => $hero->name(),'des' => "英雄名字"),
				array('info' => $hero->character(),'des' => "英雄品质"),
				array('info' => $hero->job(),'des' => "英雄职业"),
				array('info' => $hero->lv(),'des' => "英雄等级"),
				array('info' => $hero->change_job_num(),'des' => "英雄转职次数"),
				array('info' => $hero->skill_lv(),'des' => "英雄技能等级"),
				array('info' => $hero->is_lock()?'true':'false','des' => "是否锁定"),
				array('info' => $hero->exp(),'des' => "英雄经验"),
				array('info' => $hero->talent(),'des' => "英雄天赋"),
			);
		}
		return $ret;
	}

	private function parse_user($data)
	{
		require_once (ROOT_DIR."/proto/user.php");
		$user = new \playerdata\user\User();
		$user->parseFromString($data);
		$ret = array('des' => "玩家基本信息",'info' => array(),'list' => array());
		$ret['info'][] = array('info' => $user->account(),'des' => "帐号id");
		$ret['info'][] = array('info' => $user->user_name(),'des' => "角色名");
		$ret['info'][] = array('info' => $user->lv(),'des' => "玩家等级");
		$ret['info'][] = array('info' => $user->vip_lv(),'des' => "vip等级");
		$ret['info'][] = array('info' => $user->icon(),'des' => "头像");
		$ret['info'][] = array('info' => $user->coin(),'des' => "金币");
		$ret['info'][] = array('info' => $user->gold(),'des' => "钻石");
		$ret['info'][] = array('info' => $user->exp(),'des' => "经验");
		$ret['info'][] = array('info' => $user->last_login_time(),'des' => "上一次登陆时间");
		$ret['info'][] = array('info' => $user->last_logout_time(),'des' => "上一次下线时间");
		$ret['info'][] = array('info' => $user->item_package_lv(),'des' => "背包等级");
		$ret['info'][] = array('info' => $user->tower_level(),'des' => "城堡等级");
		$ret['info'][] = array('info' => $user->cur_team_id(),'des' => "当前选择的队伍id");
		$ret['info'][] = array('info' => $user->hp(),'des' => "体力");
		$ret['info'][] = array('info' => $user->cur_copyscene_id(),'des' => "当前冒险副本id");
		return $ret;
	}
}
?>
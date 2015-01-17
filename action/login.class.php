<?php
class login extends CObject  //继承数据库和模板操作类
{
	private $user_id; //用户id
	private $user_name; //用户名
	
	function __construct() //构造函数,连接数据库
	{
		parent::__construct();
	}
	
	function main()
	{
		switch(get_param('act'))  
		{
			case 'login':
				$this->user_auth();
				break;
			case 'logout':
				$this->logout();
				break;
			default:
				$this->show_login();
				break;
		}
	}
	
	//登陆页面展示
	private function show_login()
	{
		$this->TPL->assign("website_name",WEBSITE_NAME);
		$this->TPL->assign("act","login");
		$this->show_page("login"); 
	}
	
	//=============登录===================================	
	function user_auth()
	{
		$user = trim(get_param("txt_user"));
		$pwd = trim(get_param("txt_pwd"));
		$txt_auth = trim(get_param("txt_auth"));
		if($_SESSION["auth_num"]!=$txt_auth){
			go_back("验证码不对,请按照图片填写！");
			exit;
		}else{
			$sql = "SELECT * FROM  user where user_name='{$user}'";
			$user = $this->SQL->fetch($sql); 

			if($user){
				if( $user["status"] == 1) {//用户状态关闭
					go_back("用户没有被审核或已销户.如有问题请与客服联系！");
					exit;
				}   
				$pwd = md5(md5($pwd).SALT);
				if( $pwd == $user['pwd'] ) {//密码匹配
					$this->user_name = $user['user_name'];  //用户名
					$this->user_id = $user['user_id'];  //用户自定义id
				}else{//密码不匹配
					go_back("密码错误！");
					exit;
				}
				$this->set_session(); //设置SESSION信息
				$this->login_log();
				header("Location:index.php"); 
			}else{
				//go_back("用户名不存在！");
				exit;
			}
		}
	}
	
	//设置SESSION
	function set_session() {
		$_SESSION['login'] = 1;
		$_SESSION['user_name'] = $this->user_name;
		$_SESSION['user_id'] = $this->user_id;
		$_SESSION['user_level'] = $this->get_user_level();
	}
	
	//注销SESSION
	function clean_session() {
		unset($_SESSION['login']);
        unset($_SESSION['user_name']);
		unset($_SESSION['user_id']);
        unset($_SESSION['user_level']);
	}

	private function get_user_level()
	{
		$user_level = get_user_level();
		$sql = "SELECT level_key FROM title_level WHERE id IN (".$user_level.")";
        $ret = $this->SQL->fetch_all($sql);
        if($ret)
        {
            foreach($ret as $key => $value)
            {
                $level_key[$value['level_key']] = true;
            }
            return $level_key;
        }
        return false;
	}

	//获取客户端登陆的ip
	function getip()
	{ 
		if (@$_SERVER["HTTP_X_FORWARDED_FOR"]) 
		$ip = $_SERVER["HTTP_X_FORWARDED_FOR"]; 
		else if (@$_SERVER["HTTP_CLIENT_IP"]) 
		$ip = $_SERVER["HTTP_CLIENT_IP"]; 
		else if (@$_SERVER["REMOTE_ADDR"]) 
		$ip = $_SERVER["REMOTE_ADDR"]; 
		else if (@getenv("HTTP_X_FORWARDED_FOR"))
		$ip = getenv("HTTP_X_FORWARDED_FOR"); 
		else if (@getenv("HTTP_CLIENT_IP")) 
		$ip = getenv("HTTP_CLIENT_IP"); 
		else if (@getenv("REMOTE_ADDR")) 
		$ip = getenv("REMOTE_ADDR"); 
		else 
		$ip = "Unknown"; 
		return $ip; 
	}
	
	private function logout()
	{
		$this->clean_session();
		go_url_parent("退出成功！","login.php");
	}
	

	/**
	 * 记录登陆log
	 **/
 	function login_log()
	{
		$user_name = $_SESSION['user_name'];
		//$ip=getip();
		$time=date(DATE_FORMAT,time());
		$log_sql = "insert into user_log(user_name,ip,update_time,content,type) values('{$user_name}','127.0.0.1','{$time}','登录<br>','1')";
		$ret = $this->SQL->execute($log_sql);
		$_SESSION['log_id'] = mysql_insert_id();
	}
}
<?php


//url重定向
function go_url($msg, $url, $charset = 'utf-8') {
	echo "<script language=\"javascript\">alert('" . $msg . "');window:location='" . $url . "';</script>";
	exit;
}

//在父页面跳转url
function go_url_top($msg, $url, $charset = 'utf-8') {
    echo "<script language=\"javascript\">alert('" . $msg . "');window:top.location='" . $url . "';</script>";
    exit;
}

function go_url_parent($msg, $url, $charset = 'utf-8') {
    echo "<script language=\"javascript\">alert('" . $msg . "');window:parent.location='" . $url . "';</script>";
    exit;
}

//跳转到上一页
function go_back($msg, $charset = 'utf-8') {
    echo "<script language=\"javascript\">alert('" . $msg . "');history.back();</script>";
    exit;
}

//判断是否登陆
function check_login() {
    header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
    header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
    header("Cache-Control: no-store, no-cache, max-age=0, must-revalidate");
    header("Cache-Control: post-check=0, pre-check=0", false);
    header("Pragma: no-cache");
//header('Content-Type: text/html; charset=utf-8');

    if (!isset($_SESSION['login'])) {
        go_url_parent("您尚未登录或登录已过期！！\\n请登录......", "login.php");
    }
}

function get_param($name)
{
	$ret = null;
	if(isset($_GET[$name])) {
		$ret = $_GET[$name];
	}
	if(isset($_POST[$name])) {
		$ret = $_POST[$name];
	}
	
	return $ret;
}

function if_has_level($level)
{
    $user_level = $_SESSION['user_level'];
    if (!isset($user_level[$level])) {
        go_back("没有权限，请与管理员联系！");
        exit;
    }
    return true;
}

function get_level($level)
{
    $user_level = $_SESSION['user_level'];
    if (!isset($user_level[$level])) {
        return false;
    }
    return true;
}

//------------------权限-----------------------
function get_user_level()
{   
    $sql = "select user_level from user_title_level where user_id = {$_SESSION['user_id']}";
    $db = new CHandleData();
    $ret = $db->fetch_all($sql);
    if($ret)
    {
        $arr_ids = array();
        foreach ($ret as $key => $value) {
            $arr_ids[] = $value['user_level'];
        }
        $str_ids = implode(',', $arr_ids);
        return $str_ids;
    }
    return false;
}
?>
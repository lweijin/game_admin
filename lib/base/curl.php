<?php 
class curl 
{
	private  $callback;
	function __construct(){
		$this->callback = false;
	}
	function __destruct(){
		
	}
	function set_callback($func_name) 
	{
		$this->callback = $func_name;
	}

	function do_request($method, $url, $vars,$port) 
	{
		if (empty($url))
		{
			return false;
		}
		ob_flush();
		flush();// 刷新缓冲输出流
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 30);//设置超时时间30秒
		curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_PORT, $port);

		if ($method == 'POST') {
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $vars);
		}
		$data = curl_exec($ch);
		curl_close($ch);
		if ($data) {
			if ($this->callback)
			{
				$callback = $this->callback;
				$this->callback = false;
				return call_user_func($callback, $data);
			} else {
				return $data;
			}
		} else {
			ob_start();
			curl_error($ch);
			$msg = ob_get_contents();
			ob_clean();
			return false;
		}
	}

	function get($url,$port = 80) {
		return $this->do_request('GET', $url, 'NULL',$port);
	}

	function post($url, $vars,$port = 80) {
		return $this->do_request('POST', $url, $vars,$port);
	}
}
?>
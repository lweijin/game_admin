<?php
class index extends CObject
{	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function main()
	{
		$command = get_param('command');
		if ($command) {
			$c_command = new $command();
			$c_command->main();
		}else{
			switch(get_param('act'))
			{
				case 'top':
					$this->frame_top();
					break;
				case 'right':
					$this->frame_right();
					break;
				case 'left':
					$this->frame_left();
					break;
				default:
					$this->show();
					break;
			}
		}
	}
	
	private function show()
	{
		$this->TPL->assign("website_name",WEBSITE_NAME);
		$this->show_page("index");   
	}
	
	private function frame_top()
	{
		$this->TPL->assign("act","logout");
		$this->TPL->assign('user_name',$_SESSION['user_name']);
		$this->show_page("frame_top");
	}
	
	private function frame_right()
	{
		$this->TPL->assign(array(
			"user_name" => $_SESSION['user_name'],
			"account" => $_SESSION['user_name'],
			"create_time" => date("Y-m-d H:i:s"),
			"last_login_time" => date("Y-m-d H:i:s")
		));
		$this->show_page("frame_right"); 
	}
	
	private function frame_left()
	{
		$object = new article();
		$user_id = $_SESSION['user_id'];
		$rowLevel = $object->select_directory($user_id);
		$rowLevel1 = $rowLevel[1];
		$rowLevel2 = array();
		if (isset($rowLevel[2])) {
			$rowLevel2 = $rowLevel[2];
		}
		$rowLevel3 = array();
		if (isset($rowLevel[3])) {
			$rowLevel3 = $rowLevel[3];
		}
		//print_r($rowLevel2);
		$this->TPL->assign('rowLevel1',$rowLevel1);
		$this->TPL->assign('rowLevel2',$rowLevel2);
		$this->TPL->assign('rowLevel3',$rowLevel3);
		$this->show_page("frame_left");
	}
}
?>
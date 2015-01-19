<?php
class level extends CObject
{
	public function level() //构造函数,连接数据库
	{
		parent::__construct();
	}
	
	public function main()
	{
		switch(get_param('act'))
		{
			case 'article':
				$this->show_article();
				break;
			case 'user':
				$this->show_user();
				break;
			case 'save_article_add':
				$this->add_article_level();
				break;
			case 'save_article_edit':
				$this->update_article_level();
				break;
			case 'article_del':
				$this->del_article_level();
				break;
			case 'edit_user_level':
				$this->edit_user_level();
				break;
			case 'save_edit_user_level':
				$this->save_edit_user_level();
				break;
			default:
				$this->show_article();
				break;
		}
	}

	private function show_user(){
		if_has_level('user_level');
		$user_level['add'] = get_level('user_role_add');
		$user_level['del'] = get_level('user_role_del');
		
		$all_user = $this->select_all_user();
		
		$this->TPL->assign("user_level", $user_level);
		$this->TPL->assign("all_user", $all_user);
		$this->TPL->assign("website_name",'用户权限');
		$this->TPL->assign("man_title_name",'用户权限');
		$this->TPL-> assign("act","saveUserRole"); 
		$this->show_page("user_level");
	}

	public function select_all_user()
	{
		$sql = "SELECT user_id,user_name,user_level from user_title_level GROUP BY user_id HAVING COUNT(*) > 1";
		return $this->SQL->fetch_all($sql);
	}
	
	private function show_article(){
		if_has_level('level_manager');

		$user_level['add'] = get_level('level_add'); 
		$user_level['edit'] = get_level('level_edit'); 
		$user_level['del'] = get_level('level_del');
		
		require_once(ROOT_DIR."/action/article.class.php");
		$art = new article();
		$row = $art->select_article();
		
		$rowL = $this->select_level();
		$this->TPL->assign("user_level",$user_level);
		$this->TPL->assign("row",$row);
		$this->TPL->assign("rowL",$rowL);
		$this-> TPL -> assign("website_name",'模块权限管理');
		$this->show_page("article_level");
	}

	public function select_level()
	{
		$sql = "select * from title_level";
		$row = $this->SQL->fetch_all($sql);
		$ret = array();
		for($i=0;$i<count($row);$i++)
		{
			$ret[$row[$i]['title_id']][] = $row[$i];
		}
		
		return $ret;
	}
	
	private function update_article_level()
	{
		if_has_level("level_edit");
		
		$sql = "select id from title_level where level_key = '".get_param('key')."' and id != '".get_param('id')."'";	
		$ret = $this->SQL->fetch($sql);
		if(!$ret)
		{
			$sql="update title_level set title_id = '".get_param('tid')."',level_name = '".get_param('name')."',level_key = '".get_param('key')."' where id = '".get_param('id')."'";
			$ret = $this->SQL->execute($sql);
			if($ret)
			{
				$return_flag='true';	
			}
			else
			{
				go_back('修改权限失败，权限Key跟原先一样');
			}
		}
		else
		{
			$return_flag='false';
		}
						
		if($return_flag=='true')
			$message = "修改权限成功！";
		else
			$message = "修改权限失败，权限Key：".get_param('key')."已存在！";
		go_back($message);
	}

	private function add_article_level()
	{
		if_has_level("level_add");
		
		$sql = "select id from title_level where level_key = '".get_param('key')."'";
		$row = $this->SQL->fetch($sql);
		if(isset($row['id']))
		{			
			$return_flag='false';	
		}
		else
		{
			$sql="insert into title_level(title_id,level_name,level_key,create_time) values('".get_param('tid')."','".get_param('name')."','".get_param('key')."','".date("Y-m-d H:i:s")."')";
			
			$ret = $this->SQL->execute($sql);
			if($ret)
			{
				$return_flag='true';	
			}
			else
			{
				$return_flag='false';	
			}
		}				
		
		if($return_flag=='true')
			$message = "新增权限成功！";
		else
			$message = "新增权限失败，权限Key：".get_param('key')."已存在！";
		go_back($message);
	}
	

	
	private function del_article_level()
	{
		if_has_level("level_del");
		
		$sql = "delete from user_title_level where user_level = '".get_param('id')."'";
		$ret = $this->SQL->execute($sql);
		$sql = "delete from title_level where id = '".get_param('id')."'";
		$ret = $this->SQL->execute($sql);
		if($ret)
			$message = "删除权限成功！";
		else
			$message = "修改权限失败！";
		go_back($message);
	}

	private function edit_user_level()
	{
		if_has_level('user_level_edit');
		$user_id = get_param('user_id');
		$sql = "select * from user_title_level where user_id = $user_id";
		$user = $this->SQL->fetch_all($sql);

		foreach ($user as $key => $value) {
			$user_level[$value['user_level']] = true;
			$user_info['user_id'] = $value['user_id'];
			$user_info['user_name'] = $value['user_name'];
		}

		$article = new article();		
		$article_row = $article->select_article();
		$level_row = $this->select_level();
		
		$this->TPL->assign("act","save_edit_user_level");
		$this->TPL->assign("user",$user_info);
		$this->TPL->assign("article_row",$article_row);
		$this->TPL->assign("level_row",$level_row);
		$this->TPL->assign("role_level",$user_level);
		$this->TPL->assign("website_name",'新增角色权限');
		$this->TPL->assign("man_title_name",'角色权限');
		$this->show_page("edit_user_level");
	}

	private function save_edit_user_level()
	{
		if_has_level('user_level_edit');
		$level = get_param('level');
		$user_id = get_param('user_id');
		$user_name = get_param('user_name');
		
		$sql = "select user_level from user_title_level where user_id = $user_id";
		$old_level = $this->SQL->fetch_all($sql);
		$del = '';
		foreach ($old_level as $key => $value) {
			if (!isset($level[$value['user_level']])) {
				if (empty($del)) {
					$del .= $value['user_level'];
				}else{
					$del = $del . ',' . $value['user_level'];
				}
			}
		}

		if (!empty($del)) {
			# code...
			$del = "delete from user_title_level where user_id = $user_id and user_level in ($del)";
			$this->SQL->execute($del);
		}

		$str = '';
		foreach ($level as $key => $value) {
			if (empty($str)) {
				$str .= "($user_id,$key,'$user_name')";
			}else{
				$str .= ",($user_id,$key,'$user_name')";
			}
			
		}
		$sql = "replace into user_title_level(user_id,user_level,user_name) values $str";
		$ret = $this->SQL->execute($sql);

		if($ret)
		{
			$message = "修改成功！";
		}
		else
			$message = "修改失败！";
		go_back($message);
	}

}
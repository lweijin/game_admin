<?php
class article extends CObject  //继承数据库和模板操作类
{
	private $index = 0;
	private $level = 0;
	public function __construct() //构造函数,连接数据库
	{
		parent::__construct();
	}
    
	public function main()
	{
		switch(get_param('act'))
		{
			case 'add':
				$this->add();
				break;
			case 'save_add':
				$this->save_add();
				break;
			case 'del':
				$this->delete();
				break;
			default:
				$this->show();
				break;
		}
	}

	private function show()
	{
		if_has_level("article_manager");
		
		$user_level['add'] = get_level("title_add");
		$user_level['del'] = get_level("title_del");
		$array_roots = $this->select_article();
		//print_r($array_roots);
		$this->TPL->assign("website_name","模块管理");
		$this->TPL->assign("man_title_name","模块管理");
		$this->TPL->assign("add_title_name","添加模块");
		$this->TPL->assign("user_level",$user_level);
		$this->TPL->assign("array_roots",$array_roots);
		$this->show_page("article_manage");
	}

	//返回左边导航数据
	public function select_directory($user_id)
	{
		$level = get_user_level();
		if($level)
		{
			$sql = "select * from title where title_id in(select title_id from title_level where id in(".$level.")) order by grade";
			$title = $this->SQL->fetch_all($sql);
			$row_level = array();
			for($k=0;$k<count($title);$k++)
			{
				switch($title[$k]['grade'])
				{
					case '1':$row_level[1][] = $title[$k];break;
					case '2':$row_level[2][] = $title[$k];break;
					case '3':$row_level[3][] = $title[$k];break;
				}
			}
			return $row_level;
		}
		else
			return false;
	}

	//返回 栏目数据 
	public function select_article()
	{
		$sql = "select * from title;";
		$ret = $this->SQL->fetch_all($sql);
		$row_level = array();
		$row_root = array();
		for($k=0;$k<count($ret);$k++)
		{
			$row_root[$ret[$k]['title_id']] = $ret[$k];
			$row_level[$ret[$k]['up_id']][] = $ret[$k];
		}
		return $this->handle_article($row_level,0,$row_root);
	}

	private function handle_article($row,$up_id,$row_root)
	{
		$ret = array();
		$this->level++;
		if(isset($row[$up_id]))
		{		
			foreach($row[$up_id] as $key => $value)
			{				
				$ret[$this->index] = $value;
				$ret[$this->index]['new_title_name'] = $this->handle_title_name($value['title_name']);
				$ret[$this->index]['drop_title_name'] = $this->handle_title_name($value['title_name'],false);
				if(isset($row_root[$value['root_id']])){
					$ret[$this->index]['root_name'] = $row_root[$value['root_id']]['title_name'];
				}

				if(isset($row_root[$value['up_id']])){
					$ret[$this->index]['up_name'] = $row_root[$value['up_id']]['title_name'];
				}
				
				$this->index++;
				$child = $this->handle_article($row,$value['title_id'],$row_root);
				$ret = array_merge($ret,$child);
			}
		}
		$this->level--;
		
		return $ret;
	}

	private function handle_title_name($str,$is_px=true)
	{
		$string = '';
		if($is_px)
		{
			$px = (20 * $this->level).'px';
			if($this->level>1)
				$str = "├".$str;
			$string = '<span style="margin-left:'.$px.'">'.$str.'</span>';
		}
		else
		{
			$i = $this->level;
			while($i>1)
			{
				$string .= "&nbsp;&nbsp;";
				$i--;
			}
			if($this->level>1)
				$str = "├".$str;
			$string .= $str;
		}
		return $string;
	}

	private function add()
	{
		if_has_level("title_add");
		
		$array_module = $this->select_article();		
		$user_level['add'] = get_level("title_add");
		$this->TPL->assign("website_name","添加模块");
		$this->TPL->assign("man_title_name","模块管理");
		$this->TPL->assign("add_title_name","添加模块");
		$this->TPL->assign("act","save_add");
		$this->TPL->assign("user_level",$user_level);
		$this->TPL->assign("array_module",$array_module);
		$this->show_page("article_add");
	}
	
	private function save_add()
	{
		if_has_level("title_add");
		
		$title_name = get_param('title_name');
		$ups = get_param('grade');
		$url = get_param('url');
		$show_left = get_param('show_left');
		if($ups==0)
		{
			$root_id=0;
			$child  =0;
			$up_id  =0;
			$grade  =1;
		}
		else
		{
			$sql=" select * from title where title_id ='".$ups."' ";
			$ret = $this->SQL->fetch($sql);
			if ($ret) {
				if($ret['root_id']!=0){
					$root_id=$ret['root_id'];
				}
				else{
					$root_id=$ret['title_id'];
				}
				$child  =0;
				$up_id  =$ret['title_id'];   	
				$grade=  $ret['grade'] + 1;	    //新增模块等级
				$up_child =$ret['child'] + 1;    //上级模块 子模块个数
				//更新上级模块 子模块个数			
				$sql=" update title set child='".$up_child."' where title_id='".$up_id."'  ";
				$this->SQL->execute($sql);
			}
		}
		
		$sql =" insert into title (title_name,root_id,up_id,child,url,grade,show_left) values ('".$title_name."','".$root_id."','".$up_id."','".$child."','".$url."','".$grade."','".$show_left."')";	
		$ret=$this->SQL->execute($sql);
		if($ret)
			$message = '添加成功！';
		else
			$message = "添加失败！";
		go_back($message,'index.php&command=article');	
	}
	
	private function delete()
	{
		if_has_level("title_del");
		
		$title_id = get_param('title_id');
		//echo $title_id;
		$this->delete_title($title_id);
		$message = '删除成功！';
		go_back($message);
	}

	function delete_title($title_id)
	{
		$sql = "select * from title where title_id = {$title_id}";
		$ret = $this->SQL->fetch($sql);
		if(!$ret){
			return ;
		}

		if ($ret['child'] == 0) {
			$this->do_delete($title_id);
			return;
		}

		$sql = "select * from title where up_id = {$title_id}";
		$child = $this->SQL->fetch_all($sql);
		foreach ($child as $key => $value) {
			$this->delete_title($value['title_id']);
		}
		$this->do_delete($title_id);
	}

	function do_delete($title_id)
	{
		$sql = "select up_id from title where title_id = {$title_id}";
		$ret = $this->SQL->fetch($sql);
		$sql=" select child from title where title_id = '".$ret['up_id']."' ";
		$ret = $this->SQL->fetch($sql);
		$ret['child'] = $ret['child'] - 1;
		$sql = "update title set child = '".$ret['child']."' where title_id='".$title_id."' ";
		$this->SQL->execute($sql);

		$sql = "select id from title_level where title_id = {$title_id}";
		$ret = $this->SQL->fetch_all($sql);
		$arr = array();
		foreach ($ret as $key => $value) {
			$arr[] = $value['id'];
		}
		$str = implode(',', $arr);
		$del = "delete from user_title_level where user_level in ({$str})";
		$this->SQL->execute($del);
		$del = "delete from title_level where title_id = {$title_id}";
		$this->SQL->execute($del);
		$del = "delete from title where title_id = {$title_id}";
		$this->SQL->execute($del);
	}
}
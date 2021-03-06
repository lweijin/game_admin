<?php
class Page{
	/**
	 * @description 
	 * 每页记录数,如果未给定，则默认显示数为 10 条
	 * @var int
    */
	private $PageSize = 10;
	/**
	 *
	 * @description 
	 * 总页数
	 * @var int
    */
	private $TotalPage;
	/**
	 * @description 
	 * 总记录数
	 * @var int
    */
	private $RecordNum;
	/**
	 * @description
	 * 当前页数
	 * @var int
    */
	private $NowPage;
	/**
	 * @description 
	 * 执行的sql语句
	 * @var int
    */
	private $IsEncode = false;
	/**
	 * ******************************************************
	 * @description 循环显示页号数
	 * 默认显示数　10　条
	 * @var int
	 */
	private $CycNum = 5;	
	/**
	 * 
	 * @description 析构函数,该分页类创建对象时，自动调用
	 * 对sql语句进行判断，获取文章每页显示数
	 * @param string $sql
    */
	public function Page($RecordNum,$NowPage,$PageSize = 10)
	{		
		$this->PageSize = $PageSize;
		$this->NowPage = $NowPage;
		$this->RecordNum = $RecordNum;
		$this->TotalPage = ceil($this->RecordNum/$this->PageSize);	
	}
	
	/**
	 * 
	 * @description 
	 * 翻页按扭的显示，如：首页 上页 下页 末页,可以定制自定义翻页按扭样式
	 * 此函数也是 外面调用此类的入口.将返回经处理后的sql语
	 * @param array $ButtonArray
	 * 翻页按扭形式，用户可随意定制：如：
	 * $ButtonArray = array("首页","上页","下页","末页");
	 * @param string $IsNeedStat
	 * 是否显示分页状况，true 显示 false 不显示;如:
	 * 共有 305352 條記錄 當前第 3 頁/共有 30536 頁 每頁顯示 10 條記錄
	 * @param bool $IsDisNum 
	 * 是否显示循环分页，true 显示 false 不显示;如：
	 * 1 2 3 4 5 6 7 8 9 10
	 * @param string $JumpType
	 * 附加选项，通过能参数，可定制跳转框，select 下拉跳转框，text 文
	 * 本输入跳转框，none 不定制任何跳转框
	 * @return string
	 */
	public function EndPage($ButtonArray = array("首页","上一页","下一页","尾页"),$IsNeedStat = true,$IsDisNum = true,$JumpType = "none"){
		if($this->RecordNum>=1){	
			$FirstPage = 1;
			$PrePage  	 = $this->NowPage - 1;
			$NextPage  	 = $this->NowPage + 1;
			$LastPage  	 = $this->TotalPage;
			
			$ReturnStr = "<div id='page'><ul>";
			
			/**
			 * 根据参数$ButtomArray来得到用户定制的按扭，如果参数给出类型
			 * 不正确，则采用系统默认按扭
			 */
			if(!is_array($ButtonArray) or count($ButtonArray) != 4){
				$ButtonArray = array("First","Precede","Next","Last");
			}
			if($IsNeedStat === true){
				$ReturnStr .= $this->PageStat();
			}else{
				$ReturnStr = "";	
			}		
			$ReturnStr  .= $this->ToPage($FirstPage,$ButtonArray[0],"First");
			$ReturnStr  .= " ";
			$ReturnStr  .= $this->ToPage($PrePage,$ButtonArray[1],"Pre");
			if($IsDisNum === true){
				$ReturnStr  .= " ".$this->DisPageNum()." ";
			}elseif($IsDisNum === false){
				$ReturnStr .= " ";
			}else{
				/**
				 * 对参数的合法性，进行审核
				 */
				echo ('<b>Warning</b>:<i>方法EndPage()中参数$IsDisNum的类型是bool,只能是 true或者false</i><br>');
				$ReturnStr .= " ";
			}
			$ReturnStr  .= $this->ToPage($NextPage,$ButtonArray[2],"Next");
			$ReturnStr  .= " ";
			$ReturnStr  .= $this->ToPage($LastPage,$ButtonArray[3],"Last");
			$ReturnStr  .= " ";
			if($JumpType === 'select'){
				$ReturnStr .= $this->JumpSelect('select');
			}elseif($JumpType === 'text'){
				$ReturnStr .= $this->JumpSelect('text');
			}elseif($JumpType === 'none'){
				//待写入
			}else{
				echo ('<b>Warning:</b><i>方法EndPage()中参数$JumpType 的值只能是 select text none </i><br>');
			}
			
			$ReturnStr .= "</ul></div>";
			return $ReturnStr;
		}
	}
	/**
	 * 
	 * @description 
	 * 创建翻页按扭，并根据$Flag 的值来设置按扭是否可用，即：按
	 * 扭是否带有链接,此此函数外界不可访问，属于该类私有方法
	 * @param int $Page 将要跳转的页数
	 * @param string $Msg 跳转按扭名称
	 * @param string $Flag 按扭显示类型的判断
	 * @return string
	 */
	private function ToPage($Page,$Msg,$Flag = ''){
		/*
		 * 对$this->IsEncode为真，则对页数进行解密
		 */
		if($this->IsEncode === true){
			$Page = $this->StrEncode($Page);
		}		
		$Url = $this->GetUrl($Page);
		$UrlStr = "<li><a class='pagelink' href='".$Url."'>".$Msg."</a></li>";
		/*
		 *如果当前页是小于或者等于第1页，那么首页和上页不显示链接
		 * 如果当前页大于或者等于最后一页，那么末页和下页不显示链接
		 * 对于其它情况，四个跳转按扭都显示*******
		 */
		if(($this->NowPage <= 1 and ($Flag == "First" or $Flag == "Pre"))
		or ($this->NowPage >= $this->TotalPage and($Flag == "Next" or $Flag == "Last"))
		or $Flag == "NowPage"){
			$UrlStr = "<li><span>".$Msg."</span></li>";
		}else{
			//待写入
		}
		return $UrlStr;
	}
	/**
	 * 
	 * @description 
	 * 获取当前的URL地址，并对将要跳转的地址做出修改,此方法也属于私有
	 * 方法，外界不可访问，只能被类内部调用
	 * @param int  $Page 将要跳转的页数
	 * @return string
	 */
	private function GetUrl($Page){
		//2007年6月6日进行修改，解决$_SERVER['REQUEST_URI']在IIS服务器中不存在这
		//样的环境变量，需要用用$_SERVER[SCRIPT_NAME]."?".$_SERVER[QUERY_STRING]
		//来组合替代
		if(!isset($_SERVER['REQUEST_URI'])) $request_url = $_SERVER[SCRIPT_NAME]."?".$_SERVER[QUERY_STRING];
		else $request_url = $_SERVER['REQUEST_URI'];
		/*下面代码于2006年12月1日进行了修改，其中$_SERVER['REMOTE_ADDR']被修改成下面的
		 *$_SERVER['SERVER_ADDR'];$_SERVER['REMOTE_ADDR']为远程客户端地址，而$_SERVE
		 *R['SERVER_ADDR']为服务器端地址SERVER_ADDR*/
		if($_SERVER['SERVER_PORT'] == 80){
			$Url = "http://".$_SERVER['SERVER_NAME'].$request_url;
		}else{
			$Url = "http://".$_SERVER['SERVER_NAME'].":".$_SERVER['SERVER_PORT'].$request_url;
		}
	//	$Url = preg_replace("/\?NowPage=[0-9]*&?/i","",$Url);
	//	$Url = preg_replace("/&NowPage = [0-9]*&?/i","",$Url);
		/*** *********************************************
		 * 对url做出修改，将url中的?NowPage = "任何字符" 或者 
		 * $NowPage = "任何字符" 替换成 空，供下面对url的增加
		 *************************************************/
		$Url = preg_replace("/\?NowPage=.*&?/i","",$Url);
		$Url = preg_replace("/&NowPage=.*&?/i","",$Url);
		/***************************************************
		 *如果$Page = 0,则只取得当前URL,不再加向url全传值 
		 ***************************************************/
		if($Page === 0){
			return $Url;
		}
		/*判断先前是否已存在url传值，如果存在，
		 *则加&NowPage=,否则加?/NowPage = 
		 */
		if(preg_match("/\?/",$Url)){
			$Url = $Url."&NowPage=".$Page;
		}else{
			$Url = $Url."?NowPage=".$Page;
		}
		return $Url;
	}
	/**
	 * 
	 * @description 
	 * 对分页状况的一个统计，此方法可以定制，
	 * 即：可要，也可不要，如需要显示当前状况
	 * 在外部需显示的地方调用此方法即可.
	 * @return string
	 */
	private function PageStat(){
		$StatString  = "共有 ".$this->RecordNum." 条记录  ";
		$StatString .= "当前第 ".$this->NowPage." 页/共有 ".$this->TotalPage." 页 ";
		$StatString .= "每页显示 ".$this->PageSize." 条记录";
		return $StatString;
	}
	/**
	 * 
	 * @description 
	 * 创建两种跳转框，一种下拉跳转菜单，一种文本输入菜单
	 * 下拉菜单跳转框，当鼠标选中需跳转的页后，程序自动
	 * 进行跳转到所指定的页数,文本输入菜单则是用户在文本
	 * 框内输入要跳转的页数，鼠标外部单击，刚自己跳转
	 * @param string $JumpType
	 * 跳转菜单类型　select 下拉跳转框　text 文章输入跳转框，
	 * none 不定制任何跳转框
	 */
	private function JumpSelect($JumpType){
		$Url = $this->GetUrl(0);//获取当前url
		/**
		 *判断先前是否被已经URL传值******
		 */
		if(preg_match("/\?/",$Url)){
			$Url = $Url."&NowPage";
		}else{
			$Url = $Url."?NowPage";
		}
		$JumpString  = "轉到";
		if($JumpType === 'select'){
			$JumpString .= "<select id='JumpSelect' name='NowPage' size='1'";
			$JumpString .= "onChange=\"window.location = '".$Url."='+this.value\">";
			for($i = 1; $i <= $this->TotalPage;$i++){
				/**选中当前页*/
				if($this->NowPage == $i){
					$Extra = "selected";
				}else{
				$Extra = "";
				}
				if($this->IsEncode === true){
					$JumpString .= "<option value='".$this->StrEncode($i)."' ".$Extra.">".$i."</option>";
				}else{
					$JumpString .= "<option value='".$i."' ".$Extra.">".$i."</option>";
				}
			}
			$JumpString .= "</select> 頁";
		}elseif($JumpType === 'text'){
			$Title = "鼠标外部单击，文章转向";
			$JumpString .= "<input id='JumpSelect' type='text' size='2' value='".$this->NowPage."'onBlur=\"";
			$JumpString .= "javascript:if(isNaN(parseInt(this.value)) || parseInt(this.value)";
			$JumpString .= " > ".$this->TotalPage."){alert('您输入的数字只能在 1 ～ ".$this->TotalPage;
			$JumpString .= "之间，请重新输入'); return false;}location.href='".$Url."='+parseInt(this.value)\" title='".$Title."'>";
			$JumpString .= " 页";
		}else{
			
		}
		return $JumpString;
	}
	/**
	 * 
	 * @description 对页数进行循环显示，如 1 2 3 4 5 
	 * @return unknown
	 */
	private function DisPageNum(){
		//循环显示规定数目的页号
		if(!isset($PageNumString)){
			$PageNumString = "";
		}
		for($i = $this->NowPage - $this->CycNum;$i < $this->NowPage + $this->CycNum;$i++){
			if($i <= 0){
				$i = 0;
				continue;
			}elseif($i > $this->TotalPage){
				break;
			}elseif($i == $this->NowPage){
				$PageNum = $i;
				$PageNumString .= $this->ToPage($i,$PageNum,"NowPage")." ";
			}else{
				$PageNumString .= $this->ToPage($i,$i)." ";
			}
		}
		return $PageNumString;
	}
	/**
	 * 
	 * 对字符串进行加密
	 * @param string $str
	 * @return string
	 */
	private function StrEncode($str){
		$encodeArr = str_split($str);
		$encode = '';
		for($i = 0; $i < count($encodeArr); $i++){
			$encodeStr = ord($encodeArr[$i]) + $i;
			$encode .= ($encodeStr)."|<<&>>|";
		}
		return urlencode(base64_encode(($encode)));
	}
	/**
	 * 
	 * @description 对字符加密的字符串进行解密
	 * @param string $str
	 * @return string
	 */
	private	function StrDecode($str){
		$decode = base64_decode(urldecode($str));
		$decodeArr = explode("|<<&>>|",$decode);
		$decodeStr = '';
 		for($i = 0;$i < count($decodeArr);$i++){
			if($decodeArr[$i] == '') continue;
 			$decode = $decodeArr[$i];
 			$decode = $decode;
 			$decodeStr .= chr($decode - $i);
 		}
 		return $decodeStr;
	}
}
?>

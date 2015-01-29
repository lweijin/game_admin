<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/skin.css" rel="stylesheet" type="text/css" />
	<link href="css/page.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="js/jquery-1.7.1.min.js"></script>
	<title>{#$NowPage #}</title>
	<style>
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		background-color: #EEF2FB;
		font-size: 12px;
	}
	</style>
	<style type="text/css">
	.hidden{display:none;}
	#smallLay{width:498px; height:100px;padding:4px 10px 10px;background-color:#FFFFFF;border:1px solid #05549d;color:#333333;line-height:24px;text-align:left;-webkit-box-shadow:5px 2px 6px #000;-moz-box-shadow:3px 3px 6px #555;}
	</style>
	<script type="text/javascript">
		function Edit(element)
		{
            var tdIns = $(element);   

            if ( tdIns.children("input").length>0 ){ return false; }          

            var inputIns = $("<input type='text'/>"); //需要插入的输入框代码   
            var text = $(element).html();           

            inputIns.width(tdIns.width()); //设置input与td宽度一致   
            inputIns.val(tdIns.html()); //将本来单元格td内容copy到插入的文本框input中   
            tdIns.html(""); //删除原来单元格td内容   
            inputIns.appendTo(tdIns).focus().select(); //将需要插入的输入框代码插入dom节点中   
            inputIns.click(function(){ 
                return false;
            });  
            inputIns.keyup(function(event){  
                //1.判断是否回车按下   
                //结局不同浏览器获取时间的差异   
                var myEvent = event || window.event;  
                var key = myEvent.keyCode;  
                if(key == 13){
                	var inputNode = $(this);
                	//1.保存当前文本框的内容
                	var inputText = inputNode.val();  
                	//2.清空td里面的内容
                	$(element).html(inputText);
                	$("#save")[0][1].value = $(element).parent().get(0).cells[0].innerHTML;
                	$("#save")[0][2].value = $(element).get(0).attributes["name"].value;
                	$("#save")[0][3].value = inputText;
                	document.getElementById("save").submit();
                }  
            });  
            //处理Enter和Esc事件   
            inputIns.blur(function(){
                var inputText = $(element).val();  
                tdIns.html(inputText);  
                tdIns.html(text);   
            });  
		}

		function add_gateway()
		{
			console.log("add_gateway");
			var current_rows = document.getElementById("add_gateway").rows.length; 
			var insert_tr = document.getElementById("add_gateway").insertRow(current_rows - 2);
			var names = new Array("gateway_id","gateway_name","host","io_port","http_port","srv_port");
			for (var i = 0; i < 6; i++) {
				var insert_td = insert_tr.insertCell(i);
				insert_td.style.textAlign="center";
				var name = names[i];
				insert_td.innerHTML = "<input name= 'params[" + (current_rows - 3) + "][" + name + "]'  value='' type='text' style='width: 100%;height:auto'/>";
			};
			//save_add.parentNode.insertBefore(tr, save_add);
			document.getElementById("save_add").style.display = "";
		}
		function checkall(form)
		{
			console.log(form)
			console.log(form)
		}
	</script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<div class="radiusbox">
					<a href="?command=server_manager">{# $game_server_name #}</a>
				</div>
				<div class="radiusbox">
					<a href="?command=gateway_manager">{# $gateway_name #}</a>
				</div>
			</td>
			<td width="16" valign="top" background="images/mail_rightbg.gif">
				<img src="images/nav-right-bg.gif" width="16" height="29" />
			</td>
		</tr>
		<tr>
			<td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9" align="center">
				<table width="100%" height="auto" border="0" cellpadding="0" cellspacing="1" class="line_table" id = "gateway_list">
					<tr class="item_left">
						<td height="30" colspan="12" background="images/news-title-bg.gif">
							<input type="submit" value="添加" onclick="add_gateway()" />
						</td>
					</tr>

					<tr bgcolor='#cccfff'>
						<th class="left_txt2" width="11%">网关服ID</th>
						<th class="left_txt2" width="11%">网关服名字</th>
						<th class="left_txt2" width="11%">host</th>
						<th class="left_txt2" width="11%">io端口</th>
						<th class="left_txt2" width="11%">http端口</th>
						<th class="left_txt2" width="11%">srv端口</th>
						<th class="left_txt2" width="11%">热更新</th>
						<th class="left_txt2" width="11%">关服</th>
					</tr>
					{# foreach key=key item=gateway from=$gateway_list #}
					<tr bgcolor="#FFFFFF" align="left">
						<td align="center" ondblclick="Edit(this)" name="gateway_id">{# $gateway.gateway_id #}</td>
						<td align="center" ondblclick="Edit(this)" name="gateway_name">{# $gateway.gateway_name #}</td>
						<td align="center" ondblclick="Edit(this)" name="host">{# $gateway.host #}</td>
						<td align="center" ondblclick="Edit(this)" name="io_port">{# $gateway.io_port #}</td>
						<td align="center" ondblclick="Edit(this)" name="http_port">{# $gateway.http_port #}</td>
						<td align="center" ondblclick="Edit(this)" name="srv_port">{# $gateway.srv_port #}</td>
						<form>
							<td align="center">
								<input type="hidden" name="command" value="{# $command#}" />
								<input type="hidden" name="act" value="hotup" />
								<input type="hidden" name="gateway_id" value="{# $gateway.gateway_id#}" />
								<input type="submit" value="热更新" />
							</td>
						</form>
						<form>
							<td align="center">
								<input type="hidden" name="command" value="{# $command#}" />
								<input type="hidden" name="act" value="shot_down" />
								<input type="hidden" name="gateway_id" value="{# $gateway.gateway_id#}" />
								<input type="submit" value="关服" />
							</td>
						</form>
					</tr>
					{# /foreach #}
					
						
					<form id="save">
						<input type="hidden" name="command" value="{# $command#}" />
						<input type="hidden" name="gateway_id" value=""/>
						<input type="hidden" name="k" value=""/>
						<input type="hidden" name="v" value=""/>
						<input type="hidden" name="act" value="edit"/>
					</form>
				</table>
				<form>
					<table width="100%" height="auto" border="0" cellpadding="0" cellspacing="3" class="line_table" id = "add_gateway">
						<tr type = "hidden">
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
							<th type = "hidden" width="11%"></th>
						</tr>
						<tr class="item_left" style="display:none" id = "save_add">
							<td height="30" colspan="12" background="images/news-title-bg.gif">
								<input type="hidden" name="command" value="{# $command#}" />
								<input type="hidden" name="act" value="add"/>
								<input type="submit" value="保存" onclick="checkall(this.form)"/>
							</td>
						</tr>
						<tr bgcolor="#FFFFFF">
							<td height="35px" align="center" colspan="12">{#$page_show#}</td>
						</tr>
					</table>
				</form>
			</td>
			<td background="images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="bottom" background="images/mail_leftbg.gif">
				<img src="images/buttom_left2.gif" width="17" height="17" />
			</td>
			<td background="images/buttom_bgs.gif">
				<img src="images/buttom_bgs.gif" width="17" height="17">
			</td>
			<td valign="bottom" background="images/mail_rightbg.gif">
				<img src="images/buttom_right2.gif" width="16" height="17" />
			</td>
		</tr>
	</table>
</body>
</html>

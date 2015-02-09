<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/skin.css" rel="stylesheet" type="text/css" />
	<link href="css/page.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="js/jquery-1.7.1.min.js"></script>
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
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" valign="top" background="images/mail_leftbg.gif">
				<img src="images/left-top-right.gif" width="17" height="29" />
			</td>
			<td valign="top" background="images/content-bg.gif">
				<div class="radiusbox">
					<a href="?command=game_manager">
						玩家信息查询
					</a>
				</div>
			</td>
			<td width="16" valign="top" background="images/mail_rightbg.gif">
				<img src="images/nav-right-bg.gif" width="16" height="29" />
			</td>
		</tr>
		<tr>
			<td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9" align="center">
				<table width="100%" height="auto" border="0" cellpadding="0" cellspacing="1" class="line_table">
					<form>
						<tr class="item_left">
							<td height="30" colspan="12" background="images/news-title-bg.gif">
								账号：
								<input type="text" name="account" style="width:50px" value="{# $account #}" /> 
								<input name="query_offline" type="checkbox" value="1" />
								离线查询
								<input type="hidden" name="act" value="query_user_info" />
								<input type="hidden" name="command" value="game_manager" />
							</td>
						</tr>
						<tr class="item_left">
							<td height="30" colspan="12" background="images/news-title-bg.gif">
								<input name="table_list[]" type="checkbox" value="user" />
								玩家信息
								<input name="table_list[]" type="checkbox" value="hero_package"/>
								英雄列表
								<input type="submit" value="查询" />
							</td>
						</tr>
						{# if $online_srv #}
						<tr class="item_left">
							<td height="30" colspan="12" background="images/news-title-bg.gif">
								所在服务器：{# $online_srv #}
							</td>
						</tr>
						{# /if #}
					</form> 
					
				</table>
				<table  width="100%" height="auto" border="0" cellpadding="0" cellspacing="1" class="line_table">
					{# foreach key=module_name item=module_info from=$game_user_info #}
					<tr bgcolor='#cccfff' class="radiusbox">
						<th colspan="2">{# $module_info.des #}</th>
					</tr>
					<tr bgcolor='#cccfff'>
						{# foreach key=km item=module_param from=$module_info.info #}
						<th class="left_txt2">{# $module_param.des #}</th>
						{# /foreach #}
					</tr>

					<tr bgcolor="#FFFFFF" align="left">
						{# foreach key=km item=module_param from=$module_info.info #}
						<td align="center">{# $module_param.info #}</td>
						{# /foreach #}
					</tr>
					{# if isset($module_info.list_des) #}
					<tr bgcolor='#FFFFFF'>
						<th height="25px" align="left"  class="radiusbox">{# $module_info.list_des #}</th>
					</tr>
					{# /if #}
					<tr bgcolor='#cccfff'>
						{# foreach key=kd item=list_des from=$module_info.list[0] #}
						<th class="left_txt2">{# $list_des.des #}</th>
						{# /foreach #}
					</tr>

					{# foreach key=ki item=list_info from=$module_info.list #}
					<tr bgcolor="#FFFFFF" align="left">
						{# foreach key=kli item=item_info from=$list_info #}
						<td align="center">{# $item_info.info #}</td>
						{# /foreach #}
					</tr>
					{# /foreach #}

					{# /foreach #}
					<tr bgcolor="#FFFFFF">
						<td height="35px" align="center" colspan="12">{#$page_show#}</td>
					</tr>
				</table>
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

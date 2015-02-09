<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/skin.css" rel="stylesheet" type="text/css" />
	<link href="css/page.css" rel="stylesheet" type="text/css" />
	<script charset="utf-8" src="js/jquery-1.7.1.min.js"></script>
	<script charset="utf-8" src="js/calendar.js"></script>
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
						日志查询
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
								user_id：
								<input type="text" name="user_id" style="width:50px" value="{# $user_id #}" /> 
								code:
								<input type="text" name="code" style="width:50px" value="{# $code #}" /> 
								开始时间：
								<input type="text" name="start_time" style="width:100px" onfocus="HS_setDate(this)" value="{# $start_time #}"/> 
								结束时间：
								<input type="text" name="end_time" style="width:100px" onfocus="HS_setDate(this)" value="{# $end_time #}"/> 
								<input type="hidden" name="act" value="query_log" />
								<input type="hidden" name="command" value="game_manager" />
								<input type="submit" value="查询" />
							</td>
						</tr>
					</form> 
					
				</table>
				<table  width="100%" height="auto" border="0" cellpadding="0" cellspacing="1" class="line_table">
					<tr bgcolor='#cccfff'>
						<th class="left_txt2">code</th>
						<th class="left_txt2">user_id</th>
						<th class="left_txt2">p1</th>
						<th class="left_txt2">p2</th>
						<th class="left_txt2">p3</th>
						<th class="left_txt2">p4</th>
						<th class="left_txt2">p5</th>
						<th class="left_txt2">p6</th>
						<th class="left_txt2">p7</th>
						<th class="left_txt2">update_time</th>
					</tr>
					{# foreach key=k item=info from=$log #}
					<tr bgcolor="#FFFFFF" align="left">
						<td align="center">{# $info.code #}</td>
						<td align="center">{# $info.user_id #}</td>
						<td align="center">{# $info.p1 #}</td>
						<td align="center">{# $info.p2 #}</td>
						<td align="center">{# $info.p3 #}</td>
						<td align="center">{# $info.p4 #}</td>
						<td align="center">{# $info.p5 #}</td>
						<td align="center">{# $info.p6 #}</td>
						<td align="center">{# $info.p7 #}</td>
						<td align="center">{# $info.update_time #}</td>
					</tr>
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

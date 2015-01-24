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
			var old_html = element.innerHTML;
			var new_obj = document.createElement('input');
			new_obj.type = 'text';
			new_obj.onblur = function(){
				element.innerHTML = this.value ? this.value :old_html;
			}
			element.innerHTML = '';
			element.appendChild(new_obj);
			element.trigger("focus").trigger("select");;
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
				<table width="100%" height="auto" border="0" cellpadding="0" cellspacing="1" class="line_table">
					<form>
						<tr class="item_left">
							<td height="30" colspan="12" background="images/news-title-bg.gif">
							</td>
						</tr>
					</form> 

					<tr bgcolor='#cccfff'>
						<th class="left_txt2" width="11%">网关服ID</th>
						<th class="left_txt2" width="11%">网关服名字</th>
						<th class="left_txt2" width="11%">host</th>
						<th class="left_txt2" width="11%">io端口</th>
						<th class="left_txt2" width="11%">http端口</th>
						<th class="left_txt2" width="11%">srv端口</th>
						<th class="left_txt2" width="11%">编辑</th>
						<th class="left_txt2" width="11%">热更新</th>
						<th class="left_txt2" width="11%">关服</th>
					</tr>
					{# foreach key=key item=gateway from=$gateway_list #}
					<tr bgcolor="#FFFFFF" align="left">
						<td align="center" ondblclick="Edit(this)">{# $gateway.gateway_id #}</td>
						<td align="center" ondblclick="Edit(this)">{# $gateway.gateway_name #}</td>
						<td align="center" ondblclick="Edit(this)">{# $gateway.url #}</td>
						<td align="center" ondblclick="Edit(this)">{# $gateway.io_port #}</td>
						<td align="center" ondblclick="Edit(this)">{# $gateway.http_port #}</td>
						<td align="center" ondblclick="Edit(this)">{# $gateway.srv_port #}</td>
						<form>
							<td align="center">
								<input type="hidden" name="command" value="{# $command#}" />
								<input type="hidden" name="act" value="edit" />
								<input type="hidden" name="gateway_id" value="{# $gateway.gateway_id#}" />
								<input type="submit" value="编辑" />
							</td>
						</form>
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
					<tr bgcolor="#FFFFFF">
						<td height="35px" align="center" colspan="12">{#$pageShow#}</td>
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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{# $website_name #}</title>
    <link href="css/skin.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    <!--
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        background-color: #EEF2FB;
    }
    *{ margin:0; padding:0;}

    .main div{position:absolute;width:220px;height:150px;border:1px solid #999;}
    .td_input input{margin:0px 5px;}
    -->
    </style>
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script language="javascript">
    function overLine(src, clrOver){
        src.bgColor = clrOver;
    }
    function outLine(src, clrIn){
       src.bgColor = clrIn;
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
            <div class="radiusbox"><a href="?command=level&act=user">{# $man_title_name #}</a></div>
        </td>
        <td width="16" valign="top" background="images/mail_rightbg.gif">
            <img src="images/nav-right-bg.gif" width="16" height="29" />
        </td>
    </tr>
    <tr>
        <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
        <td valign="top" bgcolor="#F7F8F9" align="center">

            <form name="form1" method="post" action="">    
                <table width="100%"  border="0" cellpadding="0" cellspacing="1" class="line_table">                     
                    <tr class="item_left"> 
                        <td height="30" colspan="3" background="images/news-title-bg.gif">
                            角色：<input type="text" name="user_name" value="{#$user.user_name#}">
                        </td>
                    </tr>
                    <tr bgcolor='#cccfff'>
                        <th class="left_txt2" width="60px">模块id</th>
                        <th class="left_txt2" width="200px">模块名称</th>
                        <th class="left_txt2" align="left">权限</th>
                    </tr>    
                    {# foreach key=row_keys item=row_value from=$article_row #}
                    <tr class="left_txt" align="center" bgcolor="#ffffff"  onmouseover="overLine(this,'#e1e5ee');" onmouseout="outLine(this,'#ffffff');">  
                        <td align="center">{# $row_value.title_id #}</td>
                        <td align="left">{# $row_value.new_title_name #}</td>
                        <td align="left" class="td_input">
                            {# foreach key=level_keys item=level_value from=$level_row[$row_value.title_id] #}
                            <input type="checkbox" name="level[{# $level_value.id #}]" style="margin-left:10px" {# if $role_level[$level_value.id] #} checked {# /if #}>{# $level_value.level_name #}
                            {# /foreach #}
                        </td>
                    </tr> 
                    {# /foreach #}   
                    <tr> 
                        <td height="20" colspan="3" align="left">
                            <input type="hidden" value="{#$act#}" name="act">
                            <input type="hidden" value="{#$user.user_id#}" name="user_id">
                            <input type="submit" value="保存" name="submit">
                        </td>
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
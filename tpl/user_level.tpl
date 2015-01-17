<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/skin.css" rel="stylesheet" type="text/css" />
    <title>{# $website_name #}</title>
    <style>
    body {
        margin-left: 0px;
        margin-top: 0px;
        margin-right: 0px;
        margin-bottom: 0px;
        background-color: #EEF2FB;
        font-size:12px;
    }
    </style>

    <script type="text/javascript">
    function add()
    {
        var obj = document.getElementById('role');
        if(obj.value=="")
        {
            alert("角色不能为空，请输入！");
            obj.focus();
            return false;
        }
        document.form.submit();
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
                    <a href="?command=level&act=user">{# $man_title_name #}</a>
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
                    <tr class="item_left">
                        <td height="30" colspan="3" background="images/news-title-bg.gif">
                            当前页：<strong>{# $website_name #}</strong>
                        </td>
                    </tr>
                    <tr bgcolor='#cccfff'>
                        <th class="left_txt2" width="33%">ID</th>
                        <th class="left_txt2" width="33%">角色</th>
                        <th class="left_txt2" width="33%">操作</th>
                    </tr>
                    {# foreach key=key item=item  from=$all_user #}
                    <tr bgcolor="#FFFFFF" align="left">
                        <td align="center">{# $item.user_id #}</td>
                        <td align="center">{# $item.user_name #}</td>
                        <td align="center">
                            <a href="?command=level&act=edit&user_id={# $item.user_id #}">修改</a>&nbsp;|&nbsp;
                            <a href="?command=level&act=del&user_id={# $item.user_id #}" onclick="return confirm('您确定要删除此角色吗？')">删除</a>
                        </td>
                    </tr>
                    {# /foreach #}
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
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
    -->
    </style>
</head>
<body>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td width="17" valign="top" background="images/mail_leftbg.gif">
                <img src="images/left-top-right.gif" width="17" height="29"/>
            </td>
            <td valign="top" background="images/content-bg.gif">
                <div class="radiusbox">
                    <a href="?command=article">
                        {# $man_title_name #}
                    </a>
                </div>
                {# if $user_level.add #}
                <div class="radiusbox">
                    <a href="?act=add&command=article">{# $add_title_name #}</a>
                </div>
                {# /if #}
            </td>
            <td width="16" valign="top" background="images/mail_rightbg.gif">
                <img src="images/nav-right-bg.gif" width="16" height="29" />
            </td>
        </tr>
        <tr>
            <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
            <td valign="top" bgcolor="#F7F8F9" align="center">

                <table width="100%"  border="0" cellpadding="0" cellspacing="1" class="line_table">                     
                    <tr class="item_left"> 
                        <td height="30" colspan="14" background="images/news-title-bg.gif">当前页:<strong>{# $website_name #}</strong></td>
                    </tr>
                    <tr bgcolor='#cccfff'>
                        <th class="left_txt2">模块id</th>
                        <th class="left_txt2">模块名称</th> 
                        <th class="left_txt2">根模块名</th>
                        <th class="left_txt2">上级模块名</th>
                        <th class="left_txt2">子模块个数</th> 
                        <th class="left_txt2">关联文件</th>  
                        <th class="left_txt2">模块层级</th>  
                        <th class="left_txt2">是否在左边显示</th>  
                        {# if $user_level.del #}
                        <th class="left_txt2">
                            操作
                        </th>
                        {# /if #}  
                    </tr>    
                    {# foreach key = keys item = value from = $array_roots #}
                    <tr class="left_txt" align="center" bgcolor="#ffffff" onMouseOver="this.bgColor='#e1e5ee';" onMouseOut="this.bgColor='#ffffff';">
                        <td>{# $value.title_id #}</td>
                        <td align="left">{# $value.new_title_name #}</td>
                        <td>{# $value.root_name #}</td>   
                        <td>{# $value.up_name #}</td>
                        <td>{# $value.child #}</td>
                        <td>{# $value.url #}</td>
                        <td>{# $value.grade #}</td>      
                        <td>
                            {# if $value.show_left #}
                            <span style="color:red">是</span>
                            {# else #}
                            否
                            {# /if #}
                        </td>			
                        {# if $user_level.del #}
                        <td>
                            <a onclick="return confirm('确定删除该栏目吗？')" href="?act=del&title_id={# $value.title_id #}&command=article">删除</a>
                        </td>
                        {# /if #}  
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
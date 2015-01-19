<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN""http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{# $website_name #}</title>
    <link href="css/skin.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./js/jquery-1.7.1.min.js"></script>
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
    <script language="javascript">	
    function overLine(src, clrOver)
    {
        src.bgColor = clrOver;
    }

    function outLine(src, clrIn)
    {
        src.bgColor = clrIn;
    }

    function operation(act)
    {
        var tid = $("#title_id").val();
        var name = $("#ln_txt").val();
        var key = $("#lk_txt").val();
        var id = $("#id").val();
        switch(act)
        {
            case 'add':
            url = '?command=level&act=save_article_add&tid='+tid+'&name='+name+'&key='+key;
            break;
            case 'edit':
            url = '?command=level&act=save_article_edit&tid='+tid+'&name='+name+'&key='+key+'&id='+id;
            break;
            case 'del':
            url = '?command=level&act=article_del&id='+id;
            break;
        }
        window.location.href = url;
    }	

    function showKey(tid,name,key,id)
    {
        $("option[value='"+tid+"']").attr('selected',true);
        $("#ln_txt").val(name);
        $("#lk_txt").val(key);
        $("#id").val(id);
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
                <div class="radiusbox">{# $website_name #}</div>
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
                                模块名称：<select name="title_id" id="title_id">
                                {# foreach key=keys item=title from=$row #}
                                <option value="{# $title.title_id #}">{# $title.drop_title_name #}</option>
                                {# /foreach #}
                            </select>
                            权限name：<input type="text" id="ln_txt" style="width:50px;">
                            权限key：<input type="text" id="lk_txt">
                            {#if $user_level.add#}<input type="button" value="新增" onClick="operation('add')">{#/if#}
                            {#if $user_level.edit#}<input type="button" value="修改" onClick="operation('edit')">{#/if#}
                            {#if $user_level.del#}<input type="button" value="删除" onClick="operation('del')">{#/if#}
                            <input type="hidden" id="id">
                        </td>
                    </tr>
                    <tr bgcolor='#cccfff'>
                        <th class="left_txt2" width="50%">模块名称</th> 
                        <th class="left_txt2" width="50%">权限名称</th>
                    </tr>
                    {# foreach key=keys item=arr from=$row #}
                    <tr class="left_txt" align="center" bgcolor="#ffffff" onMouseOver="overLine(this,'#e1e5ee');" onMouseOut="outLine(this,'#ffffff');">
                        <td align="left">{# $arr.new_title_name #}</td>  
                        <td align="left">
                            {# foreach key=keys item=itm from=$rowL[$arr.title_id] #}
                            <span style="margin-right:10px; cursor:pointer;" onClick="showKey('{#$arr.title_id#}','{#$itm.level_name#}','{#$itm.level_key#}','{#$itm.id#}')">{#$itm.level_name#}</span>
                            {#/foreach#}
                        </td>
                    </tr>
                    {# /foreach #}
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

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
    select .a1{ background-color:#66FFFF; text-align:center; border-bottom:solid #CC0000 }
    select .a2{ background-color:#FFFFCC;}
    </style>
    <script src="js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function(){	  
        function trim(str)
        { 
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }
        // 得到字符串的真实长度（双字节换算为两个单字节）  
        function getStrActualLen(sChars)  
        {  
            return sChars.replace(/[^\x00-\xff]/g,"xx").length;  
        }     

        $("#sub").submit(function(){
            if(document.form1.title_name.value==""){  
                $("#yan1").html("请输入模块名称！");   
                return false;   
            }
        }); 	
    }); 
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
                    <a href="?command=article">{# $man_title_name #}</a>
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
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr class="item_left"> 
                        <td height="30" background="images/news-title-bg.gif">当前页:<strong>{# $website_name #}</strong></td>
                    </tr>
                    <tr>
                        <td valign="top" align="left">       
                            <form action="index.php" method="POST" name="form1" id="sub">
                                <table width="100%" height="auto" border="0" cellpadding="0" cellspacing="1" class="line_table">
                                    <tr bgcolor="#FFFFFF" class="left_txt">
                                        <td height="35" width="100">模块层级:</td>
                                        <td width="160">            
                                            <select   name="grade" id="user_level">
                                                <option value="0">一级模块:</option>
                                                {# foreach key=keys item=value from=$array_module #}
                                                <option value="{# $value.title_id #}">
                                                    {# $value.drop_title_name #}
                                                </option>
                                                {# /foreach #}
                                            </select>
                                        </td>
                                        <td id="yan7" style="color:red; text-align:left;"></td>
                                    </tr> 
                                    <tr bgcolor="#FFFFFF" class="left_txt">
                                        <td height="35">模块名称:</td>
                                        <td>
                                            <input type="text" value="" name="title_name" id="title_name">
                                        </td>
                                        <td id="yan1" style="color:red; text-align:left;"></td>
                                    </tr> 
                                    <tr bgcolor="#FFFFFF" class="left_txt">
                                        <td height="35">模块文件:</td>
                                        <td>
                                            <input type="text" value="" name="url" id="url">
                                        </td>
                                        <td id="yan2" align="left" style="color:red">&nbsp;</td>
                                    </tr>
                                    <tr bgcolor="#FFFFFF" class="left_txt">
                                        <td height="35">是否显示:</td>
                                        <td height="35" style="line-height:35px;">
                                            <input type="radio" value="1" name="show_left" checked>显示&nbsp; &nbsp;
                                            <input type="radio" value="0" name="show_left">不显示
                                        </td>
                                        <td id="yan3" style="color:red">是否作为显性模块显示在左边</td>
                                    </tr>
                                    <tr bgcolor="#FFFFFF">
                                        <td align="right" height="35" ></td>
                                        <td>
                                            <input type="submit"  value="提交" name="submit" style="width:80px; height:30px; cursor:pointer">
                                        </td>
                                        <td >&nbsp;
                                            <input type="hidden" value="{#$act#}" name="act">
                                        </td>
                                        <td >&nbsp;
                                            <input type="hidden" value="article" name="command">
                                        </td>
                                    </tr>          
                                </table>
                            </form>
                        </td>
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

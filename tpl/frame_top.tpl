<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--<meta http-equiv="refresh" content="60">-->
    <link href="css/skin.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
    function logout(){
        if (confirm("您确定要退出控制面板吗？"))
            top.location = "login.php?act={#$act#}";
        return false;
    }
    function Submit_onclick(){
        if(parent.mainFrame.cols=="193,*"){
            parent.mainFrame.cols="0%,*";
        //document.getElementById("ImgArrow").src="images/ar.gif";
    }else{
        parent.mainFrame.cols="193,*"
        //document.getElementById("ImgArrow").src="images/al.gif";
    }
}
</script>
</head>
<body leftmargin="0" topmargin="0" >
    <table width="100%" height="50" border="0" cellpadding="0" cellspacing="0" class="admin_topbg">
      <tr>
        <!--td width="185" height="45" valign="top"><img src="images/logo.png"  height="26"!-->
        <!--/td-->
        <td  valign="top">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >
              <tr>
                <td  height="38" align="right" class="admin_txt">管理员：<b><span class="left_ts">{# $user_name #}</span></b> 您好,感谢登陆使用！
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span id="time">
                        <script language="Javascript">
                        var str=document.getElementById("time");
                        str.innerHTML=new Date().getFullYear()+'年'+(new Date().getMonth()+1)+'月'+new Date().getDate()+'日 　星期'+'日一二三四五六'.charAt(new Date().getDay());
                        </script>
                    </span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                </td>  
                <td width="50" height="20" style="padding-top:12px;" ><a href="#" target="_self" onClick="Submit_onclick();"><img id="ImgArrow" src="images/icon2_004.png" alt="菜单折叠" width="16" height="16" border="0"></a>&nbsp;&nbsp;</td> 
                <td width="50" height="20" style="padding-top:12px;"><a href="#" target="_self" onClick="logout();"><img src="images/out.gif" alt="安全退出" width="46" height="20" border="0"></a>&nbsp;&nbsp;</td> 
                <td width="20">&nbsp;</td>
            </tr>
            <tr>
                <td height="5" colspan="4">&nbsp;</td>
            </tr>
        </table></td>
    </tr>
</table>
</body>
</html>
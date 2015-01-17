<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>{# $website_name #}</title>
  <link rel="stylesheet" type="text/css" href="css/style.css"/>
  <script language="javascript">
  function login_check()
  {
    var user_name=document.getElementById("user").value;
    var txt_pwd=document.getElementById("pwd").value;
    var txt_auth=document.getElementById("chknumber").value;

    if(user_name=="")
    {
           // alert("用户名错误!英文字母、数字、下划线、连字符号（3-20个字符，只能以字母开头");

           document.login_form.txt_user.focus();
           return false;
         }

         if(txt_pwd=="")
         {
           // alert("密码不能为空！且必须6-10个字符！");
           
           document.login_form.txt_pwd.focus();
           return false;
         }
         if(txt_auth =="")
         {
          //  alert("验证码不能为空,请按照图片填写！");

          document.login_form.txt_auth.focus();
          return false;
        } 

        document.login_form.submit();
      }
//-------------------- 
function refreshimg()
{
 document.getElementById("checkcode").src='authimg.php?'+Math.random(1);
} 
//--------------------  
function login_re()
{
 document.getElementById("user").value='';
 document.getElementById("pwd").value='';
 document.getElementById("chknumber").value='';
}  
</script> 

</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  onload="login_form.txt_user.focus()">
  <div id="top"> </div>
  <form name="login_form" action="" method="post"  onSubmit=" return login_check();" style="margin:0; padding:0;">  
   <div style="width:100%; height:auto; margin:0 auto; padding:0; text-align:center; "> 
    <div style="width:849px; margin:0 auto; clear:both; text-align:center;  padding:0; height:auto;">
      <div id="center">
        <div id="center_left"></div>
        <div id="center_middle">
          <div class="user">
            <label>用户名：
              <input type="text" name="txt_user" id="user" />
            </label>
          </div>
          <div class="user">
            <label>密　码：
              <input type="password" name="txt_pwd" id="pwd" />
            </label>
          </div>
          <div class="chknumber">
            <label>验证码：
              <input name="txt_auth" type="text" id="chknumber" maxlength="4" class="chknumber_input" />     
            </label>
            <a href='javascript:refreshimg()' title='看不清楚，换个图片' ><img id='checkcode' src='authimg.php'  align="middle" border="0" name="checkcode"></a> 
          </div>
        </div>
        <div id="center_middle_right"></div>
        <div id="center_submit">
          <div class="button">
            <input type="submit" value="" class="formsb">
          </div>
          <div class="button">
            <input type="reset" name="reset" onClick="return login_re();" value="" class="formrb">
            <input type="hidden" name="act" value="{#$act#}">
          </div>
        </div>
        <div id="center_right"></div>
      </div>
    </div>
  </div>
</form>
<div id="footer"></div>
</body>
</html>
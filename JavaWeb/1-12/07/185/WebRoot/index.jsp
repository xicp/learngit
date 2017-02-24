<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" rel="stylesheet" type="text/css" >
<script language="javascript" type="">
function checkEmpty(){
if(document.form.name.value==""){
alert("用户名不能为空")
document.form.name.focus();
return false;
}
if(document.form.password.value==""){
alert("密码不能为空")
document.form.password.focus();
return false;
}
}
</script>

<title>使用过滤器身份验证</title>
</head>

<body>	
	<h3>&nbsp;</h3>
	<p align="center">使用过滤器身份验证</p>
	<form name="form" method="post" action="loginresult.jsp" onSubmit="return checkEmpty()">
<table width="220"  border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="808080">
	
  <tr>
    <td align="center">用户名：</td>
    <td ><input name="name" type="text"></td>
  </tr>
  <tr>
    <td align="center">密&nbsp;&nbsp;码：</td>
    <td><input name="password" type="password"></td>
  </tr>
  <tr>
  	<td align="center" colspan="2">  		
  		<input type="submit" name="Submit" value="登录">
  		<input type="submit" value="退出"/>
  	</td>
  </tr>
</table><br>
</form>

</body>
</html>

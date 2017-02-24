<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限验证Filter</title>
<style type="text/css">
body, td, div, input {
	font-size: 20px; 
}
.error {
	padding: 3px; 
	border: 1px solid #FF0000; 
	background: url(images/error.gif) 8px 5px no-repeat lightblue; 
	padding-left: 50px; 
}
</style>
</head>
<body>

<div class="error" align="center">
${ message } 


</div>

<form action="" method="post" >
	<table align="center">
		<tr>
			<td>账号</td>
			<td><input type="text" name="account" /></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input type="password" name="password" /></td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td><input type="submit" value=" 登录 " /></td>
		</tr>
	</table>
</form>

</body>
</html>
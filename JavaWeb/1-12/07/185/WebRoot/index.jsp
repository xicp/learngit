<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/style.css" rel="stylesheet" type="text/css" >
<script language="javascript" type="">
function checkEmpty(){
if(document.form.name.value==""){
alert("�û�������Ϊ��")
document.form.name.focus();
return false;
}
if(document.form.password.value==""){
alert("���벻��Ϊ��")
document.form.password.focus();
return false;
}
}
</script>

<title>ʹ�ù����������֤</title>
</head>

<body>	
	<h3>&nbsp;</h3>
	<p align="center">ʹ�ù����������֤</p>
	<form name="form" method="post" action="loginresult.jsp" onSubmit="return checkEmpty()">
<table width="220"  border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="808080">
	
  <tr>
    <td align="center">�û�����</td>
    <td ><input name="name" type="text"></td>
  </tr>
  <tr>
    <td align="center">��&nbsp;&nbsp;�룺</td>
    <td><input name="password" type="password"></td>
  </tr>
  <tr>
  	<td align="center" colspan="2">  		
  		<input type="submit" name="Submit" value="��¼">
  		<input type="submit" value="�˳�"/>
  	</td>
  </tr>
</table><br>
</form>

</body>
</html>

<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>�����鿴�����û�</title>
</head>
<script language="javascript">
function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("����Ϣ����Ϊ��");
return false;
}
}
}
</script>
<link href="css/style.css" rel="stylesheet" type="text/css">
<body>
<div align="center">
  <table width="400" height="150" border="0" cellpadding="0" cellspacing="0" bgcolor="lightblue">
  	<Tr><td>&nbsp;</td></Tr>
    <tr>
      <td align="center">
	    <form name="form" method="post" action="LoginList.jsp" onSubmit="return checkEmpty(form)">
    <input type="text" name="user"><br><br>
    <input type="submit" name="Submit" value="��¼����">
  </form>
	  </td>
    </tr>
  </table>
</div>
</body>
</html>

<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>利用监听使服务器端机器免登录</title>
</head>
<%

String login=(String)request.getAttribute("login");
if(login.equals("true")){
response.sendRedirect("telnet.htm");
}
%>
<body><div align="center">

 <table width="335" height="225">
   <tr>
     <td bgcolor="lightblue" align="center">
	  <form name="form1" method="post" action="telnet.htm">
   <input type="submit" name="Submit" value="登录">
 </form> 
 </tr>
 </table>
</div>
</body>
</html>

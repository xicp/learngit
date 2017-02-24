<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>使用过滤器进行网站流量统计纪录</title>
</head>

<body>
<div align="center">

  <table width="300" height="100" border="0" cellpadding="0" cellspacing="0" >
  	<tr align="center" bgcolor="lightblue"><Td>日前在线访问流量是：</Td></tr>
    <tr align="center">
    <td><%=request.getAttribute("num")%>人访问过</td>
    </tr>
  </table>
  <br>
</div>
</body>
</html>

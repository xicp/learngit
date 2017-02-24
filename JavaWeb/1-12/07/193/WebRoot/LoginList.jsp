<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.*"%>
<%@ page import="com.mr.listener.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>监听查看在线用户</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head>
<%
LoginList list=LoginList.getInstance();
LoginNote ut=new LoginNote();
String name=request.getParameter("user");
ut.setUser(name);
session.setAttribute("list",ut);
list.addLoginList(ut.getUser());
session.setMaxInactiveInterval(10);
%>
<body>
<div align="center">


<table width="400" height="150" border="0" cellpadding="0" cellspacing="0" bgcolor="lightblue">
	<tr align="center"><td>用户在线列表</td></tr>
  <tr>
    <td align="center"><br>
 
 <textarea rows="5" cols="22">
<%
Vector vector=list.getList();
if(vector!=null&&vector.size()>0){
for(int i=0;i<vector.size();i++){
 out.println(vector.elementAt(i)+"己登录在线");
}
}
%>
</textarea><br><br>
 <a href="loginOut.jsp">返回</a>
 </td>
  </tr>
</table>
</div>
</body>
</html>

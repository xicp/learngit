<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>写入cookie</title>
</head>
<body>
<%
request.setCharacterEncoding("GB18030");							//设置请求的编译为GB18030
String user=URLEncoder.encode(request.getParameter("user"),"GB18030");			//获取用户名
Cookie cookie = new Cookie("mrCookie", user+"#"+new java.util.Date().toLocaleString());//创建并实例化cookie对象
cookie.setMaxAge(60*60*24*30);									//设置cookie有效期30天
response.addCookie(cookie);									//保存cookie
%>
<script type="text/javascript">window.location.href="index.jsp"</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>д��cookie</title>
</head>
<body>
<%
request.setCharacterEncoding("GB18030");							//��������ı���ΪGB18030
String user=URLEncoder.encode(request.getParameter("user"),"GB18030");			//��ȡ�û���
Cookie cookie = new Cookie("mrCookie", user+"#"+new java.util.Date().toLocaleString());//������ʵ����cookie����
cookie.setMaxAge(60*60*24*30);									//����cookie��Ч��30��
response.addCookie(cookie);									//����cookie
%>
<script type="text/javascript">window.location.href="index.jsp"</script>
</body>
</html>

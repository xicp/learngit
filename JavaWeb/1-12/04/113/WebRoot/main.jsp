<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
String username=(String)session.getAttribute("username");	//��ȡ������session��Χ�ڵ��û��� 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ϵͳ��ҳ</title>
</head>
<body>
���ã�[<%=username %>]��ӭ�����ʣ�<br>
<a href="exit.jsp">[�˳�]</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>结果页</title>
</head>
<body>
<%String message=request.getAttribute("result").toString(); %>
<%=message %>
</body>
</html>

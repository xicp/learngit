<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>通过request对象进行数据传递</title>
</head>
<body>
<%
try{													//捕获异常信息
	int money=100;
	int number=0;
	request.setAttribute("result",money/number);				//保存执行结果
}catch(Exception e){
	request.setAttribute("result","很抱歉，页面产生错误！");		//保存错误提示信息
}
%>
<jsp:forward page="deal.jsp"/>
</body>
</html>

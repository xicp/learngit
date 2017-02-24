<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  
  	<!-- 导入打开窗口的JavaBean类 -->
  	<jsp:useBean id="myWindow" class="com.lh.bean.ShowWindow"></jsp:useBean>
  	<!-- 设置打开窗口的JavaScript函数名 -->
	<jsp:setProperty property="functionName" name="myWindow" value="openWindow1"/>
	<!-- 设置打开窗口的url地址 -->
	<jsp:setProperty property="url" name="myWindow" value="window.jsp"/>
	<!-- 设置打开窗口的宽度 -->
	<jsp:setProperty property="width" name="myWindow" value="200"/>
	<!-- 设置打开窗口的高度 -->
	<jsp:setProperty property="height" name="myWindow" value="100"/>
	<!-- 获得打开窗口的JavaScript函数字符串 -->
	<jsp:getProperty property="openWindowStr"  name="myWindow" />
    <form action="window.jsp" method="post">
    	<input  type="button" value="打开窗口" onclick="openWindow1()"/>
    </form>
  </body>
</html>

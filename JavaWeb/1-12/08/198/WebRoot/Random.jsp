<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>随机数小游戏</title>
    
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
    	<%Random rd = new Random(); %>
    	<c:set var="num">
    		<%=rd.nextInt(5)%>
    	</c:set>
    	<c:choose>
    		<c:when test="${num==1}">随机数为：1 恭喜你前进5格</c:when>
    		<c:when test="${num==2}">随机数为：2 十分晦气原地不动</c:when>
    		<c:when test="${num==3}">随机数为：3 中大奖了移动速度加50%</c:when>
    		<c:when test="${num==4}">随机数为：4 舟车疲劳倒退3格</c:when>
    		<c:otherwise>快去充电吧！！</c:otherwise>
    	</c:choose>
  </body>
</html>

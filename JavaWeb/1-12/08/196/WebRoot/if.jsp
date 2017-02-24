<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>JSTL根据参数不同显示不同的页面</title>
    
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
  <fieldset>
			<c:if test="${ param.action == 'mon' }">
					周一了：工作了第一天，要加油哦
			</c:if>
			<c:if test="${ param.action == 'tues' }">		
					周二了：工作了两天了，要适当补充体力哦
			</c:if>
			<c:if test="${ param.action == 'wed' }">
					周三了：忙碌的生活要学会调节
			</c:if>
			<c:if test="${ param.action == 'thu' }">
					周四了：偶尔偷下懒儿，不算过份哦
			</c:if>
			<c:if test="${ param.action == 'fri' }">
				周五了:加油明天就要休息了，HOHO
			</c:if>
			<c:if test="${ param.action == 'sat' }">
				周六了：和死党们出去HAPPY吧
			</c:if>
			<c:if test="${ param.action == 'sun' }">
				周日：要收敛一下活动，明个要上班呢
			</c:if>
	</fieldset>
  </body>
</html>

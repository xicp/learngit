<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Locale"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>利用JSTL显示所有地区的数据格式</title>
<style type="text/css">
table, td, tr {font-size: 12px; }
table {
	border-collapse: collapse;
	border: 1px solid #000000;
	background: #EEEEEE;
}
td, th {
	border: 1px solid #000000;
	padding: 2px; 
	padding-left: 10px; 
	padding-right: 10px; 
	
}
.title {
	background: lightblue; 
}
.title td {
	text-align: center;
	background: #EEEEEE;
}
</style>
</head>
<body>

<%			//把所有的Locale存储到request作用域中 
	request.setAttribute("localeList", Locale.getAvailableLocales());
%>
<div>
	本地区为:<%=Locale.getDefault().getDisplayName() %>
</div>
<table>
	<tr class="title">
		<th>地区</th>
		<th>语言</th>
		<th>日期时间格式</th>
		<th>数字格式</th>
		<th>货币格式</th>
	</tr>	
	<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
	<c:forEach var="locale" items="${ localeList }">
		<fmt:setLocale value="${ locale }" />
		<tr>
			<td align="left">${ locale.displayName }</td>
			<td align="left">${ locale.displayLanguage }</td>
			<td><fmt:formatDate value="${ date }" type="both"/></td>
			<td><fmt:formatNumber value="100900.9" /></td>
			<td><fmt:formatNumber value="100900.9" type="currency" /> </td>
		</tr>	
	</c:forEach>
</table>
</body>
</html>
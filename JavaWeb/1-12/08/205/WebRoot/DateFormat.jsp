<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Locale"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>利用JSTL对日期格式化</title>
<style type="text/css">
body{
	font-size: 14px; 
}
table {
	border-collapse: collapse;
	border: 1px solid #000000;
	margin-top: 5px; 
	background: #EEE
}
td {
	border: 1px solid #000000;
	padding: 2px; 
	text-align: center;
	font-size: 12px; 
}

.title td {
	background: #CCCCCC; 
	width: 100px; 
}

</style>
</head>
<body>
<div align="center">日期格式化标签</div>
<%
	Field[] field = Locale.class.getFields();

	List<Locale> localeList = new ArrayList<Locale>();

	for(int i=0; i<field.length; i++){
	    if(field[i].getType().equals(Locale.class)){
	        localeList.add((Locale)field[i].get(null));
	    }
	}
	request.setAttribute("localeList", localeList);
%>
<table align="center">
	<tr>
		<td>地区缩写</td>
		<td>日期与时间</td>
		<td>数字</td>
		<td>货币</td>
	</tr>	
	<jsp:useBean id="date" class="java.util.Date"></jsp:useBean>
	<c:forEach var="locale" items="${ localeList }">
		<fmt:setLocale value="${ locale }"/>
		<tr>
			<td>${ locale }</td>
			<td><fmt:formatDate value="${ date }" type="both"/></td>
			<td><fmt:formatNumber value="430000.52" /></td>
			<td><fmt:formatNumber value="430000.52" type="currency" /> </td>
		</tr>	
	</c:forEach>	
</table>
</body>
</html>
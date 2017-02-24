<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>使用c:forEach遍历List中所有的集合</title>
	</head>
	<body>
		<%
			List<String> list = new ArrayList<String>(); //创建List集合对象
			list.add("松下问童子"); //添加List中的元素
			list.add("言师采药去");
			list.add("只在此山中");
			list.add("云深不知处");
			request.setAttribute("list", list); //将List集合保存到request对象中
		%>

		<table align="center" cellpadding="0" cellspacing="0" border="2"
			bgcolor="lightblue">
			<Tr>
				<Td>
					<b>遍历List集合的全部元素：</b>
					<br>
					<c:forEach items="${requestScope.list}" var="keyvalue"
						varStatus="id">
	                     ${id.index }&nbsp;${keyvalue}<br>
					</c:forEach>
				</Td>
			</Tr>
			<Tr>
				<td>
					<b>遍历List中所有的元素输出第一个和最后一句：</b>
					<br>
					<c:forEach items="${requestScope.list}" var="keyvalue"
						varStatus="id" begin="0" step="3">
	                     ${id.index }&nbsp;${keyvalue}<br>
					</c:forEach>
				</td>
			</Tr>
		</table>

	</body>
</html>

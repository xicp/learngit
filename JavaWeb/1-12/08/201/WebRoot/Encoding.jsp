<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>利用JSTL标签设置编码格式</title>
		<style>
body,input {
	font-size: 12px;
}
</style>
	</head>
	<body>

		<fmt:requestEncoding value="UTF-8" />

		<form action="${ pageContext.request.requestURI }" method="post">
			<table height="50" width="300" cellpadding="0" cellspacing="0"
				align="center" bgcolor="lightblue">
				<Tr>
					<Td>
						关键字：
						<input name="key" />
						<c:out value="${ param.key }" default="请输入"></c:out>
					</Td>
				</Tr>
				<tr>
					<Td>
						<input type="submit" value="验 证">
					</Td>
				</tr>
			</table>
		</form>

	</body>
</html>
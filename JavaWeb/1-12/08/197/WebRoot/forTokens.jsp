<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>使用forTokens遍历以特定分隔字符串</title>
		<style>
table {
	border-collapse: collapse;
	border: 1px #000000 solid;
}

td {
	border: 1px #000000 solid;
	text-align: center;
	width: 150px;
}
</style>
	</head>
	<body>

		<table>
			<tr bgcolor="#CCCCCC">
				<td>
					分隔号
				</td>
				<td>
					其值
				</td>
			</tr>
			<c:forTokens
				items="JSP开发王*Spring技术内幕*深入浅出Hibernate*精通JavaWeb整合开发*视频学JavaWeb*JavaWeb开发实战宝典*JavaWeb整合之王者归来*JSP范例宝典*精通JSP编程"
				delims="*" var="item" varStatus="varStatus" begin="1" end="8">
				<tr>
					<td>
						${ varStatus.index }
					</td>
					<td>
						${ item }
					</td>
				</tr>
			</c:forTokens>
		</table>

	</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL的资源国际化</title>
</head>
<body>
<div align="center">JSTL的资源国际化</div>
<table align="center" cellpadding="0" cellspacing="0" height="80" width="300" border="2" bordercolor="blue">
<fmt:bundle basename="messages">
<Tr>
<Td align="center">
	<fmt:message key="prompt.hi">
		<fmt:param value="Mingri"></fmt:param>
	</fmt:message>
	<fmt:message key="prompt.greeting"></fmt:message></Td>
</Tr>
</fmt:bundle>
</table>
</body>
</html>
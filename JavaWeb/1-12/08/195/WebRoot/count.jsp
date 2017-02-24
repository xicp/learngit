<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl实现网站计数器功能</title>
</head>
<body>
<table align="center" cellpadding="0" cellspacing="0" bgcolor="lightblue">
<c:set var="allCount" value="${ allCount + 1 }" scope="application"></c:set>
<c:set var="count" value="${ count + 1 }" scope="session"></c:set>
<Tr><td>
今天访问本网站总人数为：${ allCount } <br/>
今天您访问了此网站次数为：${ count } <br/>
</td></Tr>
<c:set var="test" value="by property"></c:set>
<c:set var="test">by body</c:set>
</table>
<br/>
<br/>
<%
	request.setAttribute("user", new com.mr.bean.User());
	request.setAttribute("map", new java.util.HashMap());
%>
<c:set target="${ user }" property="name" value="${ param.name }"></c:set>
${ user.name }

<c:set target="${ map }" property="name" value="${ param.name }" />
${ map.name }

</body>
</html>
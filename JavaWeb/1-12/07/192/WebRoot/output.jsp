<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ pageContext.request.requestURI }</title>
</head>
<body>

<div align="center" style="font-size: x-large">用户在浏览的是： ${ pageContext.request.requestURI }?${ pageContext.request.queryString }.</div> 

</body>
</html>
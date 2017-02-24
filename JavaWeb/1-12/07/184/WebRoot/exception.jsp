<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异常捕捉过滤器</title>
<style type="text/css">
.error {
	font-size: 12px;
	padding: 5px; 
	color:red;
	padding-left: 30px; 
}
</style>
</head>
<body>

<div class="error" align="center">
${ errormessage } <a href="javascript:history.go(-1); ">返回上一级</a>
</div>

</body>
</html>
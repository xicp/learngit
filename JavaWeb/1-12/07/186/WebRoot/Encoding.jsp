<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>字符编码Filter过滤器</title>
		<style>
body,input,textarea {
	font-size: 12px;
}
</style>
	</head>
	<body>
<form action="${ param.request.requestURL}" method="post">
	<table align="left" bgcolor="lightblue" cellpadding="3"
				cellspacing="7">
		<tr><td>
		  <textarea name="text" rows="8" cols="40">${ param.text }</textarea>
			</td>
		<tr><td align="center" colspan="4">
				<input type="submit" value="提交内容" />
		      </td></Tr>
	   <tr>
			<Td>您输入的是:<br/>
<pre>
${ param.text }
</pre></Td>
		</tr>
			</table>
		</form>
	</body>
</html>
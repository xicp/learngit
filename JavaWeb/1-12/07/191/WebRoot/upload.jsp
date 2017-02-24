<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.io.File"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>文件上传过滤器</title>
		<style type="text/css">
body {
	font-size: 12px;
}
</style>
	</head>
	<body>
		<div align="center">
			信息头是 = ${ header['Content-type'] }
		</div>
		<br />
		<form action="" method="post" enctype="multipart/form-data">
			<table align="center" cellpadding="0" cellspacing="0" background="images/upload.jpg" height="400" width="500">
				<tr height="50" align="center">
					<td width="250">
						<input type="file" name="file1" border="2" value="浏览">
					</td>
					<%
						File file1 = (File) request.getAttribute("file1");
						if (file1 != null)
							out.println("<br/>文件: " + file1 + ", <br/>大小字节 : "
									+ file1.length());
					%>
				</tr>
					<Tr align="center" height="50">
					<td width="250">
						<input type="submit" value=" 上传文件 ">
					</td>
				</Tr>
				<Tr height="200">
					<td>&nbsp;</td>
				</Tr>
			</table>
		</form>
	</body>
</html>
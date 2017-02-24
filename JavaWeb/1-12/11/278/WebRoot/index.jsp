<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>单表单图片文件上传到数据库</title>
	</head>
	<body>
		<form name="form1" enctype="multipart/form-data" method="post"
			action="save.jsp">
			<table width="350" height="150" background="images/bg.gif">
				<tr>
					<td valign="top">
						<table width="100%" height="145">
							<tr>
								<td height="49" colspan="2">&nbsp;
									
								</td>
							</tr>
							<tr>
								<td width="9%" height="53">&nbsp;
									
								</td>
								<td width="91%">
									请选择上传的文件：
									<br>
									<input name="file" type="file" size="35">
									注：只能上传GIF、JPG、BMP格式图片。
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input name="Submit" type="submit" value="提交">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

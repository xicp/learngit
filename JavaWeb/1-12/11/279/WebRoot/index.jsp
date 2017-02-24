<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
	<head>
		<title>多表单元素上传文件到数据库</title>
		<script type="text/javascript">
		function checkM(myform){
			if(myform.name.value==""){
				alert("请输入姓名!");myform.name.focus();return false;
			}
			if(myform.sex.value==""){
				alert("请输入性别!");myform.sex.focus();return false;
			}
			if(myform.age.value==""){
				alert("请输入年龄!");myform.age.focus();return false;
			}
			if(myform.file.value==""){
				alert("请选择文件!");myform.file.focus();return false;
			}
		}
		</script>
	</head>
	<body>
		<form name="form1" method="post" enctype="multipart/form-data"
			action="save.jsp" onsubmit="return checkM(form1)" >
			<table width="350" height="150" background="images/bg.gif">
				<tr>
					<td valign="top">
						<table width="100%" height="145">
							<tr>
								<td height="38" colspan="2">
									&nbsp;

								</td>
							</tr>
							<tr>
								<td width="9%" height="53">
									&nbsp;

								</td>
								<td width="91%">
									<p>
										请选择上传的文件：
									</p>
									<p>
										姓名：
										<input type="text" name="name">
									</p>
									<p>
										性别：
										<input type="radio" name="sex" value="m">男
										<input type="radio" name="sex" value="f">女
									</p>
									<p>
										年龄：
										<input type="text" name="age">					
									</p>
									<p>
										选择照片：<input name="file" type="file" >
									</p>
								</td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input name="Submit" type="submit" value="提 交">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String zipFilePath = request.getParameter("zipFile");		//获取 源文件夹路径	
 	if(submit!=null){//判断是否提交表单
 		if(zipFilePath!=null&&!zipFilePath.equals("")){	 			
 			File zipFile = new File(zipFilePath);
 			FileUtil.unzipSerializationObject(zipFile);
 			out.println("<script>alert('Java对象反序列化成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>解压缩Java对象</title>
<style type="text/css">
	table{
		font-size: 13px;
		color:  green;
		border:double;
	}
	.table1{
		font-size: 13px;
		color: green;
		border: 0px;
	}
</style>
<script type="text/javascript">
	function getFileList(){
		getFilePath();
		document.getElementById("form1").action="index.jsp?flag=getList";
		document.getElementById("form1").submit();
	}
	function getFilePath(){
		var file = document.getElementById("zipfilePath");
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		document.getElementById("zipFile").value = filePath;
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="zipFile" id="zipFile">
	<table border="0" width="500" background="bg.JPG">
		<tr height="80">
			<td colspan="3" align="center"> 
				
			</td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"> 
				【解压缩Java对象】 
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;选择序列化文件：</td>
			<td ><input type="file" name="zipfilePath" id="zipfilePath" />
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td colspan="2" align="center">
				<input type="submit" name="submit" onclick="getFilePath()" value="反序列化"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
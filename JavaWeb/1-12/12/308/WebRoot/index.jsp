<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String filePath = request.getParameter("filePath");			//获取 源文件夹路径
	String targetPath = request.getParameter("targetPath");		//获取 源文件夹路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")){	
 			File folder = new File(filePath); 
 			File zipFile = new File(folder.getParent(),folder.getName()+"_File.zip");
 			zipFile.createNewFile();			
 			fileUtil.zipFile(filePath,zipFile,folder.getParent());
 			out.println("<script>alert('文件压缩成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>压缩所有子文件夹</title>
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
				【压缩所有子文件夹】 
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;文件地址：</td>
			<td ><input type="text" name="filePath" id="filePath" />
			</td>
		</tr>
		
		<tr>
			<td  align="right"></td>
			<td colspan="2" align="center">
				<input type="submit" name="submit"  value="开始压缩"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
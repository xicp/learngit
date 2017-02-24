<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	List<String> allFilePath = null;
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String zipFilePath = request.getParameter("zipFile");		//获取 源文件夹路径
	String targetPath = request.getParameter("targetPath");		//获取 源文件夹路径	
 	if(submit!=null){//判断是否提交表单
 		if(zipFilePath!=null&&!zipFilePath.equals("")&&
 			targetPath!=null&&!targetPath.equals("")){	 			
 			File zipFile = new File(zipFilePath);
 			File targetFile = new File(targetPath);
 			if(!targetFile.exists())
 				targetFile.mkdirs();
 			allFilePath = new ArrayList<String>();
 			FileUtil.unZipFile(zipFile,targetFile,allFilePath);
 			out.println("<script>alert('文件解压成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Apache实现文件解压缩</title>
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
				【Apache实现文件解压缩】 
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;选择ZIP文件：</td>
			<td ><input type="file" name="zipfilePath" id="zipfilePath" />
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">解压到：</td>
			<td ><input type="text" name="targetPath" id="targetPath"  />
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="center" colspan="2">
			<textarea rows="5" cols="45"><%
				if(allFilePath!=null){	
					for(String filePath:allFilePath){
						out.println(filePath);
					}
				}
			 %></textarea>
			</td>
		
		</tr>
		<tr>
			<td  align="right"></td>
			<td colspan="2" align="center">
				<input type="submit" name="submit" onclick="getFilePath()" value="开始解压缩"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
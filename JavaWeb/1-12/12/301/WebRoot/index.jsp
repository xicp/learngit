<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");
	String savePath = request.getParameter("savePath");//获取索引文件路径	
	String txtPath = request.getParameter("files");
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(txtPath!=null&&!txtPath.equals("")&&savePath!=null&&!savePath.equals("")){	
	 		String[] files = txtPath.split("\r\n"); 
	 		fileUtil.writeFiles(files,savePath); 		
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合并多个txt文件</title>
<style type="text/css">
	table{
		font-size: 13px;
		color: green;
		border:  double  gray;
	}
	.table1{
		font-size: 13px;
		color: green;
		border: 0px;
	}
</style>
<script type="text/javascript">
	function getFilePath(){
		var file = document.getElementById("saveFile");
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		document.getElementById("savePath").value = filePath;
	}
	function getFiles(){
		var file = document.getElementById("txtFile");
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		var fileStr =  document.getElementById("files").value;
		fileStr=fileStr+filePath+"\r\n";
		document.getElementById("files").value = fileStr;
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="savePath" id="savePath" />
	<table border="0" width="450">
		<tr height="40">
			<td colspan="2" align="center"> 
				【合并多个txt文件】 
			</td>
		</tr>
		<tr>
			<td  align="right">
				选择合并文件：
			</td>
			<td  >
				<input type="file" name="txtFile" id="txtFile" onchange="getFiles()" />
			</td>
		</tr>
		<tr>
			<td  colspan="2">
				<textarea rows="5" cols="45" name="files" id="files"></textarea>
			</td>
		</tr>
		<tr>
			<td  align="right">
				选择保存地址：
			</td>
			<td  >
				<input type="file" name="saveFile" id="saveFile" />
			</td>
		</tr>
			<tr>
			<td  align="right">
			
			</td>
			<td>
				<input type="submit" name="submit" onclick="getFilePath()" value="确定合并"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
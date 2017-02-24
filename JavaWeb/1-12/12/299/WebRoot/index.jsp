<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
<%!
	String pathStr ="";
 %> 
 
 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");
	String keyword = request.getParameter("keyword");//获取磁盘路径	
	String indexFilePath = request.getParameter("indexPath");//获取索引文件路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(keyword!=null&&!keyword.equals("")&&
 			indexFilePath!=null&&!indexFilePath.equals("")){
	 		pathStr = fileUtil.searchFile(keyword,indexFilePath); 		
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>快速全盘查找文件</title>
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
		var file = document.getElementById("indexFile");
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		document.getElementById("indexPath").value = filePath;
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="indexPath" id="indexPath" />
	<table border="0" width="450">
		<tr height="40">
			<td colspan="2" align="center"> 
				【快速全盘查找文件】 
			</td>
		</tr>
		<tr>
			<td  align="right">
				选择索引文件：
			</td>
			<td  >
				<input type="file" name="indexFile" id="indexFile" />
			</td>
		</tr>
			<tr>
			<td  align="right">
				输入关键字：
			</td>
			<td  >
				<input type="text" name="keyword" id="keyword" />
				<input type="submit" name="submit" onclick="getFilePath()" value="开始查找"/>
			</td>
		</tr>
		<tr height="40">
			<td align="center" colspan="2">
			<textarea rows="5" cols="45"><%
			out.println(pathStr);
			 %></textarea>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
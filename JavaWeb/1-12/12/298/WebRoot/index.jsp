<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
<%!
	List<String> filePath = null;
	String pathStr ="";
 %> 
 
 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");
	String driverPath = request.getParameter("driverPath");//获取磁盘路径	
	String indexFilePath = request.getParameter("indexPath");//获取索引文件路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(driverPath!=null&&!driverPath.equals("")&&
 			indexFilePath!=null&&!indexFilePath.equals("")){
	 		fileUtil.createIndexFile(driverPath,indexFilePath);
	 		pathStr = fileUtil.getPathStr();
	 		filePath = fileUtil.getList();
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建磁盘索引文件</title>
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
		var driver = document.getElementById("driver");
		document.getElementById("driverPath").value = driver.value;
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="indexPath" id="indexPath" />
<input type="hidden" name="driverPath" id="driverPath" />
	<table border="0" width="450">
		<tr height="40">
			<td colspan="2" align="center"> 
				【创建磁盘索引文件】 
			</td>
		</tr>
		<tr height="30">
			<td align="right">
				选择磁盘：
			</td>
			<td >
				<select name="driver" id="driver">
					<%
						File[] files = File.listRoots();
						for(File file:files){
					 %>
					<option value="<%=file.getAbsolutePath()%>"><%=file.getAbsolutePath()%></option>
					<%} %>
				</select>
			
			</td>
			
		</tr>
		<tr>
			<td  align="right">
				选择文件：
			</td>
			<td  >
				<input type="file" name="indexFile" id="indexFile" />
			</td>
		</tr>
		<tr height="40">
			<td align="left" colspan="2">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;
				<input type="submit" name="submit" onclick="getFilePath()" value="创建索引"/>
				&nbsp;&nbsp;
				<input type="reset"   value="重 置"  />
			</td>
		</tr>
		<tr height="40">
			<td align="center" colspan="2">
			
			索引文件内容如下：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;<br/>
			<textarea rows="5" cols="45"><%
				out.println(pathStr);
			 %></textarea>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
 
 <%
 	List<File> files = null;
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取搜索按钮的值
	String filePath = request.getParameter("filePath");//获取文件路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")){
	 		files = fileUtil.searchFile(filePath);//调用方法搜索文件夹中的文件
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>动态加载磁盘文件</title>
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
	function search(){
		var driver=document.getElementById("driver");
		document.getElementById("driverPath").value=driver.value;
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="driverPath" id="driverPath" />
	<table border="1" width="400">
		<tr>
			<td colspan="2" align="center"> 
				【动态加载磁盘文件】 
			</td>
		</tr>
		<tr height="30">
			<td  colspan="2">
				文件夹路径：
				<input type="text" name="filePath" 
					value="<%if(filePath!=null&&!filePath.equals("")){out.println(filePath);} %>"/>
				<input type="submit" name="submit" value="搜 索"/>			
			</td>
		</tr>
		<tr>
			<td align="center">文件名</td>
			<td align="center">属性</td>
		</tr>
		<% 
			if(files!=null&&files.size()>0){
				for(File file:files){		
		%>
		<tr>
			<td align="center">
				<%=file.getName()%>
			</td>
			<td align="center">
				<%if(file.isHidden()){
					out.println("隐藏文件");
				}else{
					out.println("&nbsp;");
				} %>
			</td>
		</tr>
		<% 		}		
			}%>
	</table>
	</form>
</body>
</html>
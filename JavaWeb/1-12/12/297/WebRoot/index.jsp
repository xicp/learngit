<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
 
 <%
 	List<File> delFiles = null;
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取搜索按钮的值
	String filePath = request.getParameter("filePath");//获取文件路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")){
	 		File file = new File(filePath);
	 		fileUtil.deleteFiles(file);//调用方法删除文件夹中的所有子文件
	 		delFiles = fileUtil.getDelFiles();
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除文件夹中所有文件</title>
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
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="driverPath" id="driverPath" />
	<table border="0" width="400" height="240">
		<tr height="40">
			<td colspan="2" align="center"> 
				【删除文件夹中所有文件】 
			</td>
		</tr>
		<tr height="30">
			<td  colspan="2">
				文件夹路径：
				<input type="text" name="filePath" 
					value="<%if(filePath!=null&&!filePath.equals("")){out.println(filePath);} %>"/>
				<input type="submit" name="submit" value="删 除"/>			
			</td>
		</tr>
		<tr >
			<td align="center" colspan="2">
				<textarea rows="5" cols="45"><%
					if(delFiles!=null&&delFiles.size()>0){
						out.println("删除了以下文件：");
						for(File file:delFiles){
							out.println(file.getAbsolutePath());
						}
					}
				 %></textarea>
			</td>
			
		</tr>
	</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取按钮的值
	String filePath = request.getParameter("filePath");//获取源文件路径
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")){	
	 		fileUtil.sortFile(filePath);	
	 		out.println("<script>alert('文件分类成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件分类存储</title>
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
	function getExtendName(){
		var extendName = document.getElementById("extendName");
		document.getElementById("extendStr").value=extendName.value
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="extendStr" id="extendStr" />
	<table border="0" width="450">
		<tr height="40">
			<td colspan="2" align="center"> 
				【实现文件分类存储】 
			</td>
		</tr>
		<tr>
			<td  align="right">分类文件夹：</td>
			<td ><input type="text" name="filePath" id="filePath" /></td>
		</tr>
			<tr>
			<td  align="right"></td>
			<td>
				<input type="submit" name="submit"  onclick="getExtendName()" value="确定分类"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
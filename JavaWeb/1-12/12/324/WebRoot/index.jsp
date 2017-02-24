<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.net.URI"%>
<%@ page import="java.io.*"%>

 <% 
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String downPath = request.getParameter("downPath");		//获取 源文件夹路径
	String savePath = request.getParameter("savePath");		//获取目标文件夹路径 	
 	if(submit!=null){//判断是否提交表单
 		if(downPath!=null&&!downPath.equals("")&&savePath!=null&&!savePath.equals("")){			 		
	 		FileUtil.zipWebPage(downPath,savePath);
	 		out.println("<script>alert('网页保存成功！');</script>");
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>压缩存储网页</title>
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
	<table border="0" width="507" background="bg.JPG">
		<tr height="60">
			<td colspan="2" align="center"></td>
		</tr>
		<tr height="40">
			<td colspan="2" align="center"> 
				【压缩存储网页】 
			</td>
		</tr>
		<tr>
			<td  align="right">下载地址：</td>
			<td ><input type="text" name="downPath" id="downPath" size="30" /></td>
		</tr>
		<tr>
			<td  align="right">保存路径：</td>
			<td ><input type="text" name="savePath" id="savePath" size="30" /></td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td >
				<input type="submit" name="submit"  value="开始下载"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
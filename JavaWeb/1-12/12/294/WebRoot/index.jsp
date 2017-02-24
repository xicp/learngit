<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.FileUtil" %>
 
 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取提交按钮的值
	String sourcePath = request.getParameter("sourcePath");//获取源文件夹路径
 	String targetPath = request.getParameter("targetPath");//获取目标文件夹路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
	 	if(sourcePath!=null&&!sourcePath.equals("")&&
	 		targetPath!=null&&!targetPath.equals("")){//判断是否为空
	 		boolean res = fileUtil.moveFile(sourcePath,targetPath);//调用方法移动文件
	 		if(res){
	 			out.println("<script>alert('文件移动成功！')</script>");
	 		}
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>快速批量移动文件</title>
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
	<table border="0" width="500">
		<tr>
			<td colspan="2" align="center">
				【快速批量移动文件】
			</td>
		</tr>
		<tr height="30">
			<td align="right">
				源文件路径：
			</td>
			<td >
				<input type="text" name="sourcePath" id="sourcePath" 
					value="<%if(sourcePath!=null&&!sourcePath.equals("")){out.println(sourcePath);} %>">
			</td>
		</tr>
		<tr>
			<td align="right">
				目标文件夹：
			</td>
			<td>
				<input type="text" id="targetPath" name="targetPath" 
				value="<%if(targetPath!=null&&!targetPath.equals("")){out.println(targetPath);} %>" />
			</td>
		</tr>
		<tr>
			<td align="right">
				操作记录：
			</td>
			<td>
				<textarea rows="5" cols="45"><%
					List<String> list = fileUtil.getWorkLogList();
					if(list!=null&&list.size()>0){
						for(String log:list){
							out.println(log);
						}
					}
				 %></textarea>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" name="submit" value="开始移动"/>
				<input type="reset" value="重 置"  />
			</td>
		
		</tr>
		<tr>
			<td colspan=2 height="30">
				
			</td>
			
		</tr>
	</table>
	</form>
</body>
</html>
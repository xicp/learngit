<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.FileUtil" %>
 
 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取提交按钮的值
 	
	String filePath = request.getParameter("filePath");//获取文件路径
 	String tempStr = request.getParameter("tempStr");//获取文件名的模板
 	String extendName = request.getParameter("extendName");//获取文件扩展名
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
	 	if(filePath!=null&&!filePath.equals("")&&
	 		tempStr!=null&&!tempStr.equals("")&&
	 		extendName!=null&&!extendName.equals("")){//判断是否为空
	 		fileUtil.renameFile(filePath,tempStr,extendName);//调用方法将文件重命名 
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>文件的批量重命名</title>
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
	<table border="0" width="400">
		<tr>
			<td colspan="2" align="center">
				【文件批量重命名】
			</td>
		</tr>
		<tr height="30">
			<td align="right">
				文件路径：
			</td>
			<td >
				<input type="text" name="filePath" id="filePath" 
					value="<%if(filePath!=null&&!filePath.equals("")){out.println(filePath);} %>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				使用#可以指定数字计数所占的位置，使用*可以插入源文件名
			</td>
		
		</tr>
		<tr>
			<td align="right">
				文件名模板：
			</td>
			<td>
				<input type="text" id="tempStr" name="tempStr" 
				value="<%if(tempStr!=null&&!tempStr.equals("")){out.println(tempStr);} %>" />
			</td>
		</tr>
		<tr>
			<td align="right">
				文件扩展名：
			</td>
			<td>
				<input type="text" id="extendName" name="extendName" 
					value="<%if(extendName!=null&&!extendName.equals("")){out.println(extendName);} %>" />
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2">
				<input type="submit" name="submit" value="开始重命名"/>
				<input type="reset" value="重 置"  />
			</td>
		
		</tr>
		<tr>
			<td colspan=2 height="30">
				
			</td>
			
		</tr>
		<tr>
			<td align="center">
				旧文件名：
			</td>
			<td align="center">
				新文件名：
			</td>
		</tr>
		<tr>
			<td>
				<table align="center" class="table1">
				<%
					List<String> oldNameList = fileUtil.getOldNameList();
					if(oldNameList!=null&&oldNameList.size()>0){
						for(String oldName:oldNameList){
				%>
					<tr><td><%=oldName%></td></tr>
				<%} }%>
				</table>
			</td>
			<td>
				<table align="center" class="table1">
				<%
					List<String> newNameList = fileUtil.getNewNameList();
					if(newNameList!=null&&newNameList.size()>0){
						for(String newName:newNameList){
				%>
					<tr><td><%=newName%></td></tr>
				<%} }%>
				</table>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
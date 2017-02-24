<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
<%!List<File> tempFiles = null; //用于保存搜索出的临时文件 %> 
 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取搜索按钮的值
 	String submit1 = request.getParameter("submit1");//获取删除按钮的值
	String driverPath = request.getParameter("driverPath");//获取文件路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(driverPath!=null&&!driverPath.equals("")){
	 		fileUtil.listTempFiles(new File(driverPath));//调用递归方法，获取所有.tmp文件
	 		tempFiles = fileUtil.getTemFiles();	//返回保存临时文件的List集合  
	 	}
 	}
 	if(submit1!=null){//判断是否删除
 		boolean res = fileUtil.deleteTmpFile(tempFiles);//删除所有.tmp临时文件
 		if(res){
 			tempFiles = null;							//清空集合中的元素 
 			out.println("<script>alert('temp临时文件删除成功')</script>");
 		}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除磁盘.tmp临时文件</title>
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
	<table border="0" width="400">
		<tr>
			<td colspan="3" align="center"> 
				【删除磁盘.tmp临时文件】 
			</td>
		</tr>
		<tr height="30">
			<td align="right">
				选择磁盘路径：
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
			<td align="center" >
				<input type="submit" name="submit" onclick="search()" value="搜 索"/>
				&nbsp;&nbsp;
				<input type="submit" name="submit1"  value="删 除"  />
			</td>
		</tr>
		<tr>
			<td  colspan="3">
				<%if(driverPath!=null&&!driverPath.equals("")){
					out.println(driverPath+" 所有临时文件包括：");
				} %>
			</td>
		</tr>
		<% 
			if(tempFiles!=null&&tempFiles.size()>0){
				for(File tempFile:tempFiles){		
		%>
		<tr>
			<td colspan="3" >
				<%=tempFile.getAbsolutePath()%>
			</td>
		
		</tr>
		<% 		}		
			}%>
	</table>
	</form>
</body>
</html>
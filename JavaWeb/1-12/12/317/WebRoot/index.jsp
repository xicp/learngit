<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	Vector<String> fileDetails = null;
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String rarfilePath = request.getParameter("rarFile");		//获取RAR文件路径
 	FileUtil fileUtil = new FileUtil();
 	if(rarfilePath!=null&&!rarfilePath.equals("")){
 		fileDetails = fileUtil.getRarDetail(new File(rarfilePath));
	}	
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>获取压缩包详细文件列表</title>
<style type="text/css">
	table{
		font-size: 13px;
		color:  green;
		
	}
	.table1{
		font-size: 13px;
		color: green;
		border: 0px;
	}
</style>
<script type="text/javascript">
	function getFilePath(){
		var file = document.getElementById("rarfilePath");
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		document.getElementById("rarFile").value = filePath;
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
<input type="hidden" name="rarFile" id="rarFile">
	<table border="0" width="603"  background="bg.JPG">
		<tr height="80">
			<td colspan="3" align="center"> 
				
			</td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"> 
				【获取压缩包详细文件列表】 
			</td>
		</tr>
		<tr>
			<td> </td>
			<td align="right">&nbsp;选择RAR文档：</td>
			<td ><input type="file" name="rarfilePath" id="rarfilePath" />
			</td>
		</tr>
		
		<tr>
			<td></td>
			<td valign="top" >
				<table border="0" align="right">
					<tr height="20">
						<td>文件名称</td>
					</tr>	
					<%
						if(fileDetails!=null){
						for(int i=0;i<fileDetails.size();i=i+2){
					 %>
					<tr height="20">
						<td><%=fileDetails.get(i)%></td>
					</tr>
					<%}}%>
				</table>
			
			</td>
			<td valign="top" >
				<table border="0">
					<tr height="20">
						<td>文件大小</td>
						<td>压缩后大小</td>
						<td>压缩率</td>
						<td>修改时间</td>	
					</tr>	
					<%
						if(fileDetails!=null){
						for(int i=1;i<fileDetails.size();i=i+2){
					 %>
					<tr height="20">
						<%
							String[] info= fileDetails.get(i).split("\\s+");
						%>
						<td><%=info[1] %></td>
						<td><%=info[2] %></td>
						<td><%=info[3] %></td>
						<td><%=info[4] %>&nbsp;<%=info[5] %></td>
						<%}%>
					</tr>
					<%} %>
				</table>
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td  align="right"></td>
			<td >
				<input type="submit" name="submit" onclick="getFilePath()" value="查询详细信息"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
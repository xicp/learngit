<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	Vector<String> fileDetails = null;
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String renameButton = request.getParameter("renameButton");
	String rarfilePath = request.getParameter("rarFile");		//获取RAR文件路径
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//单击“查询文件列表”按钮
	 	if(rarfilePath!=null&&!rarfilePath.equals("")){
	 		fileDetails = fileUtil.getRarDetail(new File(rarfilePath));
		}
	}	
 	if(renameButton!=null){//单击“重命名”按钮
 		String pathStr = request.getParameter("path");
 		String newName = request.getParameter("newFileName");
 		fileUtil.renameFileFromRar(new File(rarfilePath),pathStr,newName);
 		fileDetails = fileUtil.getRarDetail(new File(rarfilePath));
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重命名RAR压缩包中的文件</title>
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
	//获取用户选择的RAR文件路径
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
	//删除按钮调用的函数 
	function rename(){
		document.getElementById("path").value=selectFile();
	}
	//获取用户选择的复选框的值
	
	function selectFile(){
		var checkObj = document.getElementsByName("oneFile");
		var count=0;
		var str="";
		for(var i=0; i<checkObj.length;i++){
			if(checkObj[i].checked){
				str=checkObj[i].value;
				count++;
			}
		}
		if(count>1){
			alert("每次只能选择一个文件！");
			return ;
		}
		return str;	
	}
</script>
</head>
<body>
<form action="index.jsp" method="post"  id="form1">
<input type="hidden" name="rarFile" id="rarFile" value="<%if(rarfilePath!=null&&!rarfilePath.equals("")){out.println(rarfilePath);}%>">
<input type="hidden" name="path" id="path">
	<table border="0" width="603"  background="bg.JPG">
		<tr height="80">
			<td colspan="3" align="center"> 
				
			</td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"> 
				【重命名RAR压缩包中的文件】 
			</td>
		</tr>
		<tr>
			<td width="35"> </td>
			<td align="left" colspan="2">选择RAR文档：<input type="file" name="rarfilePath" id="rarfilePath" /></td>
			
		</tr>
		<tr>
			<td  align="right"></td>
			<td  align="right"><input type="submit" name="submit" onclick="getFilePath()" value="查询文件列表"/></td>
			<td ></td>
		</tr>
		<tr>
			<td></td>
			<td valign="top" >
				<table border="0" align="right">
					<tr height="20">
						<td>
						<input type="checkbox" name="allFile"/>
						</td>
						<td>文件名称</td>
					</tr>	
					<%
						if(fileDetails!=null){
						for(int i=0;i<fileDetails.size();i=i+2){
					 %>
					<tr height="20">
						<td>
						<input type="checkbox" name="oneFile" onclick="selectFile()" value="<%=fileDetails.get(i) %>"/>
						</td>
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
			<td > </td>
			<td align="left"  colspan="2">输入新文件名称（注意修改文件路径会导致文件移动）：<br/>
			<input type="text" name="newFileName" id="newFileName" size="60"/></td>
			
		</tr>
		<tr>
			<td  align="right"></td>
			<td align="center"><input type="submit" name="renameButton"  onclick="rename()" value="重命名"/></td>
			<td ></td>
		</tr>
	</table>
	</form>
</body>
</html>
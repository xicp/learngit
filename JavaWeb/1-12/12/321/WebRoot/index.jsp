<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	String resultInfo = "";
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String rarfilePath = request.getParameter("rarFile");		//获取RAR文件路径
 	if(submit!=null){											//单击“创建”按钮
	 	if(rarfilePath!=null&&!rarfilePath.equals("")){
	 		resultInfo = FileUtil.createAutoExecFile(new File(rarfilePath));	//调用创建自解压文件的方法
		}
	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建自解压RAR压缩包</title>
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
</script>
</head>
<body>
<form action="index.jsp" method="post"  id="form1">
<input type="hidden" name="rarFile" id="rarFile" >
<input type="hidden" name="path" id="path">
	<table border="0" width="503"  background="bg.JPG">
		<tr height="80">
			<td colspan="3" align="center"></td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"> 
				【创建自解压RAR压缩包】 
			</td>
		</tr>
		<tr>
			<td width="35"> </td>
			<td align="center" >选择RAR文档：</td>
			<td>
			<input type="file" name="rarfilePath" id="rarfilePath" />
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td colspan="2">
			<textarea rows="5" cols="45"><%
				out.println(resultInfo);
			 %></textarea>
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td  align="right"></td>
			<td ><input type="submit" name="submit" onclick="getFilePath()" value="创 建"/></td>
		</tr>
		
	</table>
	</form>
</body>
</html>
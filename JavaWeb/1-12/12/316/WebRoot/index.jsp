<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String rarfilePath = request.getParameter("rarFile");		//获取RAR文件路径
	String note = request.getParameter("note");					//获取注释信息
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(rarfilePath!=null&&!rarfilePath.equals("")){
 			fileUtil.addNoteToRarFile(note,new File(rarfilePath));
 			out.println("<script>alert('RAR压缩文件添加注释成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>为RAR压缩包添加注释</title>
<style type="text/css">
	table{
		font-size: 13px;
		color:  green;
		border:double;
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
	<table border="0" width="508" background="bg.JPG">
		<tr height="80">
			<td colspan="3" align="center"> 
				
			</td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"> 
				【为RAR压缩包添加注释】 
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;选择RAR文档：</td>
			<td ><input type="file" name="rarfilePath" id="rarfilePath" />
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  colspan="2">	
			<textarea rows="5" cols="45" name="note"><%
				String noteFilePath = application.getRealPath("/")+"note.txt";
				File notFile = new File(noteFilePath,"note.txt");
				FileInputStream in = new FileInputStream(noteFilePath);
				byte[] bytes = new byte[in.available()];
				in.read(bytes);
				out.println(new String(bytes));
			 %></textarea>
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td  align="right"></td>
			<td >
				<input type="submit" name="submit" onclick="getFilePath()" value="添加注释"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
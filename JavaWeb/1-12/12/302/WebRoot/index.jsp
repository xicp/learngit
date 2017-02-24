<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");//设置请求编码
 	String submit = request.getParameter("submit");//获取按钮的值
	String filePath = request.getParameter("filePath");//获取源文件路径
	String savePath = request.getParameter("savePath");//获取保存路径
	String extendStr = request.getParameter("extendStr");//获取文件扩展名 
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")&&
 			savePath!=null&&!savePath.equals("")&&
 			extendStr!=null&&!extendStr.equals("")){	
	 		fileUtil.getFiles(filePath,extendStr);			//在文件夹中查找指定扩展名的文件
	 		List<String> files =fileUtil.getAllfilePath();	//获取到文件夹中所有符合条件的文件集合
	 		fileUtil.copyFile(files,savePath);//调用方法实现文件复制
	 		out.println("<script>alert('文件复制成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批量复制指定扩展名的文件</title>
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
				【批量复制指定扩展名的文件】 
			</td>
		</tr>
		<tr>
			<td  align="right">
				文件地址：
			</td>
			<td  >
				<input type="text" name="filePath" id="filePath" />
			</td>
		</tr>
		<tr>
			<td  align="right">
				文件扩展名：
			</td>
			<td  >
				<select id="extendName">
					<option value=".doc">.doc</option>
					<option value=".txt">.txt</option>
					<option value=".jpg">.jpg</option>
					<option value=".gif">.gif</option>
					<option value=".rar">.rar</option>
					<option value=".zip">.zip</option>
				</select>
			</td>
		</tr>
		<tr>
			<td  align="right">
				保存地址：
			</td>
			<td>
				
				<input type="text" name="savePath" id="savePath" />
			</td>
		</tr>
			<tr>
			<td  align="right">
			
			</td>
			<td>
				<input type="submit" name="submit"  onclick="getExtendName()" value="复 制"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
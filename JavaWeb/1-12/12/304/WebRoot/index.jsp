<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
<%
	
 %>
 
 <%
 	List<File> files = null;
 	request.setCharacterEncoding("UTF-8");					//设置请求编码
 	String submit = request.getParameter("submit");			//获取按钮的值
	String filePath = request.getParameter("filePath");		//获取文件路径
	String fileName = request.getParameter("fileName");		//获取文件名关键字
 	String extendName = request.getParameter("extendStr");	//文件扩展名
 
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")&&
 			fileName!=null&&!fileName.equals("")&&
 			extendName!=null&&!extendName.equals("")){	
	 		files = FileUtil.findFiles(filePath,fileName,extendName);	//调用搜索文件的方法
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在指定目录下搜索文件</title>
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
		var extendName = document.getElementById("type");
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
				【在指定目录下搜索文件】 
			</td>
		</tr>
		<tr>
			<td  align="right">文件地址：</td>
			<td ><input type="text" name="filePath" id="filePath" /></td>
		</tr>
		<tr>
			<td  align="right">文件名：</td>
			<td ><input type="text" name="fileName" id="fileName" /></td>
		</tr>
		<tr>
			<td  align="right">后缀：</td>
			<td >
				<select id="type">
					<option value=".gif">.gif</option>
					<option value=".jpg">.jpg</option>
					<option value=".bmp">.bmp</option>
					<option value=".txt">.txt</option>
					<option value=".xls">.xls</option>
					<option value=".doc">.doc</option>
					<option value=".xml">.xml</option>
					<option value=".rar">.rar</option>
					<option value=".zip">.zip</option>
				</select>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" name="submit"  onclick="getExtendName()" value="搜  索"/>
			</td>
		</tr>
		<tr height="100">
			<td colspan="2" align="center">
				<textarea rows="5" cols="45"><%
					if(files!=null){
						for(File file:files){
							out.println(file.getAbsolutePath());
						}
					}
				 %></textarea>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
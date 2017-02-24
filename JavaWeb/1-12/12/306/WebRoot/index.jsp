<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>
<%! 
	File[] txtFiles = null;
 %>
 
 <%
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String filePath = request.getParameter("filePath");		//获取 源文件夹路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")){	 			
 			File folder = new File(filePath);//根据源文件夹创建File对象 		
 			//创建新的zip文件
 			File targetZipFile = new File(folder.getParent(),folder.getName()+"_txtFile.zip");
 			if(!targetZipFile.exists()){
 				targetZipFile.createNewFile();
 			}
	 		FileUtil.zipFile(folder,targetZipFile);//调用方法实现文件压缩
	 		out.println("<script>alert('文件压缩成功！');</script>");	
	 	}
 	}
 	String flag = request.getParameter("flag");
 	
 	if(flag!=null){
 		if(filePath!=null&&!filePath.equals("")){
 			File folder = new File(filePath);
 			txtFiles = folder.listFiles(new ExtendNameFilter());
 		}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>压缩所有文本文件</title>
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
	function getFileList(){
		document.getElementById("form1").action="index.jsp?flag=getList";
		document.getElementById("form1").method="post";
		document.getElementById("form1").submit();
	}
</script>
</head>
<body>
<form action="index.jsp" method="post" id="form1">
	<table border="0" width="500" background="bg.JPG">
		<tr height="80">
			<td colspan="3" align="center"> 
				
			</td>
		</tr>
		<tr height="40">
			<td colspan="3" align="center"> 
				【压缩所有文本文件】 
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;文件地址：</td>
			<td ><input type="text" name="filePath" id="filePath"  
					value="<%if(filePath!=null&&!filePath.equals("")){out.println(filePath);} %>"/>
				<input type="submit" name="submit1" onclick="getFileList()"  value="搜 索"/>
			</td>
		</tr>
		<tr>
			<td > 	</td>
			<td align="center" colspan="2" >
				<textarea rows="5" cols="45"><%
					if(txtFiles!=null){
						for(File f:txtFiles){
							out.println(f.getAbsolutePath());
						}
					}
				 %></textarea>
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td colspan="2" align="center">
				<input type="submit" name="submit"  value="开始压缩"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.zip.*" %>
<%@ page import="com.lh.util.*" %>
<%@ page import="java.io.*"%>

 <%
 	request.setCharacterEncoding("UTF-8");						//设置请求编码
 	String submit = request.getParameter("submit");				//获取按钮的值
	String rarfilePath = request.getParameter("rarFile");		//获取RAR文件路径
	String filePath = request.getParameter("filePath");			//获取要压缩的文件夹路径	
	String pwd = request.getParameter("pwd");			//获取要压缩的文件夹路径	
 	FileUtil fileUtil = new FileUtil();
 	if(submit!=null){//判断是否提交表单
 		if(filePath!=null&&!filePath.equals("")&&rarfilePath!=null&&!rarfilePath.equals("")){			
 			boolean res = fileUtil.toRarFile(filePath,rarfilePath,pwd);
 			if(res)
 				out.println("<script>alert('文件压缩成功！');</script>");	
	 	}
 	}
  %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设置RAR压缩包密码</title>
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
	function checkPwd(){
		var pwd = document.getElementById("pwd").value;
		var pwd1 = document.getElementById("pwd1").value;
		if(pwd==null||pwd==""){
			alert("请输入密码！");
			document.getElementById("pwd").focus();
			return false;
		}
		if(pwd1==null||pwd1==""){
			alert("请输入确认密码！");
			document.getElementById("pwd1").focus();
			return false;
		}
		if(pwd!=""&&pwd1!=""){
			if(pwd1!=pwd){
				alert("确认密码输入有误！");
				document.getElementById("pwd1").focus();
				return false;
			}
		}
		return true;
	}
	function getFilePath(){
		if(checkPwd()){
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
				【设置RAR压缩包密码】 
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;文件地址：</td>
			<td ><input type="text" name="filePath" id="filePath" />
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;压缩文档：</td>
			<td ><input type="file" name="rarfilePath" id="rarfilePath" />
			</td>
		</tr>
		<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;输入密码：</td>
			<td ><input type="password" name="pwd" id="pwd"  />
			</td>
		</tr>
			<tr>
			<td width="40"> 	</td>
			<td  align="right">&nbsp;确认密码：</td>
			<td ><input type="password" name="pwd1" id="pwd1"  />
			</td>
		</tr>
		<tr>
			<td  align="right"></td>
			<td  align="right"></td>
			<td >
				<input type="submit" name="submit" onclick="getFilePath()" value="开始压缩"/>
			</td>
		</tr>
	</table>
	</form>
</body>
</html>
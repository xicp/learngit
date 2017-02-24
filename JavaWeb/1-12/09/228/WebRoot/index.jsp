<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>从指定URL中提取文件名</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script language="javascript"> 
	
		function getFileName(url){
			var regExp = /(.*\/)*([^.]+).*/ig;
			url = url.replace(regExp,"$2");
			return url;
		}
		
		function check(){
			var url = document.getElementById("url").value;
			//验证URL是否正确的正则表达式
			var urlExp = /http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?(\/\w+)*.\w{3}$/;
			if(url==""){
				alert("请输入URL地址！");
				document.getElementById("url").focus();
				return;
			}
			if(!urlExp.test(url)){
				alert("您输入的URL地址无效！");
				document.getElementById("url").focus();
				return;
			}
			document.getElementById("filename").value = getFileName(url);
		}
	</script>
	<style type="text/css">
		table{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
		}
		input{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
		}
		font{
			font-size: 12px;
			font-family: 楷体;
			color:orangered;
		}
		.style1{
			width: 500px;
			height: 160px;
		}
	</style>
  </head>
  
  <body>
    <fieldset class="style1"><legend>提取URL中的文件名</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入URL地址：<font>例如：http://www.mingribook.com/index.jsp</font></td>
   		</tr>	
   		<tr>
   			<td>
   				
   				<input type="text"  id="url" size="50">	
   				
   			</td>
   		</tr>
   		<tr>
   			<td>提取的文件名：</td>
   		</tr>
   		<tr>
   			<td>
   				<input type="text"  id="filename" />
   			</td>
   		</tr>
   		
   		<tr>
   			<td  align="center">
   				<input type="button" value="提 取" onclick="check()">
   		
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

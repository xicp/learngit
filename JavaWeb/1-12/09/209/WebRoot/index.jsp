<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证是否为数字</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function check(){
		var age = document.getElementById("age");
		if(age.value==null||age.value==""){
			alert("请输入年龄！");
			age.focus();
			return;
		}
		if(isNaN(age.value)){
			alert("年龄必须为数字！");
			age.focus();
			return;
		}
		document.getElementById("myform").submit();	

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
			width: 500;
			height: 260;
		}
	</style>
  </head>
  
  <body>
    <fieldset class="style1"><legend>用户注册</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>用户名：</td>
   			<td>
   				<input type="text"  id="name"> 			
   			</td>
   		</tr>
   		<tr>
   			<td>密码：</td>
   			<td>
   				<input type="password"  id="pwd"> 			
   			</td>
   		</tr>
   		<tr>
   			<td>确认密码：</td>
   			<td>
   				<input type="password"  id="pwd1"> 			
   			</td>
   		</tr>
   		<tr>
   			<td> 性别：</td>
   			<td>
   				<input type="radio" name="sex" id="man" value="m" />男	
   				<input type="radio" name="sex" id="woman" value="f" />女			
   			</td>
   		</tr>
   		
   		<tr>
   			<td>年龄：</td>
   			<td>
   				<input type="text" id="age">
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="2">
   				<input type="button" value="提 交" onclick="check()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

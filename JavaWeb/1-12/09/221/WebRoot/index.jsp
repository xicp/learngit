<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>限制用户不允许输入中文</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 

	function checkCN(str){
		if (escape(str).indexOf("%u")<0){//indexOf()方法查找字符串是否包含"\u" ,如果不包含返回-1
			return true;
		} else {
			return false;
		}
	}
	
	function check(){
		var userName = document.getElementById("username").value;
		if(userName==""){
			alert("请输入用户名！");
			document.getElementById("username").focus();
			return;
		}
		if(!checkCN(userName)){
			alert("用户名不允许包含中文字符！");
			document.getElementById("username").focus();
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
			width: 500px;
			height: 160px;
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
   				<input type="text"  id="username"> 			
   			</td>
   		</tr>	
   		<tr>
   			<td>密码：</td>
   			<td>
				<input type="password"  id="pwd"/>
   			</td>
   		</tr>  
   		<tr>
   			<td>确认密码：</td>
   			<td>
				<input type="password"  id="pwd1"/>
   			</td>
   		</tr> 
   		<tr>
   			<td>性别：</td>
   			<td>
				<input type="radio"  name="sex" id="man" value="m" checked="checked" />男
				<input type="radio"  name="sex" id="woman" value="f" />女
   			</td>
   		</tr> 
   		<tr>
   			<td>年龄：</td>
   			<td>
				<input type="text"  id="age"/>
   			</td>
   		</tr>  			
   		<tr>
   			<td colspan="2" align="center">
   				<input type="button" value="注 册" onclick="check()">
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

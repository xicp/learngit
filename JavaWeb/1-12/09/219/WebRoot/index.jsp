<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>限制输入字符串的长度</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 

	/**
	*限制输入字符串的长度
	*@ str：要判断的字符串 
	*@ limitLength：限制的长度
	*/
	function checkStrLength(str,limitLength){
		var n=0;							//该变量保存字符串的长度
		for(var i=0;i<str.length;i++){
			var code = str.charCodeAt(i);//获得每个字符的Unicode值 
			if(code>255){
				n=n+2;
			}
			else{
				n=n+1;
			}
		}
		if(n>limitLength){	//如果字符串的长度大于限制长度，返回false
			return false;
		}
		return true;
	}
	
	function check(){
		var userName = document.getElementById("username").value;
		var limitNum = 10;
		if(userName==""){
			alert("请输入用户名！");
			document.getElementById("username").focus();
			return;
		}
		if(!checkStrLength(userName,10)){
			alert("您输入的用户名不能超过 "+limitNum+" 个字符！");
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

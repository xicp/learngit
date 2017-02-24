<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证E-mail是否正确</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkEmail(){
		var email = document.getElementById("email");
		if(email.value==null||email.value==""){//判断文本框是否为空 
			alert("请输入E-mail地址！");
			email.focus();
			return;
		}
		var regExpression = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
		var objExp = new RegExp(regExpression);	//创建正则表达式对象 
		if(objExp.test(email.value)==false){	//通过 test()函数测试字符串是否与表达式的模式匹配 
			alert("您输入的E-mail地址不正确！");
			email.focus();						//使文本框获得焦点 
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
   			<td>密码提示问题：</td>
   			<td>
   				<select name="question">
   					<option>请选择</option>
   					<option>你的父亲叫什么名字？</option>
   					<option>你的小学老师的名字？</option>
   					<option>你的生日？</option>
   					<option>你的初中学校的名字？</option>
   					<option>你喜欢什么颜色？</option>
   					<option>你喜欢吃的水果是？</option>
   				</select>
   			</td>
   		</tr>
   		<tr>
   			<td>密码提示答案：</td>
   			<td>
   				
   				<input type="text" id="answer">
   			</td>
   		</tr>
   		<tr>
   			<td>E-mail：</td>
   			<td>
   				<input type="text" id="email">
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="2">
   				<input type="button" value="提 交" onclick="checkEmail()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证手机号码是否正确</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkPhone(){
		var mobileNo = document.getElementById("mobileNo");
		var regExpression = /^(86)?((13\d{9})|(15[0,1,2,3,5,6,7,8,9]\d{8})|(18[0,5,6,7,8,9]\d{8}))$/;
		if(!regExpression.test(mobileNo.value)){	
			alert("您输入的手机号码有误！");
			mobileNo.focus();						
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
    <fieldset class="style1"><legend>添加通讯信息</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>姓名：</td>
   			<td>
   				<input type="text"  id="name"> 			
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
   			<td>电子邮箱：</td>
   			<td>
   				<input type="text" id="email">
   			</td>
   		</tr>
   		<tr>
   			<td>手机号码：</td>
   			<td>
   				<input type="text" id="mobileNo">
   			</td>
   		</tr>
   		<tr>
   			<td>联系地址：</td>
   			<td>
   				<textarea rows="5" cols="30"></textarea>
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="2">
   			
   				<input type="button" value="提 交" onclick="checkPhone()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

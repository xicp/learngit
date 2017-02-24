<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证身份证号码是否有效</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkIDCard(){
		var IDCard = document.getElementById("IDCard");	
		//验证15位身份证号码
		var regIDCard_15 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/; 
		//验证18位身份证号码 
		var regIDCard_18 = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}[\d|x|X]$/; 
		if(IDCard.value.length!=15&&IDCard.value.length!=18){
			alert("您输入的身份证号码长度不对，请输入15位或18位的身份证号码！");
			IDCard.focus();						
			return;		
		}else{
			if(IDCard.value.length==15){//验证15位的身份证号码 
				if(!regIDCard_15.test(IDCard.value)){	
					alert("您输入的身份证号码有误！");
					IDCard.focus();						
					return;								
				}
			}
			if(IDCard.value.length==18){//验证18位的身份证号码 
				if(!regIDCard_18.test(IDCard.value)){
					alert("您输入的身份证号码有误！");
					IDCard.focus();						
					return;		
				}
			}
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
   			<td>身份证号码：</td>
   			<td>
   				<input type="text" id="IDCard">
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
   			
   				<input type="button" value="提 交" onclick="checkIDCard()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证字符串是否以指定字符开头</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkStr(){
	
		var startStr = document.getElementById("startStr").value;
		var str = document.getElementById("str").value;
		var regExp=eval("/^"+startStr+"/");	//使用eval()方法使JavaScript动态执行 
		if(startStr==""){		//验证输入的字符串是否为空
			alert("请输入字符串的起始字符！");
			document.getElementById("startStr").focus();
			return false;
		}
		if(str==""){			//验证输入的字符串是否为空
			alert("请输入要判断的字符串！");
			document.getElementById("str").focus();
			return false;
		}
		if(!regExp.test(str)){	//验证字符串是否以制定字符开头
			alert("指定的字符串不是以 ["+startStr+"] 开头！");
			return false;
		}else{
			alert("指定的字符串是以 ["+startStr+"] 开头！");
			return true;
		}
		return true;
	}
	
	function check(){
		if(checkStr()){
			document.getElementById("myform").submit();
		}
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
    <fieldset class="style1"><legend>验证字符串</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>字符串的起始字符：</td>
   				<td>
   				<input type="text"  id="startStr"> 			
   			</td>
   		</tr>	
   		
   		<tr>
   			<td>要判断的字符串：</td>
   			<td>
				<input type="text"  id="str"/>
   			</td>
   		</tr>   			
   		<tr>
   			<td colspan="2" align="center">
   				<input type="button" value="验 证" onclick="check()">
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

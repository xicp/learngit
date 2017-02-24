<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>去除字符串中的左右空格</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 

	function trim(str){	
		var regExp = /(^\s*)|(\s*$)/g; //验证左右空格的正则表达式 
		str = str.replace(regExp,"");  //去掉字符串的左右空格
		return str;
	}
	
	function convert(){
		var str = document.getElementById("str").value;
		if(str==""){
			alert("请输入字符串！");
			document.getElementById("str").focus();
			return;
		}
		document.getElementById("convertStr").value = trim(str);
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
    <fieldset class="style1"><legend>去掉字符串左右空格</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入字符串：</td>
   				<td>
   				<input type="text"  id="str"> 			
   			</td>
   		</tr>	
   		<tr>
   			<td>转换后的字符串：</td>
   			<td>
				<input type="text"  id="convertStr"/>
   			</td>
   		</tr>  	
   		<tr>
   			<td colspan="2" align="center">
   				<input type="button" value="去掉左右空格" onclick="convert()">
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

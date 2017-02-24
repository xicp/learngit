<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>将数字字符串格式化为指定长度</title>
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
	*格式化数字
	*@number ：要格式化的数字
	*@len：格式长度 
	*@return ：返回格式化后的数字
	*/
	function formatNum(number,len){
		var strLength = len - number.length;//格式长度减去数字的长度，就是数字前补"0"的个数
		for(var i=0; i<strLength;i++){
			number = "0"+number;
		}
		return number;
	}
	
	function convert(){
		var number = document.getElementById("number").value;
		var num_len = document.getElementById("num_len").value;
		if(number==""){
			alert("请输入要格式化的数字！");
			document.getElementById("number").focus();
			return;
		}
		if(isNaN(number)){
			alert("您输入的数字不正确！");
			document.getElementById("number").focus();
			return;
		}
		if(num_len==""){
			alert("请输入格式化后字符串的长度！");
			document.getElementById("num_len").focus();
			return;
		}
		if(isNaN(number)){
			alert("您输入的格式化字符串的长度不正确！");
			document.getElementById("num_len").focus();
			return;
		}
		
		document.getElementById("convertStr").value = formatNum(number,num_len);
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
    <fieldset class="style1"><legend>数字字符串格式化</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入要格式化的数字：</td>
   		</tr>	
   		<tr>
   			<td>
   				<input type="text"  id="number"> 	
   			</td>
   		</tr>
   		<tr>
   			<td>请输入格式化后字符串的长度：</td>
   		</tr>  
   		
   		<tr>
   			<td>
   				<input type="text"  id="num_len"/>
   			</td>
   		</tr>
   			<tr>
   			<td>格式化后的字符串：</td>
   		</tr>  
   		<tr>
   			<td>
   				<input type="text"  id="convertStr"/>
   			</td>
   		</tr>	
   		<tr>
   			<td  align="center">
   				<input type="button" value="转 换" onclick="convert()">
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加节点 </title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			font-size: 14px;
		}
	</style>
	
	<script type="text/javascript">
		function createDiv(){
			var element = document.createElement("div");
			element.innerHTML="这就是添加的节点";
			document.getElementById("test").appendChild(element);
		}
	</script>
  </head>
  
  <body>
    <table background="bg.bmp" width="270" height="200">
    	<tr>
    		<td align="center">【添加节点】 </td>
    	</tr>
    	<tr>
    		<td id="test" align="center"></td>
    	</tr>
    	<tr>
    		<td align="center">
    			<input type="button" value="添 加" onclick="createDiv()"/>
    		</td>
    	</tr>
    </table>
  </body>
</html>

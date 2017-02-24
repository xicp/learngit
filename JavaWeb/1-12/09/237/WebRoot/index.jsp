<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>为下拉列表增加选项 </title>
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
		function createSelect(){
			var selectObj = document.createElement("select");
			var str = ["吉林","辽宁","黑龙江","北京","上海","天津","河南","河北","山东","山西","江苏","安徽","云南"];
			for(var i=0;i<10;i++){
				var op = document.createElement("option");
				op.innerHTML=str[i];
				selectObj.appendChild(op);
			}
			document.getElementById("test").appendChild(selectObj);
		}
	</script>
  </head>
  
  <body onload="createSelect()">
    <table background="bg.bmp" width="270" height="200">
    	<tr>
    		<td align="center">【为下拉列表增加选项】 </td>
    	</tr>
    	<tr>
    		<td id="test" align="center">籍贯：</td>
    	</tr>
    	<tr>
    		<td id="test" align="center" height="50"></td>
    	</tr>
    </table>
  </body>
</html>

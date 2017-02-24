<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>删除下拉列表的选项 </title>
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
		function loadSelectOption(){
			var selectObj = document.getElementById("show");
			var str = ["吉林","辽宁","黑龙江","北京","上海"];
			for(var i=0;i<5;i++){
				var op = document.createElement("option");
				op.innerHTML=str[i];
				selectObj.appendChild(op);
			}
			
		}
		
		function del(){
			var selectObj = document.getElementById("show");
			selectObj.remove(selectObj.length-1);
		}
		
		function add(){
			var selectObj = document.getElementById("show");
			var op = document.createElement("option");
			op.innerHTML = document.getElementById("opValue").value;
			selectObj.appendChild(op);
		}
	</script>
  </head>
  
  <body onload="loadSelectOption()">
    <table background="bg.bmp" width="270" height="200">
    	<tr>
    		<td align="center">【删除下拉列表的选项】 </td>
    	</tr>
    	<tr>
    		<td id="test" align="center">
    			<input type="text" id="opValue" /> 
    			<input type="button" value="增加" onclick="add()" />
    			<input type="button" value="删除" onclick="del()" />
    		</td>
    	</tr>
    	<tr>
    		<td id="test">
    		
    			 <select id="show" size="8" style="width:120px">
    			 
    			 </select>
    		</td>
    	</tr>
    </table>
  </body>
</html>

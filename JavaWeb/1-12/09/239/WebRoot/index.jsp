<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>可编辑表格 </title>
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
		//双击单元格后，在单元格中创建文本框
		var inputObj = document.createElement("input");
		inputObj.type="text";
		var curCell;//双击单元格后的当前单元格
		function edit(event){
			if(event==null){
				curCell = window.event.srcElement;
			}
			else{
				curCell = event.target;
			}
			inputObj.value=curCell.innerHTML;//将单元格的值填充到文本框
			inputObj.onblur=end;//当文本框失去焦点时触发end函数
			curCell.innerHTML=" ";//清空当前单元格内容
			curCell.appendChild(inputObj);//将文本框添加到当前单元格内
		}
		function end(){
			curCell.innerHTML=inputObj.value;
		}
	</script>
  </head>
  
  <body>
  
    <table background="bg.jpg"  width="400" height="200" ondblclick="edit()"  border="1">
    	<tr >
    		<td align="center">JavaWeb范例大全 </td>
    		<td align="center">.NET范例大全 </td>
    		<td align="center">C$范例大全</td>
    		<td align="center"> PHP范例大全</td>
    	</tr>
    	<tr>
    		<td align="center">JavaWeb编程宝典</td>
    		<td align="center"> .NET编程宝典</td>
    		<td align="center"> C#编程宝典</td>
    		<td align="center"> PHP编程宝典</td>
    	</tr>
    	<tr>
    		<td align="center"> JavaWeb典型模块大全</td>
    		<td align="center"> .NET典型模块大全</td>
    		<td align="center">C#典型模块大全 </td>
    		<td align="center"> PHP典型模块大全</td>
    	</tr>	
    </table> 
  </body>
</html>
	
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>转换为Calendar对象</title>
    
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
			border: 1px solid;
			border-color: green;
			color: green;
			font-size: 13px;
			font-family: 华文细黑;
		}
	</style>
  </head>
  <body>
  
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
    <table>
    	<tr>
			<td align="right">使用Calendar对象获得的当前时间：</td>
			<td>
				<!-- 从StringUtil对象中获得timeStr1的属性值 -->	
				<jsp:getProperty property="timeStr1" name="strBean"/>
			</td>
		</tr>
		<tr >
			<td align="right" >使用Date对象获得的当前时间：</td>
			<td >	
				<!-- 从StringUtil对象中获得timeStr2的属性值 -->	
				<jsp:getProperty property="timeStr2" name="strBean"/>
			</td>		
		</tr>
 	</table>	
  </body>
</html>

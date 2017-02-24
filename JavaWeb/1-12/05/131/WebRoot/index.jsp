<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>将整型值转换为字符串</title>
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
			font-family:华文细黑;
			font-size: 15px;
			color:black;
			background-color: white;
		}
	</style>
  </head>
  
  <body>
  
  	 <%
  		int userAge = 35;
  	 %>
     <!-- 使用useBean动作导入StringUtil类 -->
     <jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
     <!-- 对StringUtil类对象中的intValue属性赋值 -->
     <jsp:setProperty property="intValue" name="strBean" value="<%=userAge %>"/>
  		<table>
  			<tr bgcolor="skyblue">
  				<td align="center">使用String.valueOf()方法转换int值：</td>
  			</tr>
  			<tr>
  				<td align="center">
  					<!-- 获得StringUtil类对象中的strValue1属性值 -->
  					年龄1：<jsp:getProperty property="strValue1" name="strBean"/>岁
  				</td>
  			</tr>
  			<tr bgcolor="skyblue">
  				<td align="center">使用Integer.toString()方法转换int值：</td>
  			</tr>
  			<tr>
  				<td align="center">
  					<!-- 获得StringUtil类对象中的strValue2属性值 -->
  					年龄2：<jsp:getProperty property="strValue2" name="strBean"/>岁
  				</td>
  			</tr>
  			<tr bgcolor="skyblue">
  				<td align="center">使用Integer.valueOf().toString()方法转换int值：</td>
  			</tr>
  			<tr>
  				<td align="center">
  					<!-- 获得StringUtil类对象中的strValue3属性值 -->
  					年龄3：<jsp:getProperty property="strValue3" name="strBean"/>岁
  				</td>
  			</tr>
  		</table>		
  </body>
</html>

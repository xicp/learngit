<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>字符串转换为整型</title>
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
  		String strAge = "26";
  	 %>
     <!-- 使用useBean动作导入StringUtil类 -->
     <jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
     <!-- 对StringUtil类对象中的strValue属性赋值 -->
     <jsp:setProperty property="strValue" name="strBean" value="<%=strAge %>"/>
  		<table>
  			<tr bgcolor="skyblue">
  				<td align="center">使用Integer.parseInt()方法转换字符串：</td>
  			</tr>
  			<tr>
  				<td align="center">
  					<!-- 获得StringUtil类对象中的intValue1属性值 -->
  					年龄1：<jsp:getProperty property="intValue1" name="strBean"/>岁
  				</td>
  			</tr>
  			<tr bgcolor="skyblue">
  				<td align="center">使用Integer.valueOf()方法转换字符串：</td>
  			</tr>
  			<tr>
  				<td align="center">
  					<!-- 获得StringUtil类对象中的intValue2属性值 -->
  					年龄2：<jsp:getProperty property="intValue2" name="strBean"/>岁
  				</td>
  			</tr>
  		</table>	
  </body>
</html>

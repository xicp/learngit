<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>检查</title>
    
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
   	<%
   		String str = request.getParameter("str");
   		String startStr = request.getParameter("startStr");
  	 %>
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	 <!-- 对StringUtil类的str属性赋值 -->
  	<jsp:setProperty property="str" name="strBean" value="<%=str %>"/>
    <!-- 对StringUtil类的startStr属性赋值 -->
    <jsp:setProperty property="startStr" name="strBean" value ="<%=startStr %>"/>
    <table>
    	<tr>
			<td align="right">输入的字符串：</td>
			<td>	
				<jsp:getProperty property="str" name="strBean"/>
			</td>
		</tr>
		<tr >
			<td align="right">开头的字符串：</td>
			<td>	
				<jsp:getProperty property="startStr" name="strBean"/>
			</td>		
		</tr>
		<tr>
			<td align="right">验证结果：</td>
			<td>	
				<jsp:getProperty property="check" name="strBean"/>
			</td>		
		</tr>
 	</table>	
  </body>
</html>

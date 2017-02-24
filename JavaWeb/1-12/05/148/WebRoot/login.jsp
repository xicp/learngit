<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>计算两个日期相差的天数</title>
    
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
   		String name = request.getParameter("name");
   		String pwd = request.getParameter("pwd");
  	 %>
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	 <!-- 对StringUtil类的属性赋值 -->
  	<jsp:setProperty property="name" name="strBean" value="<%=name %>"/>
  	<jsp:setProperty property="pwd" name="strBean" value="<%=pwd %>"/>
    <table>
    	<tr>
			<td align="right">提示信息：</td>
			<td>
				<!-- 从StringUtil对象中获得属性值 -->	
				<jsp:getProperty property="cue" name="strBean"/>
			</td>
		</tr>
		<tr>
			<td align="center" colspan="2"><a href="index.jsp">[返回]</a></td>
		</tr>
 	</table>	
  </body>
</html>

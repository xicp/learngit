<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>处理数字分位显示</title>
    
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
			font-size: 12px;
		}
	</style>
  </head>
  <body>
  
   	<%
   		String longValueStr = request.getParameter("longValue");//获取表单中的长数字的字符串
   		String digit = request.getParameter("digit");			//获取分位位数字符串
		long longValue = Long.parseLong(longValueStr);			//将长数字的字符串转换为long类型
		int d = Integer.parseInt(digit);						//将分位位数字符串转换为int类型
  	 %>
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	 <!-- 对StringUtil类的longValue属性赋值 -->
  	<jsp:setProperty property="longValue" name="strBean" value="<%=longValue %>"/>
  	 <!-- 对StringUtil类的digit属性赋值 -->
  	<jsp:setProperty property="digit" name="strBean" value="<%=d %>"/>
    <table>
    	<tr >
			<td >分位之前的数字：</td>
			<td align="left">	
				<jsp:getProperty property="longValue" name="strBean"/>
			</td>
		</tr>
		<tr >
			<td >分位之后的数字：</td>
			<td align="left">	
				<jsp:getProperty property="formatStr" name="strBean"/>
			</td>
			
		</tr>
 	</table>	
  </body>
</html>

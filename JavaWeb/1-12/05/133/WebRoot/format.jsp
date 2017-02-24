<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>处理格式化数字</title>
    
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
   		String num = request.getParameter("num");
   		String length = request.getParameter("length");
		int n = Integer.parseInt(num);
		int l = Integer.parseInt(length);
  	 %>
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	 <!-- 对StringUtil类的intValue属性赋值 -->
  	<jsp:setProperty property="intValue" name="strBean" value="<%=n %>"/>
  	 <!-- 对StringUtil类的minimumDigit属性赋值 -->
  	<jsp:setProperty property="minimumDigit" name="strBean" value="<%=l %>"/>
    <table>
    	<tr >
			<td >格式化之前的数字：</td>
			<td align="left">	
				<jsp:getProperty property="intValue" name="strBean"/>
			</td>
		</tr>
		<tr >
			<td >格式化之后的字符串：</td>
			
			<td align="left">	
				<jsp:getProperty property="formatStr" name="strBean"/>
			</td>
			
		</tr>
 	</table>	
  </body>
</html>

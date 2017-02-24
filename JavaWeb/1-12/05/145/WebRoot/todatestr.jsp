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
  
   	<%
   		String dateStr = request.getParameter("datestr");	//获得表单中的字符串
   		String date[] =dateStr.split("-");					//根据"-"分割字符串为数组
   		int y =Integer.parseInt(date[0]);					//获得字符串中的年
   		int m =Integer.parseInt(date[1]);					//获得字符串中的月
   		int d = Integer.parseInt(date[2]);					//获得字符串中的日
   		Calendar c = Calendar.getInstance();				//创建一个Calendar对象 
   		c.set(y,m-1,d);										//将年月日设置为Calendar对象的年月日
  	 %>
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	 <!-- 对StringUtil类的calendar属性赋值 -->
  	<jsp:setProperty property="calendar" name="strBean" value="<%=c %>"/>
    <table >
    	<tr>
			<td align="right">转换为日期字符串：</td>
			<td>
				<!-- 从StringUtil对象中获得dateStr的属性值 -->	
				<jsp:getProperty property="dateStr" name="strBean"/>
			</td>
		</tr>
 	</table>	
  </body>
</html>

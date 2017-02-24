<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>处理字符串截取</title>
    
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
  		String likes = request.getParameter("likes");//从请求中获取以","分隔的字符串 
  	 %>
  	 <!-- 使用useBean动作标签导入JavaBean对象 -->
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	 <!-- 对StringUtil类的对象strBean的str属性赋值 -->
  	<jsp:setProperty property="str" name="strBean" value="<%=likes %>"/>
  	 <!-- 对StringUtil类的对象strBean的listSeparator属性赋值 -->
  	<jsp:setProperty property="listSeparator" name="strBean" value=","/>
  	<%
		String likeArr[] = strBean.getStrArr();//分隔后的字符串数组
	 %>
    <table>
		<tr >
			<td width="100" valign="top">您选择的运动有：</td>
			<% 
				for(int i = 0;i<likeArr.length;i++){
			 %>
			<td align="left">	
				【<%=likeArr[i] %>】
			</td>
			<%} %>
		</tr>
 	</table>	
  </body>
</html>

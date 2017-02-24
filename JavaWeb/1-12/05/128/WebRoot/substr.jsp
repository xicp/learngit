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
			color: gray;
			font-size: 12px;
		}
	</style>
  </head>
  <body>
  
   	<%
  		String str = request.getParameter("str");
  	 %>
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	<jsp:setProperty property="str" name="strBean" value="<%=str %>"/>
    <table width="200">
		<tr >
			<td width="60" valign="top">留言内容：</td>
			<td align="left">
				<jsp:getProperty property="str" name="strBean"/>
			</td>
		</tr>
 	</table>	
  </body>
</html>

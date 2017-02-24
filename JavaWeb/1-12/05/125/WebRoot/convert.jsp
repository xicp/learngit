<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>转换页</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<style type="text/css">
		table{
			font-size: 12px;
			color: gray;
			border: 1px solid;
			border-color: green
		}
	</style>
  </head>
  
  <body>
  
  	<%
  		String  money=request.getParameter("money");
  		System.out.println(money);
   	%>
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	<jsp:setProperty property="money" name="strBean" value="<%=money%>"/>
   	<table>
   		<tr>
   			<td align="center" bgcolor="skyblue"> 转换结果：</td>
   		</tr>
   		<tr height="25">
   			<td bgcolor="yellow"><jsp:getProperty property="money" name="strBean"/></td>
   		</tr>
   	</table>
  </body>
</html>

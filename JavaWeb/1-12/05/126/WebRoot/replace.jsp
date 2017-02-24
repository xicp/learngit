<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>替换字符串处理页</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
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
  		String info = request.getParameter("info");
  	 %>
  	<jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
  	<jsp:setProperty property="str" name="strBean" value="<%=info %>"/>
    <table width="240" >
		<tr>
			<td align="center">查看信息结果</td>
		</tr>
		<tr>
			<td height="100" valign="top">
				<jsp:getProperty property="str" name="strBean"/>
			</td>
		</tr>
 	</table>	
  </body>
</html>

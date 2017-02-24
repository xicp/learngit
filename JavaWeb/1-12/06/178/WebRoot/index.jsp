<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
			font-size: 14px;
			color: green;
			font-family: 楷体;
		}
		input{
			font-size: 14px;
			color: green;
			font-family: 楷体;
		}
		.mydiv{
			font-size: 14px;
			color: gray;
			width: 400;
			height: 150;
			border: 1px solid;
			border-color: orangered;
		}
	</style>
  </head>
  
  <body>
  <div align="center" >
  <fieldset class="mydiv">
  	<legend >个人所得税计算器</legend>
   <form action="incometax" method="post">
   		<table> 
   			<tr>
   				<td>收入金额：</td>
   				<td>
   					<input type="text" name="laborage"  />元
   				</td>
   			</tr>
   			<tr>
   				<td>起征金额：</td>
   				<td>
   					<input type="text" name="startpoint" value="2000" />元
   				</td>
   			</tr>
   			<tr>
   				
   				<td align="center" colspan="2">
   					<input type="submit"  value="计算个税" />
   				</td>
   			</tr>
   		</table>
   </form>
    </fieldset>
   </div>
  </body>
</html>

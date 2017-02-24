<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>计算字符串的实际长度</title>
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
		input {
			font-size: 12px;
			color: gray;
		}
		textarea{
			font-size: 12px;
			color: gray;
		}
	</style>
  </head>
  
  <body>
   
  	<form action="getlength.jsp" method="post">
  		<table>
  			<tr height="35">
  				<td align="center">请输入字符串：</td>
  				<td>
  					<input type="text" name = "str" />
  				</td>
  				<td align="center">
  					<input  type="submit" value="提 交" />
  				</td>
  			</tr>
  		</table>		
  	</form>
  </body>
</html>

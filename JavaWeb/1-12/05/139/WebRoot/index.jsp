<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>判断字符串是否包含英文字母</title>
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
			font-family:华文细黑;
			font-size: 13px;
			color:gray;
			
		}
		input{
			font-family:华文细黑;
			font-size: 13px;
			color:gray;
		}
	</style>
  </head>
  
  <body>
  
  	<form action="check.jsp" method="post">
     <table>
     	<tr>
     		<td align="right">请输入字符串：</td>
     		<td><input type="text" name="str"  size="30"/></td>
     	</tr> 
     	<tr>
     		<td colspan="2" align="center"><input type="submit" value="检  查" /></td>
     	</tr>
     </table>	
     </form>
  </body>
</html>

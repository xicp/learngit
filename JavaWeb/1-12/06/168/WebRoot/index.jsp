<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Cookie</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function a(){
			var str="12345.6";
			var s="";
			for(var i=0;i<str.length;i++){
				if(str.charCodeAt(i)>=48&&str.charCodeAt(i)<=57){
					s=s+str[i];
				}
			}
			alert(isNaN(12345));
			if(s.length<str.length){
			
				//alert(isNa);
			}
		}
	</script>
	<style type="text/css">
		table{
			font-size:14px;
			font-family: 隶书;
			color:gray;
			border: 1px green solid;
		}
		input{
			font-size:14px;
			font-family: 隶书;
			color:gray;
		}
	</style>
  </head>
  
  <body onload="a()">
  
  <%
  		String userName=null;						//用于保存从cookie中读取出的用户名
  		Cookie cookieArr[] = request.getCookies();	//获取客户端的所有Cookie
  		if(cookieArr!=null&&cookieArr.length>0){
	  		for(Cookie c:cookieArr){
	  			if(c.getName().equals("userName")){		//如果Cookie中有一个名为userName的Cookie
	  				userName = URLDecoder.decode(c.getValue(),"UTF-8");			//获得此cookie的值 
	  			}
	  		}
  		}
   %>
   
   	<form action="cookieservlet" method="post">
   		<table align="center">
   			<tr>
   				<td>用户名：</td>
   				<td>
   				
   				<input type="text" name="name" value="<%if(userName!=null){out.print(userName);}%>"/>
   				
   				</td>
   			</tr>
   			<tr>
   				<td>密码：</td>
   				<td><input type="password" name="pwd" /></td>
   			</tr>
   			<tr>
   				<td colspan="2"><input type="submit" value="登 录" /></td>
   			</tr>
   		</table>
   	</form>
  </body>
</html>

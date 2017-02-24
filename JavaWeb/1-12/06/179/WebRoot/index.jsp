<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.MakeMD5" %>
<%@ page import="java.net.URLDecoder" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	boolean loginFlag = false;					//设置一个变量 ，用于保存是否登录
	String account = null ;						//声明用于保存从Cookie中读取的账号
	String md5Account = null;					//声明用于保存从Cookie中读取的加密的账号 
	Cookie cookieArr[] = request.getCookies(); 	//获取请求中所有的Cookie
	if(cookieArr!=null&&cookieArr.length>0){
		for(Cookie cookie : cookieArr){			//循环Cookie数组
			if(cookie.getName().equals("account")){
				account = cookie.getValue();	//找到账号的Cookie值 
				account = URLDecoder.decode(account,"UTF-8");//解码  ，还原中文字符串的值 
			}
			if(cookie.getName().equals("md5Account")){
				md5Account = cookie.getValue();	//找到加密账号的Cookie值  
			}
		}
	}
	if(account!=null&&md5Account!=null){
		loginFlag = md5Account.equals(MakeMD5.getMD5(account));
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>利用Cookie实现永久登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.style1{
			width: 400px;
			height: 200px;
			border: 1px solid;
			border-color: green;
		}
		table{
			font-size: 14px;
			color: navy;
			font-family: 楷体;
		}
		input{
			font-size: 14px;
			color: navy;
			font-family: 楷体;
		}
		.btn{
			font-size: 14px;
			background-color:orange;
			color: white;
			font-family: 楷体;
		}
	</style>
  </head>
  
  <body>
  <%
  	if(loginFlag){
   %>
   <fieldset class="style1" >
  	<legend>欢迎您回来</legend>
  		<table align="center">
  			<tr>
  				<td><%=account %>，欢迎您登录本网站！</td>
  				<td align="center">
  					<a href="<%=basePath%>foreverlogin?action=logout">注销登录</a>
  				</td>
  			</tr>
  		</table>
   </fieldset>
   <%}else{ %>
  <fieldset class="style1">
  	<legend>用户登录</legend>
  	
    <form action="foreverlogin?action=login" method="post">
    	<table align="center">
    		<tr>
    			<td>账号：</td>
    			<td><input type="text" name="account"></td>
    		</tr>
    		<tr>
    			<td>密码：</td>
    			<td><input type="password" name="pwd"></td>
    		</tr>
    		<tr>
    			<td>有效期：</td>
    			<td>
    				<input type="radio" name="timeout" value="-1" checked="checked">关闭浏览器即失效<br/>
    				<input type="radio" name="timeout" value="<%=30*24*60*60 %>">30天内有效<br/>
    				<input type="radio" name="timeout" value="<%=Integer.MAX_VALUE %>">永久有效
    			</td>
    		</tr>	
    		<tr>
    			<td colspan="2" align="center"><input type="submit" value="登  录" ></td>
    		</tr>	
    	</table>
    </form>
   </fieldset>
   <%} %>
  </body>
</html>

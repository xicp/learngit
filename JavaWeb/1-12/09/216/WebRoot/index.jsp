<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证网站地址是否有效</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkNetURL(){
		var netURL = document.getElementById("netURL"); 
		var regStr = "^((https|http|ftp|rtsp|mms)?://)?"    	//域名之前的协议字符串可以出现一次或不出现  
                    + "(([0-9a-zA-Z_!~*'().&=+$%-]+: )?[0-9a-zA-Z_!~*'().&=+$%-]+@)?" //ftp的user@   
                    + "(([0-9]{1,3}\.){3}[0-9]{1,3}" 		// 验证IP形式的URL，如：192.168.10.16    
                    + "|" 									// 输入的可以是IP或域名   
                    + "([0-9a-zA-Z_!~*'()-]+\.)*" 			// 验证域名  www.   
                    + "([0-9a-zA-Z][0-9a-zA-Z-]{0,61})?[0-9a-zA-Z]\." // 验证二级域名   
                    + "[a-zA-Z]{2,6})(:[0-9]{1,4})?" 		// 域名中可能包含端口    
                    + "((/?)|"    
                    + "(/[0-9a-zA-Z_!~*'().;?:@&=+$,%#-]+)+/?)$";   
    	var re=new RegExp(regStr);  						//创建正则表达式对象  
		if(!re.test(netURL.value)){							//验证输入的字符串是否符合规则
			alert("您输入的网站URL地址有误！");
			netURL.focus();
			return;
		}
		document.getElementById("myform").submit();	
	}
	</script>
	<style type="text/css">
		table{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
		
	
		}
		input{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
		}
		font{
			font-size: 12px;
			font-family: 楷体;
			color:orangered;
		}
		.style1{
			width: 500px;
			height: 260px;
		}
	</style>
  </head>
  
  <body>
    <fieldset class="style1"><legend>用户注册</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>用户名：</td>
   			<td>
   				<input type="text"  id="numberPlate"> 			
   			</td>
   		</tr>	
   		<tr>
   			<td>密码：</td>
   			<td>
				<input type="password" id="pwd" />
   			</td>
   		</tr>
   		<tr>
   			<td>确认密码：</td>
   			<td>
				<input type="password" id="pwd1" />
   			</td>
   		</tr>
   		<tr>
   			<td>性别：</td>
   			<td>
   				<input type="radio"  name="sex" id="man" value="m">男
   				<input type="radio" name="sex" id="woman" value="f">女
   			</td>
   		</tr>
   		<tr>
   			<td>年龄：</td>
   			<td>
				<input type="text" id="age" />
   			</td>
   		</tr>
   		<tr>
   			<td>E-mail：</td>
   			<td>
				<input type="text" id="age" />
   			</td>
   		</tr>
   		<tr>
   			<td>个人主页：</td>
   			<td>
				<input type="text" id="netURL" size="50"/>
   			</td>
   		</tr>	
   		<tr>
   			<td align="center" colspan="2">
   			
   				<input type="button" value="提 交" onclick="checkNetURL()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

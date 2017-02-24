<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证用户登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/Untitled-4.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/request.js"></script>
	<script type="text/javascript">
	var opinionRequest=false;
	//登录请求
	function enter(){
		if(checkInsert()){
			var name=document.getElementById("username").value;				//用户名
			var pwd = document.getElementById("userpwd").value;				//密码
			var url="UserLoginServlet";										//服务器地址
			var param ="action=checkLogin&name="+name+"&pwd="+pwd;							//请求参数 
			opinionRequest=httpRequest("post",url,true,callbackFunc,param);	//调用请求方法 
			
		}
	}
	//验证用户名密码是否合法
	function checkInsert(){
		var name = document.getElementById("username").value;
		var pwd = document.getElementById("userpwd").value;
		if(name==null||name==""){
			alert("请输入您的账号！");
			document.getElementById("username").focus();
			return false;
		}
		if(pwd==null||pwd==""){
			alert("请输入您的密码！");
			document.getElementById("userpwd").focus();
			return false;
		}
		if(pwd!=null&&pwd!=""){
			if(pwd.length<6||pwd.length>16){
				alert("输入有误，密码长度为6-16位！");
				document.getElementById("userpwd").focus();
				return false;
			}
		}
		return true;
	}
	//Ajax回调函数
	function callbackFunc(){
		if( opinionRequest.readyState==4 ){		 //判断响应是否完成 
			
     	 	if( opinionRequest.status == 200 ){  //判断响应是否成功
     	 		
         		var hasUser=opinionRequest.responseXML.getElementsByTagName("hasUser");
         		var noUser=opinionRequest.responseXML.getElementsByTagName("noUser");
         		if(typeof(hasUser)!="undefined"&& hasUser.length>0){   
         			alert("登录成功！");
         		}
         		if(typeof(noUser)!="undefined"&& noUser.length>0){
	         		alert("用户名或密码错误！");
	         		document.getElementById("username").focus();
	         		opinionRequest=false;
	         		return false;
         		}
			}
		}
	}
	
	</script>
  </head>
 <body bgcolor="#FFFFFF">
<form id="enterform">
<table width="800" border="0" align="center" cellpadding="0"
	cellspacing="0" id="__01">
	<tr>
		<td colspan="3"><img id="Userlogin_01"
			src="images/Userlogin_01.gif" width="800" height="141" alt="" /></td>
	</tr>
	<tr>
		<td rowspan="2"><img id="Userlogin_02"
			src="images/Userlogin_02.gif" width="115" height="321" alt="" /></td>
		<td height="182" background="images/Userlogin_03.gif">
		<table width="317" height="129" border="0" cellpadding="0"
			cellspacing="0">
			<tr>
				<td width="106" align="right" class="td">用户名：</td>
				<td colspan="2" valign="middle"><label> <input
					name="username" id="username" type="text" /> </label></td>
			</tr>
			<tr>
				<td align="right" class="td">密 &nbsp;&nbsp;码：</td>
				<td colspan="2"><input name="userpwd" id="userpwd"
					type="password" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td width="110" height="40"><img style="cursor: pointer;"
					src="images/denglu.gif" width="89" height="37" border="0"
					onclick="enter()" /></td>
				<td width="101"><img style="cursor: pointer;"
					src="images/zhuce.gif" width="89" height="37"  /></td>
			</tr>
		</table>
		</td>
		<td rowspan="2"><img id="Userlogin_04"
			src="images/Userlogin_04.gif" width="354" height="321" alt="" /></td>
	</tr>
	<tr>
		<td><img id="Userlogin_05" src="images/Userlogin_05.gif"
			width="331" height="139" alt="" /></td>
	</tr>
</table>
</form>
</body>
</html>

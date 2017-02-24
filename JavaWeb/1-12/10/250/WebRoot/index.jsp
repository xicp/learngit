<%@page contentType="text/html" pageEncoding="GBK"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>实时显示聊天内容</title>
		<link href="CSS/style.css" rel="stylesheet">
		
<script language="javascript" src="js/request.js"></script>
<script language="javascript">
var request =false;
function send(){	//验证聊天信息并发送
	var user = document.getElementById("user").value;
	var speak = document.getElementById("speak").value;
	if(user==""){
		alert("请输入您的昵称！");
		return false;
	}
	if(speak==""){
		alert("发送信息不可以为空！");
		document.getElementById("speak").focus();
		return false;
	}
	document.getElementById("speak").value="";				//清空内容文本框的值
	document.getElementById("speak").focus();				//让内容文本框获得焦点
       var url="Chat";											//服务器地址
	var param ="action=send&user="+user+"&speak="+speak;	//请求参数 
	request=httpRequest("post",url,true,callback,param);	//调用请求方法 	
}
function callback(){
	request =false;
}

function getContent(){
	var url="Chat";											//服务器地址
	var param ="action=get&nocache="+new Date().getTime();	//请求参数 
	request=httpRequest("post",url,true,callback_content,param);	//调用请求方法 	
}
//Ajax回调函数 
function callback_content(){
	if(request.readyState == 4){
		if(request.status == 200){
			document.getElementById("content").innerHTML=request.responseText;		//显示聊天内容
			request =false;
		}
	}
}

window.setInterval("getContent();",1000);
window.onload=function(){
	 getContent();		//当页面载入后调用Ajax获取聊天内容
}
</script>
    </head>
    <body>
<table width="689" height="148" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top.jpg">
  <tr>
    <td height="131" background="images/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="689" height="217" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="206" valign="top" bgcolor="#EAF7FD" style="padding:10px;"><div id="content" style="height:206px; overflow:hidden;">欢迎光临碧海聆音聊天室！</div></td>
  </tr>
</table>
<table width="689" height="86" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg_bottom.jpg">
  <tr>
    <td height="83" align="center" background="images/top_bg.jpg"><form id="form1" method="post" action="">
      <input name="user" type="text" id="user" size="20">
      说：
      <input name="speak" type="text" id="speak" size="50" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
    &nbsp;
    
    <input name="Submit" type="button" class="btn_grey" value="发送" onClick="send()">
    </form>
    </td>
  </tr>
</table>
    </body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实时弹出气泡提示窗口</title>
<link href="CSS/style.css" rel="stylesheet">

<script src="js/request.js"></script>
<script language="javascript" src="js/remind.js"></script>
<script language="javascript">

var bbsid=0;		//当前公告ID
var request = false;//Ajax请求函数返回的XMLHttpRequest对象
function loadBubbleTip(){
	var url="BbsServlet";											//服务器地址
	var param ="action=getBbs&nocache=" + new Date().getTime();	//请求参数 
	request=httpRequest("post",url,true,callback,param);	//调用请求方法 
}

function callback() {
	if(request.readyState == 4){
		if(request.status == 200){
			var doc = request.responseXML; //获取XML格式的新闻信息
			if(doc.getElementsByTagName("title").length>0){
				var id = doc.getElementsByTagName("id")[0].firstChild.nodeValue;//获取XML文档中的id节点的第一个子节点的值
				bbsid=id;
				var content = doc.getElementsByTagName("title")[0].firstChild.nodeValue;//获取XML文档中的title节点的第一个子节点的值
				var foot1= doc.getElementsByTagName("time")[0].firstChild.nodeValue;	//获取XML文件中的time节点的第一个子节点的值
				var remindMessage = new PopBubble(307,170," ",content,foot1);  
				remindMessage.box(null,null,null,screen.height-30);	//设置弹出窗口的左边、右边、顶边和底边框的位置 
				remindMessage.speed    = 10; 		//设置窗口的弹出速度
				remindMessage.step    = 2; 			//设置窗口的弹出步幅
				remindMessage.show(); 				//弹出窗口
				PopBubble.prototype.oncommand = function(){  
					window.open("BbsServlet?action=getDetail&id="+id,"","width=513,height=567,scrollbars=1");
					this.close = true;
					this.hide(); 			//收缩窗口
				}
			}
			request = false;
		}
	}
}
window.onload=function(){
		loadBubbleTip();
		window.setInterval(loadBubbleTip,1000*20);
}
	</script>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
  </head>
  
  <body><center>
    <img src="images/main_bg.jpg">
  </center>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>实时显示系统时间</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="Css/style.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		
		/**
		*实时显示系统时间
		*/
		function getLangDate(){
			var dateObj = new Date();			//表示当前系统时间的Date对象 
			var year = dateObj.getFullYear();	//当前系统时间的完整年份值
			var month = dateObj.getMonth()+1;	//当前系统时间的月份值 
			var date = dateObj.getDate();		//当前系统时间的月份中的日
			var day = dateObj.getDay();			//当前系统时间中的星期值
			var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
			var week = weeks[day];				//根据星期值，从数组中获取对应的星期字符串 
			var hour = dateObj.getHours();		//当前系统时间的小时值 
			var minute = dateObj.getMinutes();	//当前系统时间的分钟值
			var second = dateObj.getSeconds();	//当前系统时间的秒钟值
			//如果月、日、小时、分、秒的值小于10，在前面补0
			if(month<10){
				month = "0"+month;
			}
			if(date<10){
				date = "0"+date;
			}
			if(hour<10){
				hour = "0"+hour;
			}
			if(minute<10){
				minute = "0"+minute;
			}
			if(second<10){
				second = "0"+second;
			}

			var newDate = year+"年"+month+"月"+date+"日  "+week+" "+hour+":"+minute+":"+second;
			document.getElementById("dateStr").innerHTML = "系统公告：[ "+newDate+" ]";
			//setTimeout("getLangDate()",1000);//每隔1秒重新调用一次 
			window.setInterval("getLangDate()", 1000);
		}	
		
	</script>
  </head>
 <body onLoad="getLangDate()">
<table width="100%" height="95"  border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_Top">
          <tr valign="top">
            <td height="72" colspan="4"><table width="100%"  border="0" cellpadding="-2" cellspacing="-2" class="tableBorder_Botton">
              <tr>
                <td width="33%" height="67" align="right"><img src="Images/board_title.gif" width="271" height="44"></td>
                <td width="67%" background="Images/banner_bg.gif">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td width="10" height="24" background="Images/bg_Navigate.GIF">&nbsp; </td>
			<!--版主登录时显示的导航条-->
            <td background="Images/bg_Navigate.GIF">
			
				<a href="#">用户注册</a> ┊
			<a href="#">用户登录</a>
			┊ <a href="#">查看留言</a> ┊ <a href="#" onClick="window.location.reload();">刷新页面</a> ┊ 
				<a href="#">版主登录</a>  </td>
            <td width="20" background="Images/bg_Navigate.GIF"><img src="Images/index.gif" width="14" height="14"></td>
            <td width="80" background="Images/bg_Navigate.GIF"><a href="#">返回首页</a></td>
          </tr>
</table>
     
  
      <table width="100%" height="45"  border="0" cellpadding="-2" cellspacing="-2">
        <tr>
          <td>  &nbsp;<img src="Images/speaker.gif" width="20" height="20"></td>
		  <td><div id="dateStr" class="word_grey"></div></td>
		  <td class="word_grey">
		    <div align="right">		      
		   您现在是游客身份！若要留言请先注册或登录！
	      </div></td>
		  <td height="25" colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td width="34">&nbsp;</td>
          <td width="723" height="13" colspan="2"></td>
          <td width="20">&nbsp;</td>
        </tr>
      </table>
</body>
</html>
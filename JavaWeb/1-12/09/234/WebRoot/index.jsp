<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>倒计时</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="CSS/style.css" rel="stylesheet">
	<link href="CSS/style.css" rel="stylesheet">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script language="javascript"> 
	
		/**
		*事件倒计时
		*@title：事件的名称  
		*@eventDate：事件的日期
		*/
		function countDown(title,eventDate){
			var dateObj = new Date();		//当前系统时间的Date对象 
			var dateStr = eventDate.split("-");
			var eventDateObj = new Date(dateStr[0],(dateStr[1]-1),dateStr[2]);//某一日期的Date对象 
			var t1 = dateObj.getTime();		//从 1970 年 1 月 1 日开始计算到 Date 对象中的时间之间的毫秒数
			var t2 = eventDateObj.getTime();//从 1970 年 1 月 1 日开始计算到 Date 对象中的时间之间的毫秒数
			var datetime=24*60*60*1000;		//一天的毫秒值 
			var days = Math.floor((t2-t1)/datetime)+1;//相差的天数 	
			if(days>0){
				document.getElementById("day_str").innerHTML="距"+title+"开幕还有"+days+"天！";
			}
			if(days==0){
				document.getElementById("day_str").innerHTML="今天是"+title+"开幕日！";
			}
			if(days<0){
				days =Math.abs(days)+1;
				document.getElementById("day_str").innerHTML="今天是"+title+"第"+days+"个比赛日！";
			}	
			setTimeout("countDown('2010南非世界杯','2010-6-11')",datetime);//每个一天调用一次本函数，刷新显示时间
		}
		
	</script>
  </head>
  
 <body onLoad="javascript:countDown('2010南非世界杯','2010-6-11')">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0" class="tableBorder">
  <tr>
    <td height="183">
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="150" valign="top" background="Images/top_bg.gif" bgcolor="#EEEEEE"><table width="100%" height="53"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="77%" height="18">&nbsp;</td>
        <td colspan="4">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td width="2%"><img src="Images/Top_flag.gif" width="3" height="7"></td>
        <td width="8%"><a href="#" onClick="window.location.reload();">刷新页面</a></td>
        <td width="1%"><img src="Images/Top_flag.gif" width="3" height="7"></td>
        <td width="12%"><a href="#" >关闭系统</a></td>
      </tr>
    </table>
      <table width="98%" height="93"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" valign="bottom" class="word_Green">当前登录用户：Remember</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="33" align="right" background="Images/navigation_bg.gif" bgcolor="#EEEEEE"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="3%">&nbsp;</td>
        <td width="27%"><div id="day_str" class="word_Green">
        </div></td>
        <td width="70%" align="right"><a href="#">首页</a>┊<a href="">系统设置</a>┊
          <a href="#">读者管理</a>┊
         <a href="#">图书管理</a>┊
          <a href="#">图书借还</a>┊
          <a href="#">系统查询</a>┊<a href="#">排行榜</a>┊<a href="">更改口令</a>┊<a href="#">退出系统</a></td>
        <td width="2%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
	</td>
	</tr>
	<td bgcolor="#FFFFFF">
	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="99%" height="180"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tableBorder_gray">
  <tr>
    <td height="178" align="center" valign="top" style="padding:5px;"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="20" align="right" valign="middle" class="word_orange">当前位置：首页 &gt;&gt;&gt;&nbsp;</td>
      </tr>
      <tr>
        <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="57" background="Images/main_booksort.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="72" valign="top" background="Images/main_booksort_1.gif"><table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="2%">&nbsp;</td>
                <td width="96%" align="center" valign="top"><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
                  <tr align="center">
                    <td width="6%" height="25">排名</td>
    <td width="11%">图书条形码</td>
    <td width="17%">图书名称</td>
    <td width="15%">图书类型</td>
    <td width="16%">书架</td>
    <td width="14%">出版社</td>
    <td width="11%">作者</td>
    <td>定价(元)</td>
                      </tr>
                </table>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="39" align="right"></td>
                    </tr>
                  </table></td>
                <td width="2%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="19" background="Images/main_booksort_2.gif">&nbsp;</td>
          </tr>
        </table>
          </td>
      </tr>
    </table>
      </td>
  </tr>
</table></td>
  </tr>
</table>
<table width="99%" height="72"  border="0" align="center" cellpadding="-2" cellspacing="-2">
      <tr>
        <td height="2" colspan="4"></td>
        </tr>
      <tr>
        <td width="124" height="23">&nbsp;</td>
        <td valign="bottom" align="center"> CopyRight &copy; 2007 www.mingrisoft.com 吉林省明日科技有限公司</td>
        <td width="141">&nbsp;</td>
      </tr>
      <tr>
        <td height="28">&nbsp;</td>
        <td align="center">本站请使用IE6.0或以上版本 1024*768为最佳显示效果</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="8"></td>
        <td height="8"></td>
        <td height="8"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

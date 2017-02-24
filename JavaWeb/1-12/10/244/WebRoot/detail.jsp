<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>限时竞拍</title>
<link href="CSS/style.css" rel="stylesheet">

<script src="js/request.js"></script>
<script language="javascript">
var timeRequest = false;
var bidRequest =false;
var listRequest = false;
/**************实时获取剩余时间***********************************************/
function getRemainTime() {
	var url="AuctionServlet";									//服务器地址
	//需要加&nocache="+new Date().getTime()，否则将剩余时间不更新的情况
	var param ="action=getRemainTime&id=${requestScope.id}&nocache="+ new Date().getTime();
	timeRequest=httpRequest("post",url,true,callbackFunc_time,param);	//调用请求方法 		
}

//Ajax回调函数
function callbackFunc_time(){
	if( timeRequest.readyState==4 ){		 //判断响应是否完成 
    	if( timeRequest.status == 200 ){  //判断响应是否成功
    	
       		var remain = timeRequest.responseText; //获取剩余时间
			if ( remain.replace(/\s/g, "").indexOf("end") != -1) {
				window.clearInterval(t);
				document.getElementById("ctrlBtn").innerHTML = "<img src='images/end.jpg' border='0'>";
				document.getElementById("remain").innerHTML = "<font style='color:green;'>已经结束</font>";
				document.getElementById("state").innerHTML="已经结束的拍卖";
				document.getElementById("bidArea").style.display = "none";
			} else {
				document.getElementById("remain").innerHTML = remain;
			}
		}
	}
}
	
	/**************实时获取最高出价信息***********************************************/
	function getBidInfo() {
		var url="AuctionServlet";									//服务器地址
		var param ="action=getBidInfo&id=${requestScope.id}&nocache="+ new Date().getTime();
		bidRequest=httpRequest("post",url,true,callbackFunc_getBid,param);	//调用请求方法 	
	}
	function callbackFunc_getBid() {
		if(bidRequest.readyState==4 ){		 //判断响应是否完成 
    	if( bidRequest.status == 200 ){  //判断响应是否成功
       		var h = bidRequest.responseText; //获取出价信息
			h = h.replace(/\s/g, ""); //去除字符串中的Unicode空白符
			var heightPrice = h.substring(0, h.indexOf("|"));//分离出最高竞价
			var bidCount = h.substring(h.indexOf("|") + 1, h.indexOf("|", h
					.indexOf("|") + 1));//分离出出价次数
			var bidder = h.substring(h.indexOf("|", h.indexOf("|") + 1) + 1,
					h.length);//分离出出价人
			document.getElementById("heightPrice").innerHTML = heightPrice; //显示当前价格
			document.getElementById("bidCount").innerHTML = bidCount;//显示出价次数
			document.getElementById("bidder").innerHTML = bidder;//显示出价人
		}
	}
		
	}
	/******************获取出价列表*******************************************/
	function getBidList() {	
		var url="AuctionServlet";									//服务器地址
		var param ="action=getBidList&id=${requestScope.id}&nocache="+ new Date().getTime();
		listRequest=httpRequest("post",url,true,callbackFunc_getList,param);	//调用请求方法
	}
	function callbackFunc_getList() {
			if( listRequest.readyState==4 ){		 //判断响应是否完成 
    	if( listRequest.status == 200 ){  //判断响应是否成功
		var doc = listRequest.responseXML; //获取出价记录
		var bidList = doc.getElementsByTagName("bid");
		var content = "";
		content += "<table width='97%' height='59' border='0' cellpadding='0' cellspacing='1' bgcolor='#666666'>";
		content += "<tr>";
		content += "<td height='26' align='center' bgcolor='#EEEEEE'>买家</td>";
		content += "<td align='center' bgcolor='#EEEEEE'>所出价格</td>";
		content += "<td align='center' bgcolor='#EEEEEE'>出价时间</td>";
		content += "<td align='center' bgcolor='#EEEEEE'>状态</td>";
		content += "</tr>";
		if ((bidList != null) && (bidList.length != 0)) {
			for (i = 0; i < bidList.length; i++) {
				var bid = bidList[i];
				var bidding = bid.childNodes[1].firstChild.data;
				var bidTime = bid.childNodes[2].firstChild.data;
				var bidder = bid.childNodes[3].firstChild.data;
				var state = bid.childNodes[4].firstChild.data;
				content += "<tr>";
				content += "<td height='26' bgcolor='#FFFFFF'>&nbsp;" + bidder
						+ "</td>";
				content += "<td align='center' bgcolor='#FFFFFF'>" + bidding
						+ "</td>";
				content += "<td align='center' bgcolor='#FFFFFF'>" + bidTime
						+ "</td>";
				content += "<td align='center' bgcolor='#FFFFFF'>" + state
						+ "</td>";
				content += "</tr>";
			}
		}
		content += "</table>";
		document.getElementById("bidList").innerHTML = content;
		}
		}
	}
	/*************************************************************/

	//页面载入后要执行的操作
	window.onload = function() {
		getRemainTime();
		t = window.setInterval("getRemainTime()", 1000); //每隔1秒钟调用一次getRemainTime()方法
		getBidInfo();
		window.setInterval("getBidInfo()", 60 * 1000); //每隔1分钟获取一次出价信息
	}
	/*************************************************************/
	//判断输入的价格是否合理
	function check(form) {
		if (isNaN(form.bid.value)) {
			alert("请输入有效的数字！");
			return false;
		}
		if ((parseFloat(form.heightPrice.value) + parseFloat(form.breadth.value)) > form.bid.value) {
			alert("您出的价格不合理！");
			return false;
		}
		return true;
	}
</script>

</head>
<body>
<div id="box">
<div id="top" style="width: 100%; height: 99px;">
  <map name="Map">
    <area shape="rect" coords="199,63,269,89" href="index.jsp">
  </map>
  <img src="images/time_01.jpg" width="830" height="99" border="0" usemap="#Map"></div>
<div id="left"></div>
<div id="center">
<c:if test="${not empty(requestScope.resInfo)}">
	<c:set var="res" value="${requestScope.resInfo}"></c:set>
	<div style="height: 33px; padding-top: 8px; padding-left:20px; background-image:url(images/time_03.jpg); background-repeat:no-repeat; color:#527a00;">首页 → <span id="state">正在进行的拍卖</span>  → <font style="color:#e68502;">${res.name}</font></div>
	<div id="goodsList">
	<div style="float: left; padding: 5px; border: 1px solid #666666;"><img
		src="${res.picture}" width="200" height="165"></div>
	<div style="float: left">
	<ul>
		<li>当前价格：<b><font style="color:red;"><span id="heightPrice">${res.heightPrice }</span>（元）</font></b></li>
		<li>领先者：<span id="bidder" style="color:#005db5">${res.bidder}</span></li>
		<li>起拍价：<b>${res.startPrice }（元）</b>&nbsp;&nbsp;最小加价幅度：<b><font
			style="color: red">${res.breadth}</font>（元）</b></li>
		<li><span id="ctrlBtn"><a
			href="AuctionServlet?action=getSingleRes&id=${res.id}"><img
			src="images/bid.jpg" border="0"></a>&nbsp;&nbsp;<font  style="color:#999999; vertical-align:super">要为拍品出价，请先登录！</font></span></li>
		<li style="display:inline; vertical-align:super;">剩余时间：<span id="remain">正在获取……</span></li>
		<li style="display:inline;"><img src="images/time_11.jpg" width="26" height="26"></li>
		<li>开始时间：<fmt:formatDate value="${res.startTime }" type="both"
			pattern="yyyy-MM-dd HH:mm:ss" /></li>
		<li>结束时间：<fmt:formatDate value="${res.endTime }" type="both"
			pattern="yyyy-MM-dd HH:mm:ss" /></li>
		<li>浏览次数：<font style="color: red">${res.hit }</font>&nbsp;&nbsp;出价次数：<font style="color: red"><span id="bidCount">${res.bidCount}</span></font></li>
	</ul>
	</div>
	<div style="clear: both; width:97%; border-top:dashed #999999 1px; padding:3px;">最新20条出价记录：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
		href="#" onClick="getBidList()";>[刷新</a>]</div>
	<div id="bidList" style="clear: both;">
	<table width="97%" height="59" border="0" cellpadding="0"
		cellspacing="1" bgcolor="#666666">
		<tr>
			<td height="26" align="center" bgcolor="#EEEEEE">买家</td>
			<td align="center" bgcolor="#EEEEEE">所出价格</td>
			<td align="center" bgcolor="#EEEEEE">出价时间</td>
			<td align="center" bgcolor="#EEEEEE">状态</td>
		</tr>
		<c:forEach items="${requestScope.bidInfo}" var="bid">
			<tr>
				<td height="26" bgcolor="#FFFFFF">&nbsp;${bid.bidder}</td>
				<td bgcolor="#FFFFFF">&nbsp;${bid.bid}（元）</td>
				<td align="center" bgcolor="#FFFFFF"><fmt:formatDate
					value="${bid.bidTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td align="center" bgcolor="#FFFFFF">${bid.state }</td>
			</tr>
		</c:forEach>
	</table>
	</div>
	<div id="bidArea" style="clear: both; background-image:url(images/time_04.jpg); background-position:right; background-repeat:repeat-y;">
	<ul>
		<li><img src="images/ico01.jpg" width="8" height="13">警告：一旦出价则表明您已经认同了本网站的《拍卖相关规则》，并承担相应责任。</li>
		<c:if test="${empty(sessionScope.user)}">
			<li>
			<form name="form1" method="post" action="AuctionServlet?action=login">
			用户名：<input name="id" type="hidden" value="${requestScope.id}">
			<input name="username" type="text" id="username">
			&nbsp;&nbsp;&nbsp;&nbsp;密码： <input name="pwd" type="password"
				id="pwd"> &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit"
				name="Submit" value="登录 "></form>
			</li>
		</c:if>
		<c:if test="${not empty(sessionScope.user)}">
			<form name="form1" method="post"
				action="AuctionServlet?action=bidding" onSubmit="return check(this)">
			<li>当前用户：${sessionScope.user} <input name="userId" type="hidden"
				value="${sessionScope.userId}"> <input name="id"
				type="hidden" value="${requestScope.id}"> <input
				name="heightPrice" type="hidden" value="${res.heightPrice }">
			<input name="breadth" type="hidden" value="${res.breadth }">
			</li>
			<li>竞买价：<input name="bid" type="text" id="bidd">
			只能输入数字。单位为：人民币元</li>
			<li><input type="submit" name="Submit" value="提交 "> <input
				type="button" name="Button" value="退出 "
				onclick="window.location.href='AuctionServlet?action=logout&id=${requestScope.id}'">
			</li>
			</form>
		</c:if>
	</ul>
	</div>
	</div>
</c:if></div>
<div id="bottom"></div>
</div>
</html>
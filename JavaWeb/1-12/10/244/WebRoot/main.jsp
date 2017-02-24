<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>限时竞拍</title>
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
td{
	border-bottom:#999999 solid 1px;
}
</style>
</head>
<body>
<div id="box">
	<div id="top" style="width: 100%; height: 99px;"><img src="images/time_01.jpg" width="830" height="99" border="0" usemap="#Map">
<map name="Map">
  <area shape="rect" coords="199,63,269,89" href="#">
</map></div>
	<div id="left"></div>
	<div id="center">
		<!-- 根据状态显示用于控制显示内容的选项卡-->
		<div style="height:34px; width:97%; border-bottom:solid 5px #BADF75;">
		          <c:if test="${requestScope.state=='正在进行的拍卖'}">
		            	<img src="images/time2_03.jpg" width="120" height="34">
				<a href="AuctionServlet?action=getRes&state=1"><img src="images/time2_04.jpg" width="121" height="34" border="0"></a>
		         	</c:if>
		          <c:if test="${requestScope.state!='正在进行的拍卖'}">
		            	<a href="AuctionServlet?action=getRes&state=0"><img src="images/time4_03.jpg" width="120" height="34" border="0"></a>
				<img src="images/time4_04.jpg" width="121" height="34" border="0">           	</c:if>			
		</div>
		<!--显示拍品列表-->
		<div id="goodsList">
		  <table width="97%" height="59" border="0" cellpadding="0" cellspacing="0">
		  <c:forEach items="${requestScope.resList}" var="res">
		          <tr>
		            <td align="center"><img src="${res.picture}" width="80" height="66">&nbsp;&nbsp;</td>
		            <td>${res.name}<br>
		            浏览次数：${res.hit}</td>
		            <td >起拍价：${res.startPrice}（元）<br>
		            最高竞价：<font color="red">${res.heightPrice}</font>（元）</td>
		          <c:if test="${requestScope.state=='正在进行的拍卖'}">
		            <td align="center"><a href="AuctionServlet?action=getSingleRes&id=${res.id}"><img src="images/bid.jpg" border="0"></a></td>
		         	</c:if>
		          <c:if test="${requestScope.state!='正在进行的拍卖'}">
		            <td align="center"><a href="AuctionServlet?action=getSingleRes&id=${res.id}"><img src="images/detail.jpg" border="0"></a></td>
		         	</c:if>
		          </tr>
			</c:forEach>
		        </table>
		</div>
	</div>
	<div id="bottom"></div>	
</div>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>实时显示最新商品及报价</title>
<link href="CSS/style.css" rel="stylesheet">

<script src="js/request.js"></script>
<script language="javascript">
	var request =false;
	function getGoods() {
		var url="GoodsServlet";										//服务器地址
		var param ="action=getGoods&nocache=" + new Date().getTime();	//请求参数 
		request=httpRequest("post",url,true,callbackFunc,param);	//调用请求方法 	
	}
	function callbackFunc() {
		if(request.readyState == 4){
			if(request.status == 200){
				var doc = request.responseXML; //获取XML格式的商品信息
				var goodses = doc.getElementsByTagName("goods"); //获取goods节点对应的对象
				var innerHTML = "";
				if ((goodses != null) && (goodses.length != 0)) {
					innerHTML += "<ul>";
					for (i = 0; i < goodses.length; i++) {//通过循环将获取的商品信息按指定的格式连接成字符串
						var goods = goodses[i];
						var goodsName = goods.childNodes[0].firstChild.data;//获取商品名称
						var price = goods.childNodes[1].firstChild.data;//获取当前价格
						var picture = goods.childNodes[2].firstChild.data;//获取商品图片
						innerHTML += "<li><dl>";
						innerHTML += "<dt><img src='" + picture + "'></dt>";
						innerHTML += "<dd>" + goodsName + "</dd>";
						innerHTML += "<dd>当前价格：<font color='red'>" + price
								+ "</font>（元）</dd>";
						innerHTML += "</dl></li>";
					}
					innerHTML += "</ul>";
					innerHTML += innerHTML; //为了实现走马灯效果，所以添加这句代码
				} else {
					innerHTML = "暂无最新商品及报价！";
				}
				document.getElementById("goodsList").innerHTML = innerHTML;
				request = false;
			}
		}
	}
	window.onload = function() {
		getGoods();
		window.setInterval("getGoods()", 600000); //每隔10分钟调用一次getGoods()方法
		startMarquee(145, 10, 3000, "goodsList"); //实现走马灯特效
	}
	/*
	 * 功能：走马灯特效
	 * lineHeight：指定行高
	 * speed：滚动的速度
	 * delay：停顿的时间
	 * id：滚动的对象，通常为要滚动对象的id属性
	 */
	function startMarquee(lineHeight, speed, delay, id) {
		var t;
		var flag = false; //标记变量
		var object = document.getElementById(id); //获取要滚动显示的物体
		object.onmouseover = function() { //当鼠标停在物体上时
			flag = true
		};
		object.onmouseout = function() { //当鼠标移出物体上时
			flag = false
		};
		object.scrollTop = 0; //设置物体的滚动上边界为0
		function start() { //开始滚动函数
			t = setInterval(scrolling, speed);//每隔speed秒后执行一次scrolling函数
			if (!flag) {
				object.scrollTop += 5; //将物体的滚动上边界的值+5
			}
		}
		function scrolling() { //滚动函数
			if (object.scrollTop % lineHeight != 0) {
				object.scrollTop += 5; //将物体的滚动上边界的值+5
				if (object.scrollTop >= object.scrollHeight / 2) {
					object.scrollTop = 0; //设置物体的滚动上边界为0
				}
			} else {
				clearInterval(t); //停止setInterval()方法的执行
				setTimeout(start, delay);//每隔delay秒后执行一次start函数
			}
		}
		setTimeout(start, delay);//每隔delay秒后执行一次start函数
	}
</script>
</head>
<body>
<div id="box">
	<div id="top"></div>
	<div id="left"></div>
	<div id="center" style="float: left; width: 594px; height: 300px;">
		<div id="title"></div>
		<div id="goodsList">正在获取商品信息...</div>
		<div id="centerBottom"></div>
	</div>
	<div id="bottom"></div>
</div>
</html>
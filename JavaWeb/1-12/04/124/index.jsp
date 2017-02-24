<%@page contentType="text/html" pageEncoding="GBK"%>
<%@page import="java.util.*"%>
<%@taglib prefix="mytag" uri="http://www.tag.com/mytag"%>
<html>
	<head>
		<title>自定义生成系统菜单的标签</title>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<link href="images/css.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%
			if (session.getAttribute("menuList") == null) {
				List<List<String>> menuList = new ArrayList<List<String>>();
				List<String> sList1 = new ArrayList<String>();
				sList1.add("硬件");
				sList1.add("显示器");
				sList1.add("主机");
				sList1.add("显卡");
				sList1.add("cpu");
				sList1.add("内存");
				sList1.add("硬盘");
				menuList.add(sList1);

				List<String> sList2 = new ArrayList<String>();
				sList2.add("外设");
				sList2.add("键盘");
				sList2.add("鼠标");
				sList2.add("音箱");
				sList2.add("耳机");
				sList2.add("摄像头");
				menuList.add(sList2);

				List<String> sList3 = new ArrayList<String>();
				sList3.add("数码产品");
				sList3.add("手机");
				sList3.add("数码相机");
				sList3.add("MP3");
				sList3.add("MP4");
				sList3.add("DV摄像机");
				sList3.add("闪存卡");
				sList3.add("u盘");
				menuList.add(sList3);

				List<String> sList4 = new ArrayList<String>();
				sList4.add("数字家电");
				sList4.add("液晶电视");
				sList4.add("游戏机");
				sList4.add("投影机");
				sList4.add("冰箱");
				sList4.add("空调");
				menuList.add(sList4);

				List<String> sList5 = new ArrayList<String>();
				sList5.add("办公设备");
				sList5.add("喷墨/激光打印机");
				sList5.add("游戏机");
				sList5.add("投影机");
				sList5.add("一体机");
				sList5.add("扫描仪");
				sList5.add("复印机");
				sList5.add("传真机");
				menuList.add(sList5);

				List<String> sList6 = new ArrayList<String>();
				sList6.add("网络设备");
				sList6.add("交换机");
				sList6.add("路由器");
				sList6.add("防火墙");
				sList6.add("网卡");
				menuList.add(sList6);

				session.setAttribute("menuList", menuList);
			}
		%>
		<table width="746" height="641" align="center" background="images/bj.jpg">
			<tr>
				<td>
					<div style="position:relative; top:85px; left:20px; height: 300px;">
						<mytag:nemuTag />
				  </div>
				</td>
			</tr>
	</table>
	</body>
</html>

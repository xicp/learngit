<%@page contentType="text/html" pageEncoding="GBK"%>
<%@page import="java.util.*"%>
<%@taglib prefix="mytag" uri="http://www.tag.com/mytag"%>
<html>
	<head>
		<title>�Զ�������ϵͳ�˵��ı�ǩ</title>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<link href="images/css.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<%
			if (session.getAttribute("menuList") == null) {
				List<List<String>> menuList = new ArrayList<List<String>>();
				List<String> sList1 = new ArrayList<String>();
				sList1.add("Ӳ��");
				sList1.add("��ʾ��");
				sList1.add("����");
				sList1.add("�Կ�");
				sList1.add("cpu");
				sList1.add("�ڴ�");
				sList1.add("Ӳ��");
				menuList.add(sList1);

				List<String> sList2 = new ArrayList<String>();
				sList2.add("����");
				sList2.add("����");
				sList2.add("���");
				sList2.add("����");
				sList2.add("����");
				sList2.add("����ͷ");
				menuList.add(sList2);

				List<String> sList3 = new ArrayList<String>();
				sList3.add("�����Ʒ");
				sList3.add("�ֻ�");
				sList3.add("�������");
				sList3.add("MP3");
				sList3.add("MP4");
				sList3.add("DV�����");
				sList3.add("���濨");
				sList3.add("u��");
				menuList.add(sList3);

				List<String> sList4 = new ArrayList<String>();
				sList4.add("���ּҵ�");
				sList4.add("Һ������");
				sList4.add("��Ϸ��");
				sList4.add("ͶӰ��");
				sList4.add("����");
				sList4.add("�յ�");
				menuList.add(sList4);

				List<String> sList5 = new ArrayList<String>();
				sList5.add("�칫�豸");
				sList5.add("��ī/�����ӡ��");
				sList5.add("��Ϸ��");
				sList5.add("ͶӰ��");
				sList5.add("һ���");
				sList5.add("ɨ����");
				sList5.add("��ӡ��");
				sList5.add("�����");
				menuList.add(sList5);

				List<String> sList6 = new ArrayList<String>();
				sList6.add("�����豸");
				sList6.add("������");
				sList6.add("·����");
				sList6.add("����ǽ");
				sList6.add("����");
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

<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>ʹ��c:forEach����List�����еļ���</title>
	</head>
	<body>
		<%
			List<String> list = new ArrayList<String>(); //����List���϶���
			list.add("������ͯ��"); //���List�е�Ԫ��
			list.add("��ʦ��ҩȥ");
			list.add("ֻ�ڴ�ɽ��");
			list.add("���֪��");
			request.setAttribute("list", list); //��List���ϱ��浽request������
		%>

		<table align="center" cellpadding="0" cellspacing="0" border="2"
			bgcolor="lightblue">
			<Tr>
				<Td>
					<b>����List���ϵ�ȫ��Ԫ�أ�</b>
					<br>
					<c:forEach items="${requestScope.list}" var="keyvalue"
						varStatus="id">
	                     ${id.index }&nbsp;${keyvalue}<br>
					</c:forEach>
				</Td>
			</Tr>
			<Tr>
				<td>
					<b>����List�����е�Ԫ�������һ�������һ�䣺</b>
					<br>
					<c:forEach items="${requestScope.list}" var="keyvalue"
						varStatus="id" begin="0" step="3">
	                     ${id.index }&nbsp;${keyvalue}<br>
					</c:forEach>
				</td>
			</Tr>
		</table>

	</body>
</html>

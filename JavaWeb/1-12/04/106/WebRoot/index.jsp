<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="java.net.URLDecoder" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ͨ��cookie���沢��ȡ�û���¼��Ϣ</title>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();			//��request�л��Cookie����ļ���
	String user = "";								//��¼�û�
	String date = "";								//ע���ʱ��
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {		//����cookie����ļ���
			if (cookies[i].getName().equals("mrCookie")) {		//���cookie���������ΪmrCookie
				user = URLDecoder.decode(cookies[i].getValue().split("#")[0]);	//��ȡ�û���
				date = cookies[i].getValue().split("#")[1];					//��ȡע��ʱ��
			}
		}
	}
	if ("".equals(user) && "".equals(date)) {								//���û��ע��
%>
		�ο����ã���ӭ�����ι��٣�
		<form action="deal.jsp" method="post">
			������������<input name="user" type="text" value="">
			<input type="submit" value="ȷ��">
		</form>
<%
	} else {														//�Ѿ�ע��
%>
		��ӭ[<b><%=user %></b>]�ٴι���<br>
		��ע���ʱ���ǣ�<%=date %>
<%
	}
%>
</body>
</html>

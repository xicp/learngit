<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>ͨ��request����������ݴ���</title>
</head>
<body>
<%
try{													//�����쳣��Ϣ
	int money=100;
	int number=0;
	request.setAttribute("result",money/number);				//����ִ�н��
}catch(Exception e){
	request.setAttribute("result","�ܱ�Ǹ��ҳ���������");		//���������ʾ��Ϣ
}
%>
<jsp:forward page="deal.jsp"/>
</body>
</html>

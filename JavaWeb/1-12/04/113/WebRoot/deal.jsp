<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%@ page import="java.util.*" %>
<%
String[][] userList={{"mr","mrsoft"},{"wgh","111"},{"sk","111"}};	//����һ�������û��б�Ķ�ά��
boolean flag=false;	//��¼״̬
request.setCharacterEncoding("GB18030");	//���ñ���
String username=request.getParameter("username");	//��ȡ�û���
String pwd=request.getParameter("pwd");	//��ȡ����
for(int i=0;i<userList.length;i++){	//������ά����
	if(userList[i][0].equals(username)){	//�ж��û���
		if(userList[i][1].equals(pwd)){	//�ж�����
			flag=true;	//��ʾ��¼�ɹ�
			break;//����forѭ��
		}
	}
}
if(flag){	//���ֵΪtrue����ʾ��¼�ɹ�
	session.setAttribute("username",username);//�����û�����session��Χ�ı�����
	response.sendRedirect("main.jsp");	//��ת����ҳ
}else{
	response.sendRedirect("index.jsp");	//��ת���û���¼ҳ��
}
%>
<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GBK"%>

<%@ page import="com.jspsmart.upload.*"  %>
<%
  	String from = request.getHeader("referer"); //��ȡ��ǰ�������һ�η��ʵĵ�ַ
    //�жϵ�ǰ�������һ�η��ʵĵ�ַ��ָ���ĵ�ַ�Ƿ���ͬ 
    if ((from == null) || (from.indexOf("localhost:8080/291/") < 0)) {
       out.print("<script>alert('�Բ���������¼��ȷ����վ�������أ�');window.location.href='http://localhost:8080/291';</script>");
    }else{ 
		response.setCharacterEncoding("utf-8");
		String path=request.getParameter("path");
		path=new String(path.getBytes("iso-8859-1"));
		String fileName = path.substring(path.lastIndexOf("/"));		
		SmartUpload su = new SmartUpload(); // �½�һ��smartupload���� 	
		su.initialize(pageContext); 		// ��ʼ��׼������  
	
		// �趨contentdispositionΪnull�Խ�ֹ������Զ����ļ��� 
		//��֤������Ӻ��������ļ��������趨�������ص��ļ���չ��Ϊ 
		//docʱ����������Զ���word��������չ��Ϊpdfʱ�� 
		//���������acrobat�򿪡� 
		su.setContentDisposition(null);
		 
		su.downloadFile(fileName); // �����ļ�
	}
%>


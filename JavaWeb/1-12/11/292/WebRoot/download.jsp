<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GBK"%>
<%@ page import="com.jspsmart.upload.*"  %>
<%
  	String from = request.getHeader("referer"); //��ȡ��ǰ�������һ�η��ʵĵ�ַ
    //�жϵ�ǰ�������һ�η��ʵĵ�ַ��ָ���ĵ�ַ�Ƿ���ͬ 
    if ((from == null) || (from.indexOf("localhost:8080/292/") < 0)) {
       out.print("<script>alert('�Բ���������¼��ȷ����վ�������أ�');window.location.href='http://localhost:8080/292';</script>");
    }else{
		response.setCharacterEncoding("utf-8");
		String path=request.getParameter("path");
		path=new String(path.getBytes("iso-8859-1"));
		String fileName = path.substring(path.lastIndexOf("/"));		
		SmartUpload su = new SmartUpload(); // �½�һ��smartupload���� 	
		su.initialize(pageContext); 		// ��ʼ��׼������  	 
		su.setContentDisposition(null);		// �趨contentdispositionΪnull�Խ�ֹ������Զ����ļ���  
		su.downloadFile(fileName); 			// �����ļ�
	}
%>


<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
 	    Connection con=db.getCon();
        if(con!=null){
          session.setAttribute("connectionstatus","��ȡ���ӳɹ���");
          db.closed();
        }
        else{
    	  session.setAttribute("connectionstatus","��ȡ����ʧ�ܣ�");
        }
        response.sendRedirect("index.jsp");
%>
<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
    if(session.getAttribute("con")!=null){
    	session.setAttribute("connectionstatus","�ѻ��һ�����ӣ�");
    }
    else{
    	Connection con=db.getCon();
        if(con!=null){
          session.setAttribute("connectionstatus","��ȡ���ӳɹ���");
          session.setAttribute("con",con);
        }
        else{
    	  session.setAttribute("connectionstatus","��ȡ����ʧ�ܣ�");
        }
    }
    session.setAttribute("formname","create");
    response.sendRedirect("index.jsp");
%>
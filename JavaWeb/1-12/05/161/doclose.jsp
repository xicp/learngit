<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
    Connection con=(Connection)session.getAttribute("con");
    if(con!=null){
      db.closed();
      session.setAttribute("closestatus","�����ѳɹ��رգ�");
      session.removeAttribute("con");
    }
    else{
 	  session.setAttribute("closestatus","��ǰ״̬û�����ӣ�");
    }
    session.setAttribute("formname","close");
    response.sendRedirect("index.jsp");
%>
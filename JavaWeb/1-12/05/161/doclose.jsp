<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
    Connection con=(Connection)session.getAttribute("con");
    if(con!=null){
      db.closed();
      session.setAttribute("closestatus","连接已成功关闭！");
      session.removeAttribute("con");
    }
    else{
 	  session.setAttribute("closestatus","当前状态没有连接！");
    }
    session.setAttribute("formname","close");
    response.sendRedirect("index.jsp");
%>
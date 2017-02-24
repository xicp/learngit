<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
  ResultSet rs=db.getAllRs();
  session.setAttribute("resultset",rs);
  response.sendRedirect("index.jsp");
%>

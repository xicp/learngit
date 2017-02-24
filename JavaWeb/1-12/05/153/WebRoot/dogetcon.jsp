<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
 	    Connection con=db.getCon();
        if(con!=null){
          session.setAttribute("connectionstatus","获取连接成功！");
          db.closed();
        }
        else{
    	  session.setAttribute("connectionstatus","获取连接失败！");
        }
        response.sendRedirect("index.jsp");
%>
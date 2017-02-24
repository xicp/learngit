<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*"%>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
    if(session.getAttribute("con")!=null){
    	session.setAttribute("connectionstatus","已获得一个连接！");
    }
    else{
    	Connection con=db.getCon();
        if(con!=null){
          session.setAttribute("connectionstatus","获取连接成功！");
          session.setAttribute("con",con);
        }
        else{
    	  session.setAttribute("connectionstatus","获取连接失败！");
        }
    }
    session.setAttribute("formname","create");
    response.sendRedirect("index.jsp");
%>
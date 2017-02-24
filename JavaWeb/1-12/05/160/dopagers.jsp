<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
  String strpage=request.getParameter("currentpage");
  out.println("strpage");
  if(strpage==null||strpage.equals(""))
	  strpage="1";
  int currentpage=1;
  try{
	   currentpage=Integer.parseInt(strpage);
      }catch(Exception e){currentpage=1;}

  db.setPageInfo(currentpage);
  ResultSet rs=db.getPageRs();
  session.setAttribute("db",db);
  session.setAttribute("pageresultset",rs);
  response.sendRedirect("index.jsp");
%>

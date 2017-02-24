<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.bean.Page" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% %>
<%
	String currentPage = request.getParameter("currPage");
	String action = request.getParameter("action");
	int currPage = 1;
	if(currentPage !=null){
		currPage = Integer.parseInt(currentPage);
	}
	Page p = new Page();
	if(action!=null){
		if(action.equals("before")){
			p.beforePage();
		}
		if(action.equals("next")){
			p.nextPage();
		}
	}
	out.println(p.getCurrentPage());
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   <jsp:useBean id="linkPage" class="com.lh.bean.Page" scope="page"></jsp:useBean>
  <%
  	linkPage.setHasBefore(true);
  	linkPage.setHasNext(true);
  	linkPage.setPageSize(10);
  	linkPage.setPageURL("index.jsp");
  
   %>
   <jsp:getProperty property="linkHTML" name="linkPage"/><br>
   <jsp:getProperty property="currentPage" name="linkPage"/>
  </body>
</html>

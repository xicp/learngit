<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
session.invalidate();//销毁session
response.sendRedirect("index.jsp");//重定向页面到index.jsp
%>


<%@ page language="java" contentType="text/html; charset=GB18030" pageEncoding="GB18030"%>
<%
session.invalidate();//����session
response.sendRedirect("index.jsp");//�ض���ҳ�浽index.jsp
%>


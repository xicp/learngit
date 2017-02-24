<%@ page language="java" import="java.util.*,java.io.*" pageEncoding="GBK"%>

<%@ page import="com.jspsmart.upload.*"  %>
<%
  	String from = request.getHeader("referer"); //获取当前请求的上一次访问的地址
    //判断当前请求的上一次访问的地址与指定的地址是否相同 
    if ((from == null) || (from.indexOf("localhost:8080/291/") < 0)) {
       out.print("<script>alert('对不起，请您登录正确的网站进行下载！');window.location.href='http://localhost:8080/291';</script>");
    }else{ 
		response.setCharacterEncoding("utf-8");
		String path=request.getParameter("path");
		path=new String(path.getBytes("iso-8859-1"));
		String fileName = path.substring(path.lastIndexOf("/"));		
		SmartUpload su = new SmartUpload(); // 新建一个smartupload对象 	
		su.initialize(pageContext); 		// 初始化准备操作  
	
		// 设定contentdisposition为null以禁止浏览器自动打开文件， 
		//保证点击链接后是下载文件。若不设定，则下载的文件扩展名为 
		//doc时，浏览器将自动用word打开它。扩展名为pdf时， 
		//浏览器将用acrobat打开。 
		su.setContentDisposition(null);
		 
		su.downloadFile(fileName); // 下载文件
	}
%>


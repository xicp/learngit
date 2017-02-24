<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jspsmart.upload.*" %>
<%@page import="java.net.URLDecoder"%>
<jsp:useBean id="mySmartUpload" scope="page" class="com.jspsmart.upload.SmartUpload" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'upfile.jsp' starting page</title>

  </head>
  
  <body> 
    <% 
    mySmartUpload.initialize(pageContext);         //执行初始化操作 
    //URLDecoder.decode()
   
   // mySmartUpload.setTotalMaxFileSize(100000);     //设置 文件最大字节数 
    
	mySmartUpload.upload();                        //上传文件 到服务器 
	int size = 1024*1024*10;
	if(mySmartUpload.getFiles().getSize()>size){
    	out.println("the file mast be < 10mb !");
    }else{
	    try{
	        mySmartUpload.save("/upload");             //如果存在目录 就保存文件 ，否则 抛出异常 
	        out.print("成功上传文件！ ");
	    }
	    catch(Exception e){
	       out.print(e.toString());
	    }
    }
    %>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.lh.util.FileUploadUtil" %>
<%@ page import="java.io.*" %>
<%@page import="java.net.URLDecoder"%>

<%
	FileUploadUtil uploadUtil = new FileUploadUtil();		
	uploadUtil.setRequest(request);							 
	long fileSize = 1024*1024*2;							//设置文件大小为2MB
	uploadUtil.setFileSize(fileSize);
	String filePath = uploadUtil.getParameter("pathStr");	//文件路径字符串
	filePath=URLDecoder.decode(filePath,"UTF-8");			//对编码过的字符串进行解码
	File file = new File(filePath);							//根据文件路径创建File对象 
	String fileName = file.getName();						//获取文件名	
	String uploaFile = uploadUtil.getParameter("file");		//文件
	String uploadPath = application.getRealPath("/");		//服务器路径作为上传路径
	boolean res = uploadUtil.uploadToServer(uploaFile,fileName,uploadPath);
	if(res){
		out.println("<script>alert('文件上传成功！');");
		out.println("window.location.href='index.jsp';");
		out.println("</script>");
	}
%>
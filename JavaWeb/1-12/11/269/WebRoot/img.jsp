
<%@ page contentType="image/jpeg" pageEncoding="utf-8"%>   
<%@ page import = "java.io.*" %>
<%@ page import="com.lh.dao.PictureDao" %>
<%@ page import="com.lh.model.PictureInfo" %>
<%
	//设置页面不缓存
	response.setHeader("Pragma","No-cache");      
	response.setHeader("Cache-Control","no-cache");   
	response.setDateHeader("Expires", 0);   
	PictureInfo pic = PictureDao.getInstance().getImage() ;//调用方法获取图片信息
	OutputStream output=response.getOutputStream();   //获取输出二进制数据的对象
	output.write(pic.getPicByte());//输出图片字节数据
	output.flush();
	output.close();
%>
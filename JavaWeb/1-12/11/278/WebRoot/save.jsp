<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.lh.dao.FileUploadDao" %>
<%@ page import="com.lh.model.UploadBean" %>
<%
	request.setCharacterEncoding("UTF-8");
	UploadBean uploadBean = new UploadBean();//创建UploadBean对象，用于解析表单数据 
	uploadBean.setRequest(request);				//将请求对象传入到 UploadBean对象中 
	String myFile = uploadBean.getParameter("file");
	if(myFile!=null){
		boolean res = FileUploadDao.getInstance().saveFile(myFile);//调用方法保存到数据库 
		if(res){
			out.println("<script>alert('文件上传成功！');");
			out.println("window.location.href='index.jsp';");
			out.println("</script>");
		}
	}
%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.lh.dao.FileUploadDao" %>
<%@ page import="com.lh.model.UserInfo" %>
<%@ page import="com.lh.util.FileUploadUtil" %>
<%
	FileUploadUtil uploadUtil = new FileUploadUtil();	//创建UploadBean对象，用于解析表单数据 
	uploadUtil.setRequest(request);						//将请求对象传入到 UploadBean对象中 
	String name = new String(uploadUtil.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
	String sex = uploadUtil.getParameter("sex");
	String age = uploadUtil.getParameter("age");
	String myFile = uploadUtil.getParameter("file");
	UserInfo user = new UserInfo();			//封装用户信息的JavaBean对象
	user.setUserName(name);					//姓名
	user.setUserSex(sex);					//性别
	user.setUserAge(Integer.parseInt(age));	//年龄
	user.setUserPic(myFile);				//照片
	boolean res = FileUploadDao.getInstance().saveFile(user);//调用方法保存到数据库 
	if(res){
		out.println("<script>alert('文件上传成功！');");
		out.println("window.location.href='index.jsp';");
		out.println("</script>");
	}
%>
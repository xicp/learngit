<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.model.PictureInfo" %>
<%@ page import="com.lh.dao.PictureDao" %>
<%@ page import="java.io.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String filePath = request.getParameter("pathStr");	//获取文件路径字符串
	PictureInfo picture = new PictureInfo();//封装图片信息的JavaBean对象
	boolean res = false;
	if(filePath!=null&&!filePath.equals("")){
		File file = new File(filePath);//根据文件路径创建File对象
		String type = file.getName().substring(file.getName().lastIndexOf("."));
		picture.setPictureName(file.getName());//图片名称
		picture.setPictureType(type);//图片类别
		picture.setPicturePath(file.getAbsolutePath());//图片路径 
		res = PictureDao.getInstance().saveImage(picture);//保存图片
	}
	if(res){%>
		<script type="text/javascript">
			alert("图片保存 成功！");
			window.location.href="index.jsp";
		</script>
	<%}
%>

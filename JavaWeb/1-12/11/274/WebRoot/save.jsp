<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.ComminuteUtil" %>
<%@ page import="java.io.*" %>

<%
	request.setCharacterEncoding("UTF-8");//设置请求编码
	String sourcePath = request.getParameter("sourcePath");	//获取文件路径字符串
	String savePath = request.getParameter("savePath");			//获取文件的保存路径 
	String fileSize = request.getParameter("fileSize");//分割文件的大小
	if(sourcePath!=null&&savePath!=null&&fileSize!=null){
		File sourceFile = new File(sourcePath);//根据源文件路径创建File对象 
		File saveFile = new File(savePath);//根据保存后的路径创建File对象
		if(!saveFile.exists())
			saveFile.mkdirs();
		int size = Integer.parseInt(fileSize);//分割文件的大小
		boolean res = false;
		res = ComminuteUtil.splitFile(sourceFile,saveFile,size);//调用方法实现文件分割
		if(res){
%>
			<script type="text/javascript">
				alert("文件分割成功！");
				window.location.href="index.jsp";
			</script>
		<%}
	}
		
%>

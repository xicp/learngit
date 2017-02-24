<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.UniteUtil" %>
<%@ page import="java.io.*" %>

<%
	request.setCharacterEncoding("UTF-8");//设置请求编码
	String sourcePath = request.getParameter("filePath");	//获取文件路径字符串
	String savePath = request.getParameter("savePath");		//获取文件的保存路径 
	if(sourcePath!=null&&savePath!=null){
		File sourceFile = new File(sourcePath);	//根据源文件路径创建File对象 
		File saveFile = new File(savePath);		//根据保存后的路径创建File对象
		if(!saveFile.exists())
			saveFile.mkdir();
		boolean res = false;
		res = UniteUtil.heBing(sourceFile.listFiles(),saveFile,".zip");
		if(res){%>
			<script type="text/javascript">
				alert("文件合并成功！");
				window.location.href="index.jsp";
			</script>
		<%}
	}
		
%>

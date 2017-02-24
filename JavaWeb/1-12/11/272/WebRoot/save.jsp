<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.EncryptFile" %>
<%@ page import="java.io.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String sourcePath = request.getParameter("sourcePath");	//获取文件路径字符串
	String targetPath = request.getParameter("targetPath");	//获取文件路径字符串
	String flag = request.getParameter("flag");			 
	if(sourcePath!=null&&targetPath!=null){
		if(flag!=null&&flag.equals("1")){
			boolean res = false;
			res = EncryptFile.encry(sourcePath,targetPath);
			if(res){%>
				<script type="text/javascript">
					alert("文件加密成功！");
					window.location.href="index.jsp";
				</script>
			<%}
		}
		if(flag!=null&&flag.equals("2")){
			boolean res = false;
			res = EncryptFile.unEncry(sourcePath,targetPath);
			if(res){%>
				<script type="text/javascript">
					alert("文件解密成功！");
					window.location.href="index.jsp";
				</script>
			<%}
		}
	}
%>

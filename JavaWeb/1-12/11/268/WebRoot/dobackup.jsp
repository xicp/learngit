<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lh.dao.*" %>

<%
	String databaseName = request.getParameter("dbName");				//数据库名
	String path = request.getParameter("path");							//备份路径
	boolean bool = BackupDao.getInstance().backupDB(databaseName,path);	//调用备份方法执行备份
	if(bool){
%>
		<script type="text/javascript">
			alert("数据库<%=databaseName%>备份成功！");
			window.location.href ="backup.jsp";
		</script>
	<%}else{%>
		<script type="text/javascript">
			alert("数据库备份失败！");
			window.location.href ="backup.jsp";
		</script>
	<%}	
%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>永久计数器</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			font-size: 14px;
			font-family: 华文细黑;
			color: orangered;
			border: 1px solid green;
		}
	</style>
  </head>
  
  <body>
 
   <%!long count; %>
   <% 
   File file=new File(getServletContext().getRealPath("count.txt"));//创建文件对象 
   FileReader reader=new FileReader(file);
   char[] cbuf=new char[(int)file.length()];                        //创建字符数组 
   reader.read(cbuf);                                               //读取指定文件 
   reader.close();                                                  //关闭流 
   count=Long.valueOf(new String(cbuf)).longValue()+1;              //将文件 数据加1
   FileWriter write=new FileWriter(file);
   write.write(new String(count+""));								//向文件中写数据 
   write.close();													//关闭流 
   %>
   <table align="center" width="300" height="100">
   <tr align="center"><td >欢迎进入本网站 ,您是本站第<%=count %>位访客！</td></tr>
   </table>
  </body>
</html>

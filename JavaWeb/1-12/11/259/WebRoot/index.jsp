<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<%@ page import="com.lh.util.CustomFilter" %>
<%@ page import="java.io.*" %>
<%
	String filePath = request.getParameter("fileStr");	//获取文件夹路径字符串
	String extendStr = request.getParameter("extendStr");//获取文件扩展名字符串
	File files[]=null;//声明File对象数组
	if(filePath!=null&&extendStr!=null){
		CustomFilter fileFilter = new CustomFilter();	//创建CustomFilter对象
		fileFilter.setExtentName(extendStr);			//为CustomFilter对象属性赋值
		File dir = new File(filePath);					//创建文件路径的File对象 
		if(dir.isDirectory()){							//判断是否为文件夹  
			files = dir.listFiles(fileFilter);			//获取经过过滤后的文件
		}
	}
 %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
		.table1{
			
			font-size: 13px;
			border: 1px solid green;
			
		}
		table{
		
			font-size: 13px;
		}
		.fieldStyle{
			width: 300px;
			height: 160px;
			border: 1px solid green;
		}
	</style>
</head>		<title>获取文件信息</title>
<body>
<form name="form1" method="post" action="index.jsp">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【显示指定类型的文件】</td>
  </tr>
  <tr>
    <td align="right"> 输入文件夹路径：</td>
    <td>
    	<input name="fileStr" type="text" value="${param.fileStr }">
   		<font size="2" color="red">（格式为：D:\data）</font> 
   	</td>
  </tr>
   <tr>
    <td width="120" align="right">输入文件的扩展名：</td>
    <td> <input name="extendStr" type="text" value="${param.extendStr }"></td>
  </tr>
  <tr>
    <td height="35" align="center" colspan="2">
    	<input name="submit" type="submit" value="提 交">
    </td>
    </tr>
 
  <tr>
  	<td colspan="2" align="center">
  		<table  border="1">
  			 <tr>
			  <td>文件名称</td>
			  <td>文件大小</td>
			  <td>修改日期</td>
			  </tr>
			  <%
			  	if(files!=null){
			  		for(File file:files){
			   %>
			   <tr>
			  <td><%=file.getName() %></td>
			  <td><%=file.length() %></td>
			  <td><%=new Date(file.lastModified()).toLocaleString() %></td>
			  </tr>
			  <%	} 
			  	}%>
  		</table>
  	</td>
  </tr>
</table>
</form>
</body>
</html>

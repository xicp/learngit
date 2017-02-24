<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过commons-fileupload获取其他表单元素</title>
    
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
			font-size: 13px;
			
		}
		input{
			font-size: 12px;
			
		}
	</style>
  </head>
  
   <body>
   <%! 
   Date now=new Date();
   String form=String.format("%tF",now);
   %>
    <form method="post" action="UploadServlet" enctype="multipart/form-data">
    <table background="bg.jpg" width="400" height="200">
    <tr>
    	<td height="20" colspan="2"></td>	
    </tr>
    <tr>
    	<td align="center" colspan="2">【应用commons-fileUpload获取其他表单元素】</td>	
    </tr>
      <tr>
    	<td height="20" colspan="2"></td>	
    </tr>
    <tr>
    	<td align="right">选择文件：</td>	
    	<td > <input type="file" name="file1"></td>
    </tr>
    <tr>
    	<td align="right">文件描述：</td>
    	<td >  <input type="text" name="upDe" ></td>
    </tr>
     <tr>
    	<td align="right">上传时间：</td>
    	<td >  <input type="text" name="uptime"  value=<%=form%>></td>
    </tr>
    <tr>
    	<td align="center"></td>
    	<td > <input type="submit" value="开始上传"></td>
    	
    </tr>
	  <tr>
    	<td height="40" colspan="2"></td>	
    </tr>
    </table>
    </form>
  </body>
</html>

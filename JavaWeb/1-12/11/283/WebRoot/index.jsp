<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	<title>应用jspSmartUpload处理中文名文件上传</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page"> 
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
  	<form method="post" action="UploadServlet" enctype="multipart/form-data">
    <table background="bg.jpg" width="400" height="200">
    <tr>
    	<td height="20"></td>	
    </tr>
    <tr>
    	<td align="center">【应用jspSmartUpload处理中文名文件上传】</td>	
    </tr>
      <tr>
    	<td height="20"></td>	
    </tr>
    <tr>
    	<td align="center">选择上传文件：(文件大小不要超过2MB)</td>	
    </tr>
     <tr>
    	<td align="center"> <input type="file" name="file1" size="50"></td>
    </tr>
    <tr>
    	<td align="center"> <input type="submit" value="开始上传"></td>
    	
    </tr>
	  <tr>
    	<td height="40"></td>	
    </tr>
    </table>
    </form>
  </body>
</html>

<%@ page language="java" import="java.io.*" pageEncoding="GBK"%>
<html>
  <head>
    <title>获得驱动器信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  <style type="text/css">
		.table1{
			
			font-size: 13px;
			border: 1px solid green;
			
		}
		.fieldStyle{
			width: 300px;
			height: 160px;
			border: 1px solid green;
		}
	</style>
  </head>
  
  <body>
  <table width="284" height="233" class="table1">
  <tr><td align="center" valign="top">
    <table width="90%"  border="0" cellspacing="0" cellpadding="0" >
      <tr>
        <td height="18" align="center" scope="col"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <table  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" colspan="2">&nbsp;</td>
      </tr>
      <tr>
        <th scope="col">服务器驱动器信息如下：</th>
      </tr>
      <tr><td>&nbsp;</td></tr>
      <%
      	File file[] = File.listRoots();
      	for(int i=0;i<file.length;i++){
       %>
       	<tr>
	        <td align="center"><%=file[i] %></td>
	      </tr>
       <%} %> 
    </table>
  </td>
  </tr></table>
  </body>
</html>

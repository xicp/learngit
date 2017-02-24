<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="com.lh.util.ReadXMLData" %>
<%
	String path = application.getRealPath("conn.xml");
	File file = new File(path);
	ReadXMLData readData = new ReadXMLData(file);
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

</head>		
<title>从XML文档中读取数据</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="sourcePath" id="sourcePath">
<input type="hidden" name="targetPath" id="targetPath">
<input type="hidden" name="flag" id="flag">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【从XML文档中读取数据】</td>
  </tr>
   <tr height="40">
    <td align="right"> 数据库驱动类：</td>
    <td>
    	<input name="databaseClass" id="databaseClass" type="text" size="40" 
    		value="<%=readData.readXml("driverClassName")%>" />
   	</td>
 </tr>
 <tr height="40">
    <td align="right"> URL：</td>
    <td>
    	<input name="url" id="url" type="text" size="40"
    		value="<%=readData.readXml("connection_url")%>" />
   	</td>
 </tr>
  <tr height="40">
    <td align="right"> 用户名：</td>
    <td>
    	<input name="userName" id="userName" type="text" size="40"
    		value="<%=readData.readXml("user")%>" />
   	</td>
 </tr>
  <tr height="40">
    <td align="right"> 密码：</td>
    <td>
    	<input name="pwd" id="pwd" type="text" size="40"
    		value="<%=readData.readXml("password")%>" />
   	</td>
 </tr>
</table>
</form>
</body>
</html>

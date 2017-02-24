<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<jsp:directive.page import="java.io.FileInputStream"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>读取Property文件</title>
  </head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<%
FileInputStream fis=new FileInputStream(application.getRealPath("connDB.properties"));
Properties properties=new Properties();
properties.load(fis);
%>
  <body>
  <form name="form1" method="post" action="">
<p>&nbsp;</p>
    <table width="500" height="214"  border="0" background="bg.gif" align="center">
      <tr>
        <td height="32" align="center">属性文件键名</td>
        <td align="center">属性值</td>
        <td align="center">属性说明</td>
      </tr>
      <tr>
        <td align="center">DB_CLASS_NAME</td>
        <td align="center"><%=properties.getProperty("DB_CLASS_NAME") %></td>
        <td align="center">数据库驱动类</td>
      </tr>
      <tr>
        <td align="center">DB_URL</td>
        <td align="center"><%=properties.getProperty("DB_URL") %></td>
        <td align="center">连接URL</td>
      </tr>
      <tr>
        <td align="center">DB_USER</td>
        <td align="center"><%=properties.getProperty("DB_USER") %></td>
        <td align="center">数据库用户名</td>
      </tr>
      <tr>
        <td align="center">DB_PWD</td>
        <td align="center"><%=properties.getProperty("DB_PWD") %></td>
        <td align="center">数据库密码</td>
      </tr>
     
      <tr>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
        <td align="center">&nbsp;</td>
      </tr>
    </table>
  </form>
  </body>
</html>

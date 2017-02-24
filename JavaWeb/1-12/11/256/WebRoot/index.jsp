<%@ page language="java" import="java.util.*" pageEncoding="GBK" contentType="text/html;charset=gbk"%>
<jsp:directive.page import="java.net.InetAddress"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="gb2312"/>

<jsp:useBean id="fileBean" class="bean.ShowFileInfoBean" scope="page"/>
<jsp:setProperty name="fileBean" property="filePath" value="${param.fileStr }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
		.table1{
			
			font-size: 13px;
			border: 1px solid green;
			
		}
		table{
			background-color:skyblue;
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
<table width="503" height="399" border="0" cellpadding="0" cellspacing="0" class="table1">
  <tr>
    <td height="54" align="center">【获取文件信息】</td>
  </tr>
  <tr>
    <td height="35" align="center">
        输入文件位置
		  <input name="fileStr" type="text" value="${param.fileStr }">
    	<input name="submit" type="submit" value="提交">
    </td>
    </tr>
  <tr>
    <td height="35" align="center">
    
    <table width="400" height="196" border="1" cellpadding="0" cellspacing="0"
     bordercolorlight="#AAAAAA" bordercolordark="#FFFFFF" >
      <tr>
        <td width="120" align="right">文件名称：</td>
        <td align="left">${fileBean.fileInfo['name'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">文件路径：</td>
        <td align="left">${fileBean.fileInfo['absPath'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">上级目录</td>
        <td align="left">${fileBean.fileInfo['parentDir'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">只读属性：</td>
        <td align="left">${fileBean.fileInfo['readOnly']}&nbsp;</td>
      </tr>
      <tr>
        <td align="right">隐藏：</td>
        <td align="left">${fileBean.fileInfo['hidden']}&nbsp;</td>
      </tr>
      <tr>
        <td align="right">最后修改日期：</td>
        <td align="left">${fileBean.fileInfo['lastModified'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">文件长度：</td>
        <td align="left">${fileBean.fileInfo['length'] }&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

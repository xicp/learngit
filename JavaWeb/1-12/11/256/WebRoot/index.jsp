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
</head>		<title>��ȡ�ļ���Ϣ</title>
<body>
<form name="form1" method="post" action="index.jsp">
<table width="503" height="399" border="0" cellpadding="0" cellspacing="0" class="table1">
  <tr>
    <td height="54" align="center">����ȡ�ļ���Ϣ��</td>
  </tr>
  <tr>
    <td height="35" align="center">
        �����ļ�λ��
		  <input name="fileStr" type="text" value="${param.fileStr }">
    	<input name="submit" type="submit" value="�ύ">
    </td>
    </tr>
  <tr>
    <td height="35" align="center">
    
    <table width="400" height="196" border="1" cellpadding="0" cellspacing="0"
     bordercolorlight="#AAAAAA" bordercolordark="#FFFFFF" >
      <tr>
        <td width="120" align="right">�ļ����ƣ�</td>
        <td align="left">${fileBean.fileInfo['name'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">�ļ�·����</td>
        <td align="left">${fileBean.fileInfo['absPath'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">�ϼ�Ŀ¼</td>
        <td align="left">${fileBean.fileInfo['parentDir'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">ֻ�����ԣ�</td>
        <td align="left">${fileBean.fileInfo['readOnly']}&nbsp;</td>
      </tr>
      <tr>
        <td align="right">���أ�</td>
        <td align="left">${fileBean.fileInfo['hidden']}&nbsp;</td>
      </tr>
      <tr>
        <td align="right">����޸����ڣ�</td>
        <td align="left">${fileBean.fileInfo['lastModified'] }&nbsp;</td>
      </tr>
      <tr>
        <td align="right">�ļ����ȣ�</td>
        <td align="left">${fileBean.fileInfo['length'] }&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>

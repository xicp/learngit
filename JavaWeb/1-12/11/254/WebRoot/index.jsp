<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="gb2312"/>

<jsp:useBean id="fileBean" class="bean.RenameBean" scope="page"/>
<jsp:setProperty name="fileBean" property="fileName" value="${param.fileName }"/>
<jsp:setProperty property="newFileName" name="fileBean" value="${param.newFileName }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
	<style type="text/css">
		table{
			font-family: ����;
			font-size: 13px;
		}
		.fieldStyle{
			width: 300px;
			height: 160px;
			border: 1px solid green;
		}
	</style>
</head>
		<title>�������ļ�</title>
<body>
<form name="form1" method="post" action="index.jsp">
<fieldset class="fieldStyle">
	<legend >�������ļ�</legend>

<table width="450" align="center">
  	<tr><td align="center">&nbsp;     </td>
  	  <td align="center">Դ�ļ�����</td>
  	  <td align="left"><input name="fileName" type="text" size="29"></td>
    </tr>
    <tr><td align="center">&nbsp; </td>
      <td align="center">���ļ�����</td>
      <td align="left"><input name="newFileName" type="text" size="29"></td>
    </tr>
    <tr><td height="60" align="center">&nbsp;
   	</td>
      <td align="center">&nbsp;</td>
      <td align="left" valign="top"><input name="submit" type="submit" value="�� ��">
      &nbsp;&nbsp;
      
      <%
      if(fileBean.renameFile())
    	  out.println("�������ɹ���");
      else
    	  out.println("������ʧ�ܣ�");
      %>
      </td>
    </tr>
</table>
</fieldset>
</form>
</body>
</html>

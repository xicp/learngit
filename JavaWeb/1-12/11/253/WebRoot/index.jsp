<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="gbk"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<style type="text/css">
	table{
		font-size: 12px;
		border: 1px solid green;
		
	}
</style>
</head>
<title>�鿴�ļ��Ƿ����</title>
 <script type="text/javascript">
            function check(){
              if(form1.filePath.value==""){
                  alert("������Ҫ��ѯ���ļ�");
                  return false;
                }
            }
        </script>

<body>
<c:set var="file">
</c:set>
<form name="form1" method="post" action="FileServlet" onsubmit="return check()">
<table width="500" >
  	<tr  bgcolor="skyblue">
  	  <td align="center" colspan="3"><strong>[�鿴�ļ��Ƿ����]</strong></td>
  	 
    </tr>
  	<tr><td align="center">&nbsp;</td>
  	  <td >�����ļ�·����
        <input type="text" name="filePath"  >
        <font color="red" size="2">���磺D:\test.txt</font>
       </td>
  	  <td align="left"> <input name="submit" type="submit" value="�� ��"></td>
  	</tr>
  	
    <tr><td  align="center">&nbsp;
   	</td><%if(request.getAttribute("Msg") != null) {%>
      <td align="center"><%out.print(request.getAttribute("Msg"));} %></td>
      <td align="left" valign="top">&nbsp;</td>
    </tr>
</table>
</form>
</body>
</html>

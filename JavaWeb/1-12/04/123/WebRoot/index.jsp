<%@page contentType="text/html" pageEncoding="GBK"%>
<%@taglib prefix="mytag" uri="http://www.tag.com/mytag"%>
<html>
<head>
<title>�Զ�������������ı�ǩ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK"><style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<body>
<table width="349" height="214" align="center" background="images/bj.jpg">
  <tr>
    <td><div style="position: relative;top: 0px;left: 20px">
        <form action="index.jsp" method="post" name="f1">
          ��ѡ��Ҫ���ɵ���������ȣ�
          <select name="len">
            <option selected="selected" value="0"> ��ѡ��λ�� </option>
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
          </select>
          <input type="submit" value="����">
        </form>
        <%
			if (request.getParameter("len")!=null&&!"0".equals(request.getParameter("len"))) {
		%>
        ���ɵ������Ϊ��
        <mytag:randomNum length='<%=request.getParameter("len")%>' />
        <%
			}
		%>
      </div></td>
  </tr>
</table>
</body>
</html>

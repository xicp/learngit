<%@page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage=""%>
<%@page import="java.net.URL"%>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gbk">
    <link href="css/style.css" type="text/css" rel="stylesheet">
    <title>��ֹ������վ�ⲿ�ύ</title>
  </head>
<%
  String strOne = request.getHeader("referer");		//��ȡҳ��������ַ
  String pathOne = "";								//������ַ���
  if (strOne != null) {								//�жϵ�ҳ��������ַΪ��ʱ
   URL urlOne   = new URL(strOne);					//ʵ����URL����
    pathOne = urlOne.getHost();						//��ȡ����ҳ��ķ���������
  }
  String strTwo=request.getRequestURL().toString();	//��ȡ��ǰ��ҳ�ĵ�ַ
  String pathTwo = "";
   if (strTwo != null) {
   URL urlTwo   = new URL(strTwo);
    pathTwo = urlTwo.getHost();						//��ȡ��ǰ��ҳ�ķ���������
  }
%>
  <body>
    <table width="366" height="250" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr align="center">
        <td width="366" background="images/00.jpg">��������
<%
if(!pathOne.equals(pathTwo)){						//�жϵ�ǰҳ���������������������Ƿ���ͬ
%>
��ֹ��վ�ⲿ�ύ��������
<%
}else{
String name=request.getParameter("name");
String pass=request.getParameter("pass");
out.println("�û�����"+name);
out.println("<br>");
out.println("���룺"+pass);

}

%>
          ����</td>
      </tr>
    </table>
  </body>
</html>

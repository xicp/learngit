<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="com.count.stoptime.*" %>
<%
  session.setMaxInactiveInterval(10);
  String userip=request.getRemoteAddr();
  UserLine userline=new UserLine();
  userline.setUserip(userip);
  session.setAttribute("logonuser",userline);
%>
<html>
  <head>
    <title>ͳ���û���վ��ͣ����ʱ��</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>  
  <body>
   <center>
     <table  border=1 bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing=0" style="margin-top:200">
       <tr bgcolor="lightgrey" height="25">
         <td align="center">
           ��ӭ��¼��
         </td>
       </tr>
       <tr>
         <td>
           ��ʵ������ͳ���û���վ���ͣ��ʱ�䡣<br>
           ��ʱ����һ��session����Ӵ����������ڼ��ʱ��<br>
           ��ʵ��Ӧ����Servlet�¼������жԻỰ�ļ���������<br>
           ��Ҫ��ͨ���̳�HttpSessionBindingListener�ӿڼ�����Http�Ự������
         </td>
       </tr>
     </table>
   </center>
  </body>
</html>

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%
  session.setMaxInactiveInterval(10);
  Vector vec=(Vector)application.getAttribute("online");
%>
<html>
  <head>
    <meta http-equiv="refresh" content="12">
    <title>�ж��û��Ƿ�����</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>  
  <body>
   <center>
      <table style="margin-top:200" width="220" height="100" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
       <tr bgcolor="lightgrey" height="25">
         <td align="center" colspan="2">�����û�</td>
       </tr>
       <tr>
         <td width="60%" align="center" valign="middle">10����û�з���<br>��������Ϊ����</td>
       </tr>
       <tr>
         <td align="center" valign="middle">
           <%
            if(vec==null||vec.size()==0)
            	out.println("û���û���");
            else{
            	if(vec.contains(session.getAttribute("username"))){
            		out.println("���Ѿ����ߣ��û�����"+session.getAttribute("username"));
            	}
            	else
            		out.println("��û�����ߣ�");
            }
          %>
  
         </td>             
       </tr>
       <tr bgcolor="lightgrey">
         <td align="center" height="25" colspan="2">
           <%
             if(session.getAttribute("username")==null)
            	 out.println("���Ѿ����ߣ�");
             else
            	 if(vec.contains(session.getAttribute("username")))
            		 out.println("<a href='myline.jsp'>[����]</a>");
            	 else
            		 out.println("���ȵ�¼��");
            		 
           %>
     </table>
     <%
     if(!vec.contains(session.getAttribute("username")))
    	   out.println("<a href='index.jsp'>[��¼]</a>");
     %>     
   </center>
  </body>
</html>

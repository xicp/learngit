<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="mylogon" class="com.line.UserLogOn"/>
<%
  String username=request.getParameter("username");
  if(username==null)
	  username="";
      username=new String(username.getBytes("ISO-8859-1"),"gbk");
  mylogon.setUsername(username);
  if(mylogon.checkuser(session)){
	  session.setAttribute("username",username);
	  response.sendRedirect("myline.jsp");
  }
%>
<html>
  <head>
    <title>�ж��û��Ƿ�����</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
   <center>
       <table style="margin-top:200" width="250" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
         <tr bgcolor="lightgrey" height="30">
            <td align="center">��¼״��</td>
         </tr>
         <tr height="50">
            <td align="center">
              <%=mylogon.getBackstr()%>
            </td>
         </tr>
       </table>
       <a href="index.jsp">[����]</a>
   </center>
  </body>
</html>

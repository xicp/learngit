<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>�������ݿ�ķ���</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
 <center>
  <form action="dogetcon.jsp"> 
  <table width="250"  height="100" border=1 cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
   <tr>
     <td align="center" heigth="40" bgcolor="lightgrey">����״̬��
        <%
          if(session.getAttribute("connectionstatus")==null){
        %>
               û�н������ӣ�
        <%
          }
          else{
        %>       
          <%=session.getAttribute("connectionstatus")%>     
        <%  
        	  session.invalidate();
          }
        %>
     </td>
   </tr>
   <tr>
     <td align="center" height="60" valign="middle">
        <input type="submit" value="�������">
     </td>
   </tr>
  </table>
  </form>
 </center>
</body>
</html>

<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>连接数据库的方法</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
 <center>
  <form action="dogetcon.jsp"> 
  <table width="250"  height="100" border=1 cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
   <tr>
     <td align="center" heigth="40" bgcolor="lightgrey">连接状态：
        <%
          if(session.getAttribute("connectionstatus")==null){
        %>
               没有进行连接！
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
        <input type="submit" value="获得连接">
     </td>
   </tr>
  </table>
  </form>
 </center>
</body>
</html>

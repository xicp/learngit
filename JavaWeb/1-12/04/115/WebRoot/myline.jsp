<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*"%>
<%
  session.setMaxInactiveInterval(10);
  Vector vec=(Vector)application.getAttribute("online");
%>
<html>
  <head>
    <meta http-equiv="refresh" content="12">
    <title>判断用户是否在线</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>  
  <body>
   <center>
      <table style="margin-top:200" width="220" height="100" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
       <tr bgcolor="lightgrey" height="25">
         <td align="center" colspan="2">在线用户</td>
       </tr>
       <tr>
         <td width="60%" align="center" valign="middle">10秒内没有发言<br>您将被视为下线</td>
       </tr>
       <tr>
         <td align="center" valign="middle">
           <%
            if(vec==null||vec.size()==0)
            	out.println("没有用户！");
            else{
            	if(vec.contains(session.getAttribute("username"))){
            		out.println("您已经上线！用户名："+session.getAttribute("username"));
            	}
            	else
            		out.println("您没有上线！");
            }
          %>
  
         </td>             
       </tr>
       <tr bgcolor="lightgrey">
         <td align="center" height="25" colspan="2">
           <%
             if(session.getAttribute("username")==null)
            	 out.println("您已经下线！");
             else
            	 if(vec.contains(session.getAttribute("username")))
            		 out.println("<a href='myline.jsp'>[发言]</a>");
            	 else
            		 out.println("请先登录！");
            		 
           %>
     </table>
     <%
     if(!vec.contains(session.getAttribute("username")))
    	   out.println("<a href='index.jsp'>[登录]</a>");
     %>     
   </center>
  </body>
</html>

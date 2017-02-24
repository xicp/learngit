<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="mycounttime" class="com.count.stoptime.StopTime" scope="page"/>
<%    
      session.setMaxInactiveInterval(11);
      Date now=new Date();
      if(session.isNew()){
 	      session.setAttribute("start",now);
      }
	  else{
    	  mycounttime.counttime((Date)session.getAttribute("start")); 
      }
%>
<html>
  <head>
    <title>统计用户在某一页停留的时间</title>
    <meta http-equiv="refresh" content="10">
 	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
   <center>
    <table width="250" height="100" border=1 bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing=0" style="margin-top:200">
     <tr bgcolor="lightgrey" height="25">
      <td align="center">统计用户在某一页停留的时间</td>
     </tr>
     <tr>
      <td align="center">
        您登录的时间为：<%=((Date)session.getAttribute("start")).toLocaleString()%>
      </td>
     </tr>
     <tr>
      <td align="center">
        您在本页的停留时间为：<%=mycounttime.getH()%>小时<%=mycounttime.getM()%>分<%=mycounttime.getS()%>秒
      </td>
     </tr>
    </table>
   </center>
  </body>
</html>

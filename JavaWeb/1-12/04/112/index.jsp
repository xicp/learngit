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
    <title>ͳ���û���ĳһҳͣ����ʱ��</title>
    <meta http-equiv="refresh" content="10">
 	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
   <center>
    <table width="250" height="100" border=1 bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing=0" style="margin-top:200">
     <tr bgcolor="lightgrey" height="25">
      <td align="center">ͳ���û���ĳһҳͣ����ʱ��</td>
     </tr>
     <tr>
      <td align="center">
        ����¼��ʱ��Ϊ��<%=((Date)session.getAttribute("start")).toLocaleString()%>
      </td>
     </tr>
     <tr>
      <td align="center">
        ���ڱ�ҳ��ͣ��ʱ��Ϊ��<%=mycounttime.getH()%>Сʱ<%=mycounttime.getM()%>��<%=mycounttime.getS()%>��
      </td>
     </tr>
    </table>
   </center>
  </body>
</html>

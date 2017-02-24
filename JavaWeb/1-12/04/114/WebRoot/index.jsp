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
    <title>统计用户在站点停留的时间</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>  
  <body>
   <center>
     <table  border=1 bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing=0" style="margin-top:200">
       <tr bgcolor="lightgrey" height="25">
         <td align="center">
           欢迎登录！
         </td>
       </tr>
       <tr>
         <td>
           本实例用于统计用户在站点的停留时间。<br>
           该时间是一个session对象从创建到结束期间的时间差。<br>
           本实例应用了Servlet事件监听中对会话的监听方法。<br>
           主要是通过继承HttpSessionBindingListener接口监听对Http会话操作！
         </td>
       </tr>
     </table>
   </center>
  </body>
</html>

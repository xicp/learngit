<%@ page contentType="text/html;charset=GBK"%>
<%
   int i=0;
   synchronized(application){
       if(application.getAttribute("times")==null){
	       i=1;
       }
       else{
	       i=Integer.parseInt((String)application.getAttribute("times"));
           i++;
       }
       application.setAttribute("times",Integer.toString(i));
   }
%>
<html>
  <head>
    <title>通过Application对象实现网站计数器</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
      <table height="70" width="200" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing="0" style="margin-top:200">
        <tr bgcolor="lightgrey">
         <td align="center">欢迎访问！</td>
        </tr>
        <tr>
         <td align="center">
          您是第<b><%=i%></b>位访问本网站的游客！
         </td>
        </tr>
      </table>
    </center>
  </body>
</html>


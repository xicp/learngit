<%@ page contentType="text/html;charset=GBK"%>
<html>
  <head>
    <title>实时统计在线人数</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
   <center>
     <form action="dologon.jsp">
       <table style="margin-top:200" width="250" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
         <tr bgcolor="lightgrey" height="30">
            <td align="center">用户登录</td>
         </tr>
         <tr height="30">
            <td align="center">
              用户名：<input type="text" name="username" size="30">
            </td>
         </tr>
         <tr bgcolor="lightgrey">
            <td align="center"> 
              <input type="submit" name="logon" value="登录">
              <input type="reset" name="clear" value="重置">
            </td>
         </tr>
       </table>
     </form>
   </center>
  </body>
</html>

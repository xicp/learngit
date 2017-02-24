<%@ page contentType="text/html;charset=gb2312"%>
<%
   String errors=(String)request.getAttribute("errors");
   if(errors==null||errors.equals(""))
	   errors="<li>请选择要上传的文件！</li>";
%>
<html>
  <head>
    <title>文件上传</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>  
  <body>
    <center>
       <table border="0" cellpadding="0" cellspacing="0">
         <tr><td colspan="2"><img src="image/top.gif"></td></tr>
         <tr>
             <td width="208"><img src="image/left.gif"></td>
             <td width="592" height="448" background="image/main.gif" align="center">
                 <form action="doup.jsp" method="POST" enctype="multipart/form-data">
                 <table border="1" height="200" width="450" bordercolor="gray" bordercolorlight="gray" bordercolordark="white" cellspacing="0" rules="none">
                     <tr bgcolor="#B3DC38" height="35"><td align="center" colspan="3"><%=errors%></td></tr>
                     <% for(int i=1;i<4;i++){ %>
                     <tr>
                         <td align="right" width="20%">文件<%=i%>：</td>
                         <td align="center"><input type="file" name="file<%=i%>" size="35"></td>
                     </tr>      
                     <% } %>
                     <tr bgcolor="#B3DC38" height="30">
                         <td align="center" colspan="2">
                             <input type="submit" value="上传">
                             <input type="reset" value="重置">
                         </td>
                     </tr>
                 </table>
                 </form>
             </td>
         </tr>
         <tr><td colspan="2"><img src="image/end.gif"></td></tr>
       </table>
    </center>
  </body>
</html>
<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>关闭数据库的方法</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script language="javascript">
  function change(){
    document.connectionform.action="doclose.jsp";
  }
</script>
<body>
 <center>
  <form action="dogetcon.jsp" name="connectionform"> 
  <table width="250"  height="100" border=1 cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
   <tr>
     <td align="center" heigth="40" bgcolor="lightgrey">连接状态：
        <%
          String formname=(String)session.getAttribute("formname");//通过判断formname的值来选择显示连接操作的信息还是关闭操作的信息
                                                                   //当表单被提交到dogetcon.jsp页面后，设置该值为"create"；当表单被提交到doclose.jsp页面后，设置该值为"close"
          if(formname==null)formname="create";
          if(formname.equals("create")){
            if(session.getAttribute("connectionstatus")==null){
        %>
               没有进行连接！
        <%
           }
           else{
        %>       
               <%=session.getAttribute("connectionstatus")%>
        <%  
            }
           }
           else if(formname.equals("close")){
        %>
              <%=session.getAttribute("closestatus")%>
        <%
           }
        %>
      </td>
    </tr>
   <tr>
     <td align="center" height="60" valign="middle">
        <input type="submit" name="create" value="获得连接">
        <input type="submit" name="close" value="关闭连接" onclick="change()">
     </td>
   </tr>
   <tr bgcolor="lightgrey">
     <td align="center">请确保您的浏览器支持JavaScript脚本！</td>
   </tr>
  </table>
  </form>
 </center>
</body>
</html>

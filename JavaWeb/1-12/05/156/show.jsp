<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<%@ page contentType="text/html;charset=GBK"%>
<html>
  <head>
    <title>�������ӵķ���</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
    <table cellspacing="0" width="300" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
    <tr bgcolor="lightgrey" height="25">
      <td align="center">�û���</td>
      <td align="center">�Ա�</td>
      <td align="center">����</td>
      <td align="center">ְ��</td>
      <td align="center">�ʽ�</td>
    </tr>
    <%
      ResultSet rsall=db.getRs("select * from tb_user");
      while(rsall.next()){
    %>
    <tr>
      <td align="center"><%=rsall.getString("user_name")%></td>
      <td align="center"><%=rsall.getString("user_sex")%></td>
      <td align="center"><%=rsall.getInt("user_age")%></td>
      <td align="center"><%=rsall.getString("user_job")%></td>
      <td align="center"><%=rsall.getFloat("user_money")%></td>
    </tr>
   <%  
      }
    %>
    </table>
    <a href="index.jsp">[����]</a>
  </center>
  </body>
</html>
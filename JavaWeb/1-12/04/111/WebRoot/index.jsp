<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="mycount" class="com.count.Online.CountOnline"/>
<%
  String ip=request.getRemoteAddr();
  mycount.setUserip(ip);
  ResultSet rs=mycount.checkuser();
  rs.last();
  int num=rs.getRow();
%>
<html>
  <head>
    <title>ֻ�����û������ļ�����</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
      <table height="90" width="200" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing="0" style="margin-top:200">
        <tr bgcolor="lightgrey">
         <td align="center">������IP��ַ</td>
         <td align="center">���ʴ���</td>
        </tr>
        <%
           rs.beforeFirst();
           while(rs.next()){
        %>
        <tr>
          <td align="center"><%=rs.getString("user_ip")%></td>
          <td align="center"><%=rs.getInt("user_times")%></td>
        </tr>
        <%
           }
        %>
        <tr>
         <td align="center" colspan="2">
           ����IPΪ��<%=ip%>
           <br>
           ���ķ��ʴ���Ϊ��<%=mycount.getTimes()%>��
           <br>
           ���� <%=num%> �����û����ʹ���ҳ
         </td>
        </tr>
      </table>
      <%
        mycount.dbclose();
      %>
    </center>
  </body>
</html>

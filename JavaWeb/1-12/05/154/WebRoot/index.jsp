<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <title>���ݲ�ѯ�ķ���</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
     <form name="searchform" method="post" action="dosearchall.jsp">
     <table style="margin-top:200" width="230" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
      <tr align="center" valign="middle" bgcolor="#CCCCCC" height="22">
        <td>�û���</td>
		<td>�Ա�</td>
		<td>����</td>
		<td>ְ��</td>
      <%
        ResultSet rs=(ResultSet)session.getAttribute("resultset");
        if(rs==null){
      %>
      <tr align="center" valign="middle"><td colspan="4">û�м�¼��ʾ��</td>
      </tr>
      <%
        }
        else{
        	 while(rs.next()){
      %>
      <tr align="center" valign="middle" height="22">
        <td><%=rs.getString("user_name") %></td>  		 
        <td><%=rs.getString("user_sex") %></td>
        <td><%=rs.getInt("user_age") %></td>
        <td><%=rs.getString("user_job") %></td>                        	
      </tr>
      <%
        	 }
        	 
        }
      %>
      <tr>
        <td align="center" colspan="4">
    	  <input type="submit" name="searchall" value="��ѯȫ������">
        </td>
      </tr>
     </table>
     </form>
    </center>
  </body>
</html>

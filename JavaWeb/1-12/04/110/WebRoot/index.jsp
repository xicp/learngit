<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.util.Date,java.text.*,java.sql.*" %>
<jsp:useBean id="mycount" class="com.count.Online.CountOnline"/>
<jsp:useBean id="mydb" class="com.count.Online.DB"/>
<%
  SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  String sql="select MAX(user_order) from tb_IPcount as max";
  ResultSet rs=mydb.search(sql);
  rs.next();
  int max=rs.getInt(1);
  mydb.closed();
  mycount.setTimes(max+1);
  String ip=request.getRemoteAddr();
  mycount.setUserip(ip);
  String nowdate=format.format(new Date());
  mycount.setNowdate(nowdate);
  rs=mycount.adduser();
%>
<html>
  <head>
    <title>��¼�û�IP��ַ�ļ�����</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
      <table height="90" width="400" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing="0" style="margin-top:200">
        <tr bgcolor="lightgrey">
         <td align="center">��Nλ������</td>
         <td align="center">������IP��ַ</td>
         <td align="center">����ʱ��</td>
        </tr>
        <%
           while(rs.next()){
        %>
        <tr>
          <td align="center"><%=rs.getInt("user_order")%></td>
          <td align="center"><%=rs.getString("user_ip")%></td>
          <td align="center"><%=rs.getString("user_time")%></td>
        </tr>
        <%
           }
           mycount.dbclose();
        %>
        <tr>
         <td align="center" colspan="3">
           ���ǵ�<%=max+1%>λ�����ߣ�
           <br>
           ����IPΪ��<%=ip%>
           <br>
           �����ʵ�ʱ��Ϊ��<%=nowdate%>
         </td>
        </tr>
      </table>
    </center>
  </body>
</html>

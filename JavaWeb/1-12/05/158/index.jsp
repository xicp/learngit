<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<html>
  <head>
    <title>ɾ�����ݵķ���</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <script language="javascript">
   function check(){
    if(deleteform.delusername.value==null||deleteform.delusername.value==""){
      alert("�������û�����");
      deleteform.delusername.focus();
      return false;
    }
    else{
      return(confirm("ȷ��Ҫɾ�����û���"));
    }
   }
  </script>
  <body>
    <center>
    <form action="dodelete.jsp" name="deleteform">
    <table cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
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
    <tr bgcolor="lightgrey">
      <td colspan="1" align="center">�û�����</td>
      <td colspan="3" align="cener">
          <input type="text" name="delusername">
      </td>
      <td align="center" colspan="1">
          <input type="submit" name="delsubmit" value="ɾ�����û�" onclick="return check()">
      </td>
    </tr>
   </table>
   </form>
  </center>
  </body>
</html>

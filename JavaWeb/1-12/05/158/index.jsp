<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<html>
  <head>
    <title>删除数据的方法</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <script language="javascript">
   function check(){
    if(deleteform.delusername.value==null||deleteform.delusername.value==""){
      alert("请输入用户名！");
      deleteform.delusername.focus();
      return false;
    }
    else{
      return(confirm("确认要删除该用户吗？"));
    }
   }
  </script>
  <body>
    <center>
    <form action="dodelete.jsp" name="deleteform">
    <table cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
    <tr bgcolor="lightgrey" height="25">
      <td align="center">用户名</td>
      <td align="center">性别</td>
      <td align="center">年龄</td>
      <td align="center">职务</td>
      <td align="center">资金</td>
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
      <td colspan="1" align="center">用户名：</td>
      <td colspan="3" align="cener">
          <input type="text" name="delusername">
      </td>
      <td align="center" colspan="1">
          <input type="submit" name="delsubmit" value="删除该用户" onclick="return check()">
      </td>
    </tr>
   </table>
   </form>
  </center>
  </body>
</html>

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<%
  boolean mark=true;
  String mess="";
  String username=request.getParameter("delusername");
  if(username==null||username.equals("")){
	  mark=false;
	  mess="<li>请输入<b>用户名！</b></li>";
  }
  if(mark){
	  username=new String(username.getBytes("ISO-8859-1"),"gbk");
      String sql="select * from tb_user where user_name='"+username+"'";
      ResultSet rs=db.getRs(sql);
      if(!rs.next()){
	      mess="输入的用户名不存在！";
      }
      else{
          sql="delete from tb_user where user_name='"+username+"'";
          int num=db.delete(sql);
          db.closed();
          if(num>0)
        	  response.sendRedirect("index.jsp");
          else
        	  mess="删除失败！";
      }
  }
%>
<html>
<head>
 <title>删除数据的方法</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
 <center>
  <table width="220" height="70" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
   <tr bgcolor="lightgrey">
    <td>友情提示！</td>
   </tr>
   <tr>
    <td align="center"><%=mess%></td>
   </tr>
  </table>
  <a href="index.jsp">[返回]</a>
 </center>
</body>
</html>
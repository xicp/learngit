<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<html>
<head>
 <title>数据修改的方法</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
  String mess="";
  boolean mark=true;
  String username=request.getParameter("searchusername");
  if(username==null||username.equals("")){
	  mark=false;
	  mess="<li>请输入<b>用户名！</b></li>";
  }
  if(mark){
	  username=new String(username.getBytes("ISO-8859-1"),"gbk");
      String sql="select * from tb_user where user_name='"+username+"'";
      ResultSet rs=db.getRs(sql);
      if(rs.next()){
	      session.setAttribute("searchusername",rs.getString("user_name"));
    	  db.closed();
    	  response.sendRedirect("showupdate.jsp");
      }
      else{
	      db.closed();
    	  mess="您输入的用户名不存在！";
      }
  }
%>
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
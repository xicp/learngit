<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="mydb" class="com.jb.db.DB" scope="page"/>
<html>
<head>
 <title>带参数的数据查询</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
  ResultSet rs=null;
  boolean mark=true;
  String mess="";
  String subsql=request.getParameter("subsql");
  String subsqlvalue=request.getParameter("subsqlvalue");  
  if(subsql==null||subsql.equals("")){
	  mark=false;
	  mess+="<li>请输入<b>查询条件！</b></li>";
  }
  if(subsqlvalue==null||subsqlvalue.equals("")){
	  mark=false;
	  mess+="<li>请输入<b>查询的值！</b></li>";
  }
  if(mark){
	  if(subsql.equals("user_age")){
		  try{
			  Integer.parseInt(subsqlvalue);
		  }catch(Exception e){mark=false;mess="输入的<b>年龄</b>不是数字！";}
	  }
  }
  if(mark)
	  mess="查询结果如下：";
%>
<body>
 <center>
  <table width="300" height="70" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
   <tr bgcolor="lightgrey" height="25">
    <td colspan="5" align="center">友情提示！</td>
   </tr>
   <tr>
    <td align="center" colspan="5"><%=mess%></td>
   </tr>
   <tr bgcolor="lightgrey" height="20">
    <td align="center">用户名</td>
    <td align="center">性别</td>
    <td align="center">年龄</td>
    <td align="center">职务</td>
    <td align="center">资金</td>
   </tr>
   <%
     if(mark){
		  subsqlvalue=new String(subsqlvalue.getBytes("ISO-8859-1"));
		  rs=mydb.getPartRs(subsql,subsqlvalue);
	      if(!rs.next()){
   %>
         <tr>
          <td align="center" colspan="5">没有记录显示！</td>
         </tr>
   <%
          } 
          else{
              rs.previous();
    	      while(rs.next()){
   %>
         <tr>
          <td align="center"><%=rs.getString("user_name")%></td>
          <td align="center"><%=rs.getString("user_sex")%></td>
          <td align="center"><%=rs.getInt("user_age")%></td>
          <td align="center"><%=rs.getString("user_job")%></td>
          <td align="center"><%=rs.getFloat("user_money")%></td>
         </tr>
   <%  
              }
          }
	      mydb.closed();
     }
   %>
  </table>
  <a href="index.jsp">[返回]</a>
 </center>
</body>
</html>

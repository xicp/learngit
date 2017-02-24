<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*,com.jb.db.DB" %>
<% DB db=new DB(); %>
<html>
  <head>
    <title>对结果集进行分页的方法</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
     <form name="searchform" method="post" action="dopagers.jsp">
     <table style="margin-top:200" width="230" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
      <tr align="center" valign="middle" bgcolor="#CCCCCC" height="22">
        <td>用户名</td>
		<td>性别</td>
		<td>年龄</td>
		<td>职务</td>
	  </tr>
      <%
        ResultSet rs=(ResultSet)session.getAttribute("pageresultset");
        if(rs==null){
      %>
      <tr align="center" valign="middle"><td colspan="4">没有记录显示！</td>
      </tr>
      <%
        }
        else{
        	 db=(DB)session.getAttribute("db");
        	 int i=1;
        	 rs.previous();
        	 while(rs.next()&&i<=db.getNumper()){
      %>
      <tr align="center" valign="middle" height="22">
        <td><%=rs.getString("user_name") %></td>  		 
        <td><%=rs.getString("user_sex") %></td>
        <td><%=rs.getInt("user_age") %></td>
        <td><%=rs.getString("user_job") %></td>                        	
      </tr>
      <%
        	 i++;
        	 }
      %>
      <tr bgcolor="lightgrey">
        <td colspan="4" align="center">
            每页：<%=db.getNumper()%>/<%=db.getNumrs()%> 条记录
            &nbsp;&nbsp;
            当前页：<%=db.getPagecurrent()%>/<%=db.getPagesall()%> 页
        </td>        
      </tr>                
      <%  
        }
      %>
      <tr>
        <td align="center" colspan="4">
    	  <input type="submit" name="searchall" value="查询全部数据">
        </td>
      </tr>
      
   <%if(db.getPagesall()>1){%>
       <tr bgcolor="lightgrey">
        <td align="center" colspan="4">
    	<%if(db.getPagecurrent()>1){%>
    	  <a href="dopagers.jsp?currentpage=1">第一页</a>
    	  <a href="dopagers.jsp?currentpage=<%=db.getPagecurrent()-1%>">上一页</a>
    	<%}%>
    	<%if(db.getPagecurrent()<db.getPagesall()){%>
    	  <a href="dopagers.jsp?currentpage=<%=db.getPagecurrent()+1%>">下一页</a>
    	  <a href="dopagers.jsp?currentpage=<%=db.getPagesall()%>">最后一页</a>
    	<%}%>
        </td>
      </tr>
    <%}%>
     </table>
     </form>
    </center>
  </body>
</html>

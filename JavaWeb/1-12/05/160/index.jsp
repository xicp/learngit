<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*,com.jb.db.DB" %>
<% DB db=new DB(); %>
<html>
  <head>
    <title>�Խ�������з�ҳ�ķ���</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
     <form name="searchform" method="post" action="dopagers.jsp">
     <table style="margin-top:200" width="230" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
      <tr align="center" valign="middle" bgcolor="#CCCCCC" height="22">
        <td>�û���</td>
		<td>�Ա�</td>
		<td>����</td>
		<td>ְ��</td>
	  </tr>
      <%
        ResultSet rs=(ResultSet)session.getAttribute("pageresultset");
        if(rs==null){
      %>
      <tr align="center" valign="middle"><td colspan="4">û�м�¼��ʾ��</td>
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
            ÿҳ��<%=db.getNumper()%>/<%=db.getNumrs()%> ����¼
            &nbsp;&nbsp;
            ��ǰҳ��<%=db.getPagecurrent()%>/<%=db.getPagesall()%> ҳ
        </td>        
      </tr>                
      <%  
        }
      %>
      <tr>
        <td align="center" colspan="4">
    	  <input type="submit" name="searchall" value="��ѯȫ������">
        </td>
      </tr>
      
   <%if(db.getPagesall()>1){%>
       <tr bgcolor="lightgrey">
        <td align="center" colspan="4">
    	<%if(db.getPagecurrent()>1){%>
    	  <a href="dopagers.jsp?currentpage=1">��һҳ</a>
    	  <a href="dopagers.jsp?currentpage=<%=db.getPagecurrent()-1%>">��һҳ</a>
    	<%}%>
    	<%if(db.getPagecurrent()<db.getPagesall()){%>
    	  <a href="dopagers.jsp?currentpage=<%=db.getPagecurrent()+1%>">��һҳ</a>
    	  <a href="dopagers.jsp?currentpage=<%=db.getPagesall()%>">���һҳ</a>
    	<%}%>
        </td>
      </tr>
    <%}%>
     </table>
     </form>
    </center>
  </body>
</html>

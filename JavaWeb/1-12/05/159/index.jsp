<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*,com.jb.db.DB" %>
<% DB db=new DB(); %>
<html>
  <head>
    <title>���ݿ��ҳ�ķ���</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
     <form name="searchform" method="post" action="dopagedb.jsp">
     <table style="margin-top:200" width="230" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
      <tr align="center" valign="middle" bgcolor="#CCCCCC" height="22">
        <td>��Ϸ��</td>
		<td>����</td>
		<td>��С</td>
    	<td>�ϴ���</td>
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
        	 while(rs.next()){
      %>
      <tr align="center" valign="middle" height="22">
        <td><%=rs.getString("game_name") %></td>  		 
        <td><%=rs.getString("game_hot") %></td>
        <td><%=rs.getString("game_size") %></td>                        	
        <td><%=rs.getString("game_uper") %></td>                    	        
      </tr>
      <%
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
    	  <input type="submit" name="searchall" value="��ѯ��һҳ">
        </td>
      </tr>
      
   <%if(db.getPagesall()>1){%>
       <tr bgcolor="lightgrey">
        <td align="center" colspan="4">
    	<%if(db.getPagecurrent()>1){%>
    	  <a href="dopagedb.jsp?currentpage=1">��һҳ</a>
    	  <a href="dopagedb.jsp?currentpage=<%=db.getPagecurrent()-1%>">��һҳ</a>
    	<%}%>
    	<%if(db.getPagecurrent()<db.getPagesall()){%>
    	  <a href="dopagedb.jsp?currentpage=<%=db.getPagecurrent()+1%>">��һҳ</a>
    	  <a href="dopagedb.jsp?currentpage=<%=db.getPagesall()%>">���һҳ</a>
    	<%}%>
        </td>
      </tr>
    <%}%>
     </table>
     </form>
    </center>
  </body>
</html>

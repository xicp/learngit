<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="mydb" class="com.jb.db.DB" scope="page"/>
<html>
<head>
 <title>�����������ݲ�ѯ</title>
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
	  mess+="<li>������<b>��ѯ������</b></li>";
  }
  if(subsqlvalue==null||subsqlvalue.equals("")){
	  mark=false;
	  mess+="<li>������<b>��ѯ��ֵ��</b></li>";
  }
  if(mark){
	  if(subsql.equals("user_age")){
		  try{
			  Integer.parseInt(subsqlvalue);
		  }catch(Exception e){mark=false;mess="�����<b>����</b>�������֣�";}
	  }
  }
  if(mark)
	  mess="��ѯ������£�";
%>
<body>
 <center>
  <table width="300" height="70" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
   <tr bgcolor="lightgrey" height="25">
    <td colspan="5" align="center">������ʾ��</td>
   </tr>
   <tr>
    <td align="center" colspan="5"><%=mess%></td>
   </tr>
   <tr bgcolor="lightgrey" height="20">
    <td align="center">�û���</td>
    <td align="center">�Ա�</td>
    <td align="center">����</td>
    <td align="center">ְ��</td>
    <td align="center">�ʽ�</td>
   </tr>
   <%
     if(mark){
		  subsqlvalue=new String(subsqlvalue.getBytes("ISO-8859-1"));
		  rs=mydb.getPartRs(subsql,subsqlvalue);
	      if(!rs.next()){
   %>
         <tr>
          <td align="center" colspan="5">û�м�¼��ʾ��</td>
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
  <a href="index.jsp">[����]</a>
 </center>
</body>
</html>

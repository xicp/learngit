<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<html>
<head>
 <title>�������ݿ�洢���̵ķ���</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
  String   mess="";
  String   username=request.getParameter("username");
  String   usersex=request.getParameter("usersex");
  String   userage=request.getParameter("userage");
  String   userjob=request.getParameter("userjob");
  String   usermoney=request.getParameter("usermoney");
  int     age=0;
  float   money=0;
  boolean mark=true;
  if(username==null||username.equals("")){
      mark=false;
      mess="<li>������<b>�û�����</b></li>";
  }   
  if(usersex==null||usersex.equals("")){
      mark=false;
      mess+="<li>������<b>��&nbsp;&nbsp;��</b></li>";
  }
  if(userage==null||userage.equals("")){
      mark=false;
      mess+="<li>������<b>��&nbsp;&nbsp;�䣡</b></li>";
  }
  if(userjob==null||userjob.equals("")){
      mark=false;
      mess+="<li>������<b>ְ&nbsp;&nbsp;��</b></li>";
  }
  if(usermoney==null||usermoney.equals("")){
      mark=false;
      mess+="<li>������<b>��&nbsp;&nbsp;��</b></li>";
  }
  if(mark){
	 try{
		 age=Integer.parseInt(userage);
	 }catch(Exception e){mark=false;mess+="<li>�����<b>����</b>�������֣�</li>";}
     try{
	     money=Float.parseFloat(usermoney);
	 }catch(Exception e){mark=false;mess+="<li>�����<b>�ʽ�</b>�������֣�</li>";}
  }
  if(mark){
	  username=new String(username.getBytes("ISO-8859-1"),"gbk");
      usersex=new String(usersex.getBytes("ISO-8859-1"),"gbk");
      userjob=new String(userjob.getBytes("ISO-8859-1"),"gbk");
      int i=db.useproc(username,usersex,age,userjob,money);
      db.closed();
      if(i<=0){
    	  mess="����ʧ�ܣ�";
      }
      else
    	  mess="�����ɹ���";
  }
%>
<body>
 <center>
  <table width="300" height="70" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
   <tr height="25" bgcolor="lightgrey">
    <td colspan="5" align="center">������ʾ��</td>
   </tr>
   <tr>
    <td align="center" colspan="5"><%=mess%></td>
   </tr>
          <tr bgcolor="lightgrey" height="25">
      <td align="center">�û���</td>
      <td align="center">�Ա�</td>
      <td align="center">����</td>
      <td align="center">ְ��</td>
      <td align="center">�ʽ�</td>
    </tr>
    <%
      ResultSet rsall=db.getRs("select * from tb_user");
      String getname="";
      String getsex="";
      int getage=0;
      String getjob="";
      float getmoney=0;
      while(rsall.next()){
    	  getname=rsall.getString("user_name");
    	  getsex=rsall.getString("user_sex");
    	  getage=rsall.getInt("user_age");
    	  getjob=rsall.getString("user_job");
    	  getmoney=rsall.getFloat("user_money");
          if(getname.equals(username)){
    %>
    <tr bgcolor="lightyellow">
    <%      
          }
          else{
    %>
    <tr>
    <%
          }
    %>
      <td align="center"><%=getname%></td>
      <td align="center"><%=getsex%></td>
      <td align="center"><%=getage%></td>
      <td align="center"><%=getjob%></td>
      <td align="center"><%=getmoney%></td>
    </tr>
   <%  
      }
   %>
  </table>
  <a href="index.jsp">[����]</a>
 </center>
</body>
</html>
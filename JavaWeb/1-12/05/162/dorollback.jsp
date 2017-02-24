<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<html>
<head>
 <title>数据库事务处理的方法</title>
  <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<%
  boolean mark=true;
  String mess="";
  float money=0;  
  String fromname=request.getParameter("from");
  String toname=request.getParameter("to");
  String strmoney=request.getParameter("money");
  if(fromname==null||fromname.equals("")){
	  mark=false;
	  mess+="<li>请输入<b>来源用户！</b>";
  }
  if(toname==null||toname.equals("")){
	  mark=false;
	  mess+="<li>请输入<b>转至用户！</b></li>";
  }
  if(strmoney==null||strmoney.equals("")){
	  mark=false;
	  mess+="<li>请输入<b>金&nbsp;&nbsp;&nbsp;&nbsp;额！</b></li>";
  }
  if(mark){
	  try{
		  money=Float.parseFloat(strmoney);
	  }catch(Exception e){mark=false;mess="输入的金额不是数字！";}
  }
  if(mark){
	  fromname=new String(fromname.getBytes("ISO-8859-1"),"gbk");
	  toname=new String(toname.getBytes("ISO-8859-1"),"gbk");  
	  String result=db.doback(fromname,toname,money);
      if(result.equals("success"))
	      mess="转帐成功！";
      else if(result.equals("false"))
	      mess="转帐失败！";
      else
	      mess=result;
  }
%>
<body>
 <center>
  <table width="300" height="70" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
   <tr bgcolor="lightgrey" height="25">
    <td colspan="5" align="center">友情提示！</td>
   </tr>
   <tr>
    <td align="center" colspan="5"><%=mess%></td>
   </tr>
   <tr bgcolor="lightgrey" height="25">
      <td align="center">用户名</td>
      <td align="center">性别</td>
      <td align="center">年龄</td>
      <td align="center">职务</td>
      <td align="center">资金</td>
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
          if(getname.equals(fromname)||getname.equals(toname)){
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
  <a href="index.jsp">[返回]</a>
 </center>
</body>
</html>

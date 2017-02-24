<%@ page contentType="text/html;charset=GBK"%>
<jsp:useBean id="db" class="com.jb.db.DB"/>
<html>
<head>
 <title>增加数据的方法</title>
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
      mess="<li>请输入<b>用户名！</b></li>";
  }  
  if(usersex==null||usersex.equals("")){
      mark=false;
      mess+="<li>请输入<b>性别！</b></li>";
  }
  if(userage==null||userage.equals("")){
      mark=false;
      mess+="<li>请输入<b>年龄！</b></li>";
  }
  if(userjob==null||userjob.equals("")){
      mark=false;
      mess+="<li>请输入<b>职务！</b></li>";
  }
  if(usermoney==null||usermoney.equals("")){
      mark=false;
      mess+="<li>请输入<b>资金！</b></li>";
  }
  if(mark){
	    try{
		    age=Integer.parseInt(userage);
	    }catch(Exception e){mark=false;mess+="<li>输入的<b>年龄</b>不是数字！</li>";}
        try{
		    money=Float.parseFloat(usermoney);
	    }catch(Exception e){mark=false;mess+="<li>输入的<b>资金</b>不是数字！</li>";}
  }
  if(mark){
	  username=new String(username.getBytes("ISO-8859-1"),"gbk");
      usersex=new String(usersex.getBytes("ISO-8859-1"),"gbk");
      userjob=new String(userjob.getBytes("ISO-8859-1"),"gbk");
      String sql="insert into tb_user values('"+username+"','"+usersex+"',"+age+",'"+userjob+"',"+money+")";
      int i=db.insert(sql);
      db.closed();
      if(i>0)
    	  response.sendRedirect("show.jsp");
      else
    	  mess="插入失败！";
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
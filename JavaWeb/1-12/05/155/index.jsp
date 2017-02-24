<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<html>
  <head>
    <title>带参数的数据查询</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <script language="javascript">
    function check(){
      if(searchform.subsqlvalue.value==null||searchform.subsqlvalue.value==""){
        alert("请输入查询的条件");
        searchform.subsqlvalue.focus();
        return false;
      }
      if(searchform.subsql.value=="user_age"){
        if(isNaN(searchform.subsqlvalue.value)){
          alert("输入的年龄必须为数字！");
          searchform.subsqlvalue.focus();
          return false;
        }
      }
    }
  </script>
  <body>
    <center>
     <form name="searchform" method="post" action="dosearchpart.jsp">
     <table style="margin-top:200" width="300" border="1" cellpadding="0" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white">
      <tr bgcolor="lightgrey" height="25">
       <td align="center">用户名</td>
       <td align="center">性别</td>
       <td align="center">年龄</td>
       <td align="center">职务</td>
       <td align="center">资金</td>
      </tr>
    <%
      ResultSet rsall=db.getAllRs();
      while(rsall.next()){
    %>
      <tr>
       <td align="center"><%=rsall.getString("user_name")%></td>
       <td align="center"><%=rsall.getString("user_sex")%></td>
       <td align="center"><%=rsall.getInt("user_age")%></td>
       <td align="center"><%=rsall.getString("user_job")%></td>
       <td align="center"><%=rsall.getFloat("user_money")%></td>
      </tr>
    <%  
      }
    %>
      <tr bgcolor="lightgrey">
        <td align="center" colspan="5">
		  查询类型：
    	  <select name="subsql">
		    <option value="user_name">用户名</option>
		    <option value="user_sex">性别</option>
		    <option value="user_age">年龄</option>						
		    <option value="user_job">职务</option>			
		  </select>
		  <input type="text" name="subsqlvalue" size="17">
		  <input type="submit" name="searchpart" value="查询" onclick="return check()">
        </td>
      </tr>
     </table>
     </form>
    </center>
  </body>
</html>

<%@ page contentType="text/html;charset=GBK"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="db" class="com.jb.db.DB" scope="page"/>
<html>
  <head>
    <title>�����������ݲ�ѯ</title>
     <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <script language="javascript">
    function check(){
      if(searchform.subsqlvalue.value==null||searchform.subsqlvalue.value==""){
        alert("�������ѯ������");
        searchform.subsqlvalue.focus();
        return false;
      }
      if(searchform.subsql.value=="user_age"){
        if(isNaN(searchform.subsqlvalue.value)){
          alert("������������Ϊ���֣�");
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
       <td align="center">�û���</td>
       <td align="center">�Ա�</td>
       <td align="center">����</td>
       <td align="center">ְ��</td>
       <td align="center">�ʽ�</td>
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
		  ��ѯ���ͣ�
    	  <select name="subsql">
		    <option value="user_name">�û���</option>
		    <option value="user_sex">�Ա�</option>
		    <option value="user_age">����</option>						
		    <option value="user_job">ְ��</option>			
		  </select>
		  <input type="text" name="subsqlvalue" size="17">
		  <input type="submit" name="searchpart" value="��ѯ" onclick="return check()">
        </td>
      </tr>
     </table>
     </form>
    </center>
  </body>
</html>

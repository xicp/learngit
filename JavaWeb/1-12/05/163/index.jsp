<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>�������ݿ�洢���̵ķ���</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script language="javascript">
 function check(){
   if(insertform.username.value==null||insertform.username.value==""){
      alert("�������û�����");
      insertform.username.focus();
      return false;
   }
   if(insertform.usersex.value==null||insertform.usersex.value==""){
      alert("�������Ա�");
      insertform.usersex.focus();
      return false;
   }
   if(insertform.userage.value==null||insertform.userage.value==""){
      alert("���������䣡");
      insertform.userage.focus()
      return false;
   }
   if(insertform.userjob.value==null||insertform.userjob.value==""){
      alert("������ְ��");
      insertform.userjob.focus();
      return false;
   }
   if(insertform.usermoney.value==null||insertform.usermoney.value==""){
      alert("�������ʽ�");
      insertform.usermoney.focus();
      return false;
   }
   if(isNaN(insertform.userage.value)){
      alert("�������Ϊ���֣�");
      insertform.userage.focus();
      return false;
   }
    if(isNaN(insertform.usermoney.value)){
      alert("�ʽ����Ϊ���֣�");
      insertform.usermoney.focus();
      return false;
   }
   return true;
 }
</script>
<body>
 <center>
  <form action="douseproc.jsp" name="insertform">
   <table  width="230" height="150" style="margin-top:100" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white">
    <tr>
      <td colspan="2" align="center" bgcolor="lightgrey">
        ʹ�ô洢�������Ӽ�¼
      </td>
    </tr>
    <tr>
     <td align="right">�û�����</td>
     <td><input type="text" name="username"></td>
    </tr>
    <tr>
     <td align="right">�Ա�</td>
     <td><input type="text" name="usersex" maxlength="2"></td>
    </tr>
    <tr>
     <td align="right">���䣺</td>
     <td><input type="text" name="userage"></td>
    </tr>
    <tr>
     <td align="right">ְ��</td>
     <td><input type="text" name="userjob"></td>
    </tr>
    <tr>
     <td align="right">�ʽ�</td>
     <td><input type="text" name="usermoney"></td>
    </tr>
    <tr>
     <td colspan="2" align="center">
       <input type="submit" name="submit" value="���" onclick="return check()">
       <input type="reset" name="reset" value="����">       
     </td>
    </tr>
   </table>
  </form>
 </center>
</body>
    
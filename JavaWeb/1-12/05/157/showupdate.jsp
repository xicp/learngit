<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>�����޸ĵķ���</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script language="javascript">
 function check(){
   if(updateform.usersex.value==null||updateform.usersex.value==""){
      alert("�������Ա�");
      updateform.usersex.focus();
      return false;
   }
   if(updateform.userage.value==null||updateform.userage.value==""){
      alert("���������䣡");
      updateform.userage.focus()
      return false;
   }
   if(updateform.userjob.value==null||updateform.userjob.value==""){
      alert("������ְ��");
      updateform.userjob.focus();
      return false;
   }
   if(updateform.usermoney.value==null||updateform.usermoney.value==""){
      alert("�������ʽ�");
      updateform.usermoney.focus();
      return false;
   }
   if(isNaN(updateform.userage.value)){
      alert("�������Ϊ���֣�");
      updateform.userage.focus();
      return false;
   }
   if(isNaN(updateform.usermoney.value)){
      alert("�ʽ����Ϊ���֣�");
      updateform.usermoney.focus();
      return false;
   }
   
   return true;
 }
</script>
<body>
 <center>
  <form action="doupdate.jsp" name="updateform">
   <table width="220" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:100">
    <tr>
      <td colspan="2" align="center" bgcolor="lightgrey">
        ����д������Ϣ��
      </td>
    </tr>
    <tr>
     <td align="right">�û�����</td>
     <td><%=(String)session.getAttribute("searchusername")%></td>
    </tr>
    <tr>
     <td align="right">�Ա�</td>
     <td><input type="text" name="usersex" maxlength="1"></td>
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
       <input type="submit" name="submit" value="����" onclick="return check()">
       <input type="reset" name="reset" value="����">       
     </td>
    </tr>
   </table>
  </form>
  <a href="index.jsp">[��ҳ]</a>
 </center>
</body>
    
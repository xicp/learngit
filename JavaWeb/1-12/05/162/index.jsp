<%@ page contentType="text/html;charset=GBK"%>

<html>
  <head>
    <title>���ݿ�������ķ���</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <script language="javascript">
    function check(){
      if(dorollbackform.from.value==null||dorollbackform.from.value==""){
         alert("��������Դ�û�����");
         dorollbackform.from.focus();
         return false;
      }
      if(dorollbackform.to.value==null||dorollbackform.to.value==""){
         alert("������ת���û�����");
         dorollbackform.to.focus();
         return false;
      }
      if(dorollbackform.money.value==null||dorollbackform.money.value==""){
         alert("������ת�ʵĽ�");
         dorollbackform.money.focus();
         return false;
      }
      if(isNaN(dorollbackform.money.value)){
         alert("�������ת�ʽ������֣�");
         dorollbackform.money.focus();
         return false;
      }
      return true;
      
    }
  </script>
  <body>
    <center>
    <form action="dorollback.jsp" name="dorollbackform">
    <table width="25%"  border="1" cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
      <tr align="center" height="25" bgcolor="lightgrey">
        <td colspan="2" align="center">���ݿ�������ķ���</td>
      </tr>
      <tr>
        <td align="right">��Դ��</td>
        <td><input type="text" name="from"></td>
      </tr>
      <tr>
        <td align="right">ת����</td>
        <td><input type="text" name="to"></td>
      </tr>
      <tr>
        <td align="right">��</td>
        <td><input type="text" name="money" size="10">
          Ԫ</td>
      </tr>
      <tr align="center" bgcolor="lightgrey">
        <td colspan="2"><input type="submit" name="Submit" value="ת��" onclick="return check()"></td>
      </tr>
    </table>
    </form>
	</center>    
  </body>
</html>

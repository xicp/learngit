<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>数据修改的方法</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script language="javascript">
 function check(){
   if(updateform.usersex.value==null||updateform.usersex.value==""){
      alert("请输入性别！");
      updateform.usersex.focus();
      return false;
   }
   if(updateform.userage.value==null||updateform.userage.value==""){
      alert("请输入年龄！");
      updateform.userage.focus()
      return false;
   }
   if(updateform.userjob.value==null||updateform.userjob.value==""){
      alert("请输入职务！");
      updateform.userjob.focus();
      return false;
   }
   if(updateform.usermoney.value==null||updateform.usermoney.value==""){
      alert("请输入资金！");
      updateform.usermoney.focus();
      return false;
   }
   if(isNaN(updateform.userage.value)){
      alert("年龄必须为数字！");
      updateform.userage.focus();
      return false;
   }
   if(isNaN(updateform.usermoney.value)){
      alert("资金必须为数字！");
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
        请填写更新信息！
      </td>
    </tr>
    <tr>
     <td align="right">用户名：</td>
     <td><%=(String)session.getAttribute("searchusername")%></td>
    </tr>
    <tr>
     <td align="right">性别：</td>
     <td><input type="text" name="usersex" maxlength="1"></td>
    </tr>
    <tr>
     <td align="right">年龄：</td>
     <td><input type="text" name="userage"></td>
    </tr>
    <tr>
     <td align="right">职务：</td>
     <td><input type="text" name="userjob"></td>
    </tr>
    <tr>
     <td align="right">资金：</td>
     <td><input type="text" name="usermoney"></td>
    </tr>
    <tr>
     <td colspan="2" align="center">
       <input type="submit" name="submit" value="更新" onclick="return check()">
       <input type="reset" name="reset" value="重置">       
     </td>
    </tr>
   </table>
  </form>
  <a href="index.jsp">[首页]</a>
 </center>
</body>
    
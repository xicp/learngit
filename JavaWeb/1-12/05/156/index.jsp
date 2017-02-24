<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>数据增加的方法</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script language="javascript">
 function check(){
   if(insertform.username.value==null||insertform.username.value==""){
      alert("请输入用户名！");
      insertform.username.focus();
      return false;
   }
   if(insertform.usersex.value==null||insertform.usersex.value==""){
      alert("请输入性别！");
      insertform.usersex.focus();
      return false;
   }
   if(insertform.userage.value==null||insertform.userage.value==""){
      alert("请输入年龄！");
      insertform.userage.focus()
      return false;
   }
   if(insertform.userjob.value==null||insertform.userjob.value==""){
      alert("请输入职务！");
      insertform.userjob.focus();
      return false;
   }
   if(insertform.usermoney.value==null||insertform.usermoney.value==""){
      alert("请输入资金！");
      insertform.usermoney.focus();
      return false;
   }
   if(isNaN(insertform.userage.value)){
      alert("年龄必须为数字！");
      insertform.userage.focus();
      return false;
   }
    if(isNaN(insertform.usermoney.value)){
      alert("资金必须为数字！");
      insertform.usermoney.focus();
      return false;
   }
   return true;
 }
</script>
<body>
 <center>
  <form action="doinsert.jsp" name="insertform">
   <table  width="230" height="150" style="margin-top:100" cellspacing="0" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white">
    <tr height="25">
      <td colspan="2" align="center" bgcolor="lightgrey">
         请填写信息！
      </td>
    </tr>
    <tr>
     <td align="right">用户名：</td>
     <td><input type="text" name="username" size="27"></td>
    </tr>
    <tr>
     <td align="right">性别：</td>
     <td><input type="text" name="usersex" maxlength="2" size="27"></td>
    </tr>
    <tr>
     <td align="right">年龄：</td>
     <td><input type="text" name="userage" size="27"></td>
    </tr>
    <tr>
     <td align="right">职务：</td>
     <td><input type="text" name="userjob" size="27"></td>
    </tr>
    <tr>
     <td align="right">资金：</td>
     <td><input type="text" name="usermoney" size="27"></td>
    </tr>
    <tr>
     <td colspan="2" align="center">
       <input type="submit" name="submit" value="添加" onclick="return check()">
       <input type="reset" name="reset" value="重置">       
     </td>
    </tr>
   </table>
  </form>
 </center>
</body>
    
<%@ page contentType="text/html;charset=GBK"%>

<html>
  <head>
    <title>数据库事务处理的方法</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <script language="javascript">
    function check(){
      if(dorollbackform.from.value==null||dorollbackform.from.value==""){
         alert("请输入来源用户名！");
         dorollbackform.from.focus();
         return false;
      }
      if(dorollbackform.to.value==null||dorollbackform.to.value==""){
         alert("请输入转至用户名！");
         dorollbackform.to.focus();
         return false;
      }
      if(dorollbackform.money.value==null||dorollbackform.money.value==""){
         alert("请输入转帐的金额！");
         dorollbackform.money.focus();
         return false;
      }
      if(isNaN(dorollbackform.money.value)){
         alert("您输入的转帐金额不是数字！");
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
        <td colspan="2" align="center">数据库事务处理的方法</td>
      </tr>
      <tr>
        <td align="right">来源：</td>
        <td><input type="text" name="from"></td>
      </tr>
      <tr>
        <td align="right">转至：</td>
        <td><input type="text" name="to"></td>
      </tr>
      <tr>
        <td align="right">金额：</td>
        <td><input type="text" name="money" size="10">
          元</td>
      </tr>
      <tr align="center" bgcolor="lightgrey">
        <td colspan="2"><input type="submit" name="Submit" value="转帐" onclick="return check()"></td>
      </tr>
    </table>
    </form>
	</center>    
  </body>
</html>

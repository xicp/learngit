<%@page contentType="text/html" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>准备考试</title>
		<link href="CSS/style.css" rel="stylesheet">
		<script type="text/javascript">
		
			function showWindow(){
				window.open('StartExam?action=startExam','','width=750,height=500,scrollbars=1');
			}
		</script>
    </head>
    <body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="images/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="76%" class="word_grey">&nbsp;<img src="images/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">在线考试 → 准备考试 &gt;&gt;&gt;</span></td>
			  <td width="24%" align="right"><img src="images/m_ico1.gif" width="5" height="9">
			   返回首页&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%" height="265"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="93" colspan="3" align="center" class="word_orange1">&nbsp;</td>
</tr>
  <tr>
    <td width="12%">&nbsp;</td>
    <td width="77%" align="center" valign="top">准备好了吗？<br><br>考生单击“开始考试”按钮，系统将立即记录本次考试并登记考试成绩！</td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="top">
    
    <input name="start" type="button" class="btn_grey" onclick="showWindow()" value="开始考试">
	</td>
    <td>&nbsp;</td>
  </tr>
</table> 
        </td>
      </tr>
    </table>
</td>
  </tr>
</table>
<jsp:include page="copyright.jsp"/>
    </body>
</html>

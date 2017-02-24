<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>最新新闻详细信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<link href="CSS/style.css" rel="stylesheet">
  </head>
  
  <body>
<table width="500" height="567" border="0" align="center" cellpadding="0" cellspacing="0" background="images\detail_bg.jpg">
  <tr>
    <td width="19" height="151" valign="bottom">&nbsp;</td>
    <td colspan="2" valign="bottom">&nbsp;<b>·${requestScope.title }</b></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;&nbsp;</td>
    <td width="463" valign="top">&nbsp;&nbsp;${requestScope.content }</td>
    <td width="18" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td height="60" colspan="3" align="center"><input name="Button" type="button" class="btn_grey" onClick="window.close();" value="关闭"></td>
  </tr>
</table>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<style>
<!--
td{
font-size: 9pt;
}
-->
</style>
<html>
  <head>
    <title>文件下载</title>
  </head>
  <body>
  <table width="555" height="119" border="0" cellpadding="-2" cellspacing="-2" background="images/top.gif">
  <tr valign="top">
    <td width="800" valign="bottom"><table width="555" height="27"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td width="6%" height="27" align="center" valign="middle"> &nbsp;<img src="images/icon_smile.GIF" width="15" height="15"></td>
        <td width="56%" height="27" align="center"><div align="left"><span class="style3">&nbsp;您好！</span></div></td>
        <td width="38%" height="27"><div align="center"></div></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="555" border="0" cellpadding="-2" cellspacing="-2">
  <tr>
    <td width="817" valign="top">
	     <table width="100%"  border="1" align="right" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolorlight="#FFCCCC" bordercolordark="#FFFFFF">
        <tr>
          <td width="29%" height="27"><div align="center">标题</div></td>
          <td width="14%" height="27"><div align="center">上传人</div></td>
          <td width="23%" height="27"><div align="center">上传时间</div></td>
          <td width="17%" height="27"><div align="center">文件大小</div></td>
          <td width="6%" height="27"><div align="center">下载</div></td>
          </tr>
        <tr>
          <td align="center">照片</td>
          <td align="center">欣欣</td>
          <td><div align="center">2006年9月23日</div></td>
          <td><div align="center">51KB</div></td>
        
          <td><div align="center">
		      <A HREF="download.jsp?path=<%=getServletContext().getRealPath("测试图片.jpg") %>">
			  <img src="images/download.GIF" width="22" height="22" border="0"></A>
          </div></td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="556" border="0" cellspacing="-2" cellpadding="-2">
  <tr>
    <td><div align="right">
		<a>上一页</a> 
   		<a>下一页</a> 
		<a>最后一页</a> 
&nbsp; </div></td>
  </tr>
</table>
  </body>
</html>

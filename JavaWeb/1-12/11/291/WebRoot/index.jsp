<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
    <title>jspSmartUploadʵ���ļ�����</title>
  </head>
  <body>
  <table width="555" height="119" border="0" cellpadding="-2" cellspacing="-2" background="images/bg.jpg">
  <tr valign="top">
    <td width="800" valign="bottom"><table width="555" height="27"  border="0" cellpadding="-2" cellspacing="-2">
      <tr>
        <td width="6%" height="27" align="center" valign="middle"> </td>
        <td width="56%" height="27" align="center"></td>
        <td width="38%" height="27"><div align="center"></div></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="555" border="0" cellpadding="-2" cellspacing="-2">
  <tr>
    <td width="817" valign="top">
	     <table width="100%"  border="1" align="right" cellpadding="0" cellspacing="0" bordercolor="skyblue" bordercolorlight="skyblue" bordercolordark="skyblue">
        <tr>
          <td width="29%" height="27"><div align="center">����</div></td>
          <td width="14%" height="27"><div align="center">�ϴ���</div></td>
          <td width="23%" height="27"><div align="center">�ϴ�ʱ��</div></td>
          <td width="17%" height="27"><div align="center">�ļ���С</div></td>
          <td width="6%" height="27"><div align="center">����</div></td>
          </tr>
        <tr>
          <td align="center">��Ƭ</td>
          <td align="center">����</td>
          <td><div align="center">2010��7��30��</div></td>
          <td><div align="center">51KB</div></td>
        
          <td><div align="center">
          
		      <A HREF="download.jsp?path=<%=basePath+"����ͼƬ.jpg"%>">
			  <img src="images/download.GIF" width="22" height="22" border="0"></A>
          </div></td>
          </tr>
           <tr>
          <td align="center">��Ƭ</td>
          <td align="center">����</td>
          <td><div align="center">2010��7��30��</div></td>
          <td><div align="center">59KB</div></td>
        
          <td><div align="center">
		      <A HREF="download.jsp?path=<%=basePath+"����ͼƬ.jpg"%>">
			  <img src="images/download.GIF" width="22" height="22" border="0"></A>
          </div></td>
          </tr>
           <tr>
          <td align="center">��Ƭ</td>
          <td align="center">����</td>
          <td><div align="center">2010��7��30��</div></td>
          <td><div align="center">32KB</div></td>
        
          <td><div align="center">
		      <A HREF="download.jsp?path=<%=basePath+"����ͼƬ.jpg"%>">
			  <img src="images/download.GIF" width="22" height="22" border="0"></A>
          </div></td>
          </tr>
      </table></td>
  </tr>
</table>
<table width="556" border="0" cellspacing="-2" cellpadding="-2">
  <tr>
    <td><div align="right">
		<a>��һҳ</a> 
   		<a>��һҳ</a> 
		<a>���һҳ</a> 
&nbsp; </div></td>
  </tr>
</table>
  </body>
</html>

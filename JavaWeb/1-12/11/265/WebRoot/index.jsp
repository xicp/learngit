<%@ page language="java" pageEncoding="GBK"%>
<jsp:directive.page import="java.io.FileReader"/>
<jsp:directive.page import="java.io.File"/>
<%!File file;
FileReader reader;
char[] cbuf;
%>
<%
file=new File(getServletContext().getRealPath("xieyi.txt"));
cbuf=new char[(int)file.length()];
reader=new FileReader(file);
reader.read(cbuf);
%>
<html>
	<head>
		<title>���ı��ļ��ж�ȡע���������</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<link href="CSS/style.css" rel="stylesheet">
	</head>
	<body>
<table width="600" border="0" align="center" cellpadding="0"
	cellspacing="0">
	<tr><td valign="top" bgcolor="#FFFFFF">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="11" valign="top">&nbsp;</td>
	<td width="558" valign="top">
	<table width="100%" height="60" border="0" cellpadding="0"
		cellspacing="0">
		<tr><td><table width="100%" height="42" border="0" cellpadding="0"
					cellspacing="0">
					<tr><td height="10" colspan="2"
							background="images/sub_line.GIF"></td>
					</tr>
					<tr><td height="3" colspan="2"></td></tr>
					<tr><td height="29" class="word_blue">
							��ǰλ�ã���ҳ &gt; ��Ա���� &gt; ע���»�Ա &gt;&gt;&gt;</td>
						<td width="19%" align="center" class="word_blue">&nbsp;</td>
					</tr></table></td></tr></table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr><td width="15" height="400" valign="top">&nbsp;</td>
			<td width="550" valign="top">
	<table width="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tr><td width="100%" height="5"></td></tr>
		<tr valign="top">
			<td height="41" background="images/center_how.GIF">
				<table width="100%" height="29" border="0" cellpadding="0"
					cellspacing="0">
					<tr><td width="6%" height="7">&nbsp;</td>
						<td width="94%">&nbsp;</td></tr>
					<tr><td>&nbsp;</td>
						<td>ע���»�Ա</td></tr></table></td></tr>
					<tr><td height="60" valign="top">
							&nbsp;&nbsp;&nbsp;&nbsp;������ϸ�Ķ������ܡ���Ա���������<br><br>
							&nbsp;&nbsp;&nbsp;&nbsp;��������ҽ��ܡ�������</td></tr>
					<tr align="center" valign="top">
						<td height="69">
	<form name="form1" method="post" action="reg02.asp">
		<table width="88%" height="100" border="0"
			cellpadding="0" cellspacing="0">
			<tr><td align="center">��Ա��������</td></tr>
			<tr>
				<td height="27" align="center" class="word_deepgrey">
					<textarea name="artcle" cols="75" rows="14"
						class="textarea"><%=String.valueOf(cbuf) %>
					</textarea>
				</td>
			</tr>
			<tr><td height="27" align="center" class="word_deepgrey">
					<input name="Submit" type="button" class="btn_grey"
						value="�ҽ���">&nbsp;
					<input name="Submit2" type="button" class="btn_grey"
						value="�Ҳ�����"
						onClick="window.close();"></td></tr></table>
	</form></td></tr></table></td></tr></table></td></tr>
	</table></td><td width="31" valign="top" bgcolor="#FFFFFF">&nbsp;</td></tr>
</table>
</body>
</html>


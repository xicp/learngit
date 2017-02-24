<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.*"  %>


<%
	String fileTxt ="";
	request.setCharacterEncoding("UTF-8");//设置请求编码格式
	String filePath = request.getParameter("fileStr");//获取用户输入的地址 
	if (filePath != null) {//判断是否为空
		//获取文件真实路径   
		String path = pageContext.getServletContext().getRealPath(filePath);
		fileTxt = FileUtil.getFileTxt(path);//调用方法读取文本内容 
	}
%>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>无标题文档</title>
	</head>
	<body>
		<table width="487" height="315" border="0" cellpadding="0"
			cellspacing="0" background="bg.jpg">
			<form name="form1" method="post" action="index.jsp">
			<tr>
				<td height="35" align="center">
					输入文件名
					<input type="text" name="fileStr" value="${param.fileStr }">
					<input name="submit" type="submit" value="提交">
				</td>
			</tr>
			</form>
			<tr>
				<td width="589" valign="top">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						bordercolor="#FFFFFF" bordercolordark="#FFFFFF"
						bordercolorlight="#AAAAAA">
						<tr>
							<th width="5%" height="34" scope="col"> <br></th>
							<th width="90%" scope="col">文件内容</th>
							<th width="5%" scope="col">&nbsp;</th>
						</tr>
						<tr>
							<td><pre>&nbsp;</pre></td>
							
							<td><%=fileTxt %>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>

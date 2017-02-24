<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lh.dao.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>备份数据库</title>
<style type="text/css">
<!--
.fontStyle1 {
	font-size: 15px;
	line-height: 23px;
	color: #000000;
}
.fontStyle2 {
	font-size: 12px;
	
	color: #666666;
}
-->
</style>
<script type="text/javascript">
	function backup(){
		var obj = document.getElementById("dataBaseName");
		var index = obj.selectedIndex;
		var dbName = obj.options[index].value;
		document.forms.form1.action = "dobackup.jsp?dbName="+dbName;
		document.forms.form1.method="post";
		document.forms.form1.submit();
	}
</script>
</head>
<body class="fontStyle2">

<form id="form1">
	<table align="center" background="bg.jpg" width="800" height="480" border="0">
		<tr>
			<td colspan="3" height="150"></td>
		</tr>
		<tr height="50">
			<td width="200"></td>
			<td width="100" align="right">选择数据库：</td>
			<td>
			
				<select name="dbName" id="dataBaseName" class="fontStyle2">
				<%
					List<String> list = BackupDao.getInstance().getDatabaseName();
							if(list!=null&&list.size()>0){
								for(String databaseName:list){
				%>								
					<option value="<%=databaseName %>"><%=databaseName %></option>
						<%}
					}
				%>
				</select>
			</td>
		</tr>
		<tr height="50">
			<td width="200"></td>
			<td align="right">备份路径及名称：</td>
			<td>
				<input type="text" name="path" id="path" class="fontStyle2" /><font color="red">格式（D:\\data\test.sql）</font>
			</td>
		</tr>
		<tr height="50">
			<td width="200"></td>
			<td  align="right" valign="top">
				<input type="button" value="备 份" onclick="backup()" />
			</td>	
			<td valign="top">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重 置"  />
			</td>
		</tr>
		<tr>
			<td colspan="3" height="50"></td>
		</tr>
		<tr>
			<td colspan="3" height="50"></td>
		</tr>
		<tr>
			<td colspan="3" height="80"></td>
		</tr>
	</table>
</form>
</body>
</html>
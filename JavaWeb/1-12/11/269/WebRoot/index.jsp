<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import = "javax.imageio.*" %>
<%@ page import = "java.awt.image.*" %>
<%@ page import = "java.awt.*" %>
<%@ page import = "java.io.*" %>
<%@ page import="com.lh.dao.PictureDao" %>
<%@ page import="com.lh.model.PictureInfo" %>
<%
		PictureInfo pic = PictureDao.getInstance().getImage() ;
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
		.table1{
			
			font-size: 13px;
			border: 1px solid green;
			
		}
		table{
		
			font-size: 13px;
		}
		.fieldStyle{
			width: 300px;
			height: 160px;
			border: 1px solid green;
		}
	</style>
<script type="text/javascript">
	function getFilePath(){
		var file = document.getElementById("filepath");
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		document.getElementById("pathStr").value = filePath;
	}
	function save(){
		getFilePath();
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "save.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>显示数据库中的图片信息</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="pathStr" id="pathStr">
<input type="hidden" name="checkboxStr" id="checkboxStr">
<table  border="1"  width="400" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="3">【显示数据库中的图片信息】</td>
  </tr>
   <tr height="30">
    <td align="center"> 图片名称：</td>
    <td align="center"> 图片类型：</td>
    <td align="center" rowspan="2">
    
    <img alt="" src="img.jsp">
    </td>
 </tr>
   <tr height="50">
    <td align="center" valign="top"> <%=pic.getPictureName() %></td>
    <td align="center" valign="top"><%=pic.getPictureType() %></td>
    <td align="center" rowspan="2"></td>
 </tr>
</table>
</form>
</body>
</html>

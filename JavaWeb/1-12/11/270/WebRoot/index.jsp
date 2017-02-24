<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
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
<title>读取文件路径到数据库</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="pathStr" id="pathStr">
<input type="hidden" name="checkboxStr" id="checkboxStr">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【读取文件路径到数据库】</td>
  </tr>
   <tr height="50">
    <td align="right"> 选择图片：</td>
    <td>
    	<input name="filepath" id="filepath" type="file" size="50">
   	</td>
 </tr>

  <tr>
    <td height="35" align="center" colspan="2">
    	<input  type="button" onclick="save()" value="保存图片">
    </td>
    </tr>
 
  <tr>
  	<td colspan="2" align="center">
  		
  	</td>
  </tr>
</table>
</form>
</body>
</html>

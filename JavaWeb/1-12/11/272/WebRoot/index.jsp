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
	function getFilePath(file){
		
		var filePath;
		file.select();
		try{
			filePath = document.selection.createRange().text;//获得文件的本地路径
		} 
		finally{
			document.selection.empty();
		}
		
		return filePath;
	}
	function save(){
		var source = document.getElementById("source");
		var target = document.getElementById("target");
		document.getElementById("sourcePath").value = getFilePath(source);
		document.getElementById("targetPath").value = getFilePath(target);
		document.getElementById("flag").value="1";
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "save.jsp";
		document.getElementById("form1").submit();
	}
	function save1(){
		var source = document.getElementById("source");
		var target = document.getElementById("target");
		document.getElementById("flag").value="2";
		document.getElementById("sourcePath").value = getFilePath(source);
		document.getElementById("targetPath").value = getFilePath(target);
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "save.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>文件加密解密</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="sourcePath" id="sourcePath">
<input type="hidden" name="targetPath" id="targetPath">
<input type="hidden" name="flag" id="flag">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【文件简单加密解密】</td>
  </tr>
   <tr height="40">
    <td align="right"> 选择文件：</td>
    <td>
    	<input name="source" id="source" type="file" size="40">
   	</td>
 </tr>
 <tr height="40">
    <td align="right"> 保存地址：</td>
    <td>
    	<input name="target" id="target" type="file" size="40">
   	</td>
 </tr>
  <tr>
    <td height="35" align="center" colspan="2">
    	<input id="submit1" type="button" onclick="save()" value="文件加密">
    	&nbsp;&nbsp;&nbsp;
    	<input id="submit2" type="button" onclick="save1()" value="文件解密">
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

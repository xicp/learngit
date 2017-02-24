<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	function splitFile(){
		var source = document.getElementById("source");
		document.getElementById("sourcePath").value = getFilePath(source);
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "save.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>文件分割</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="sourcePath" id="sourcePath">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【文件分割】</td>
  </tr>
   <tr height="40">
    <td align="right"> 源文件：</td>
    <td>
    	<input name="source" id="source" type="file" size="30" />
   	</td>
 </tr>
 <tr height="40">
    <td align="right"> 分割大小：</td>
    <td>
    	<input name="fileSize" id="fileSize" type="text" size="10" />MB
   	</td>
 </tr>
  <tr height="40">
    <td align="right"> 保存路径：</td>
    <td>
    	<input name="savePath" id="savePath" type="text" />格式为：D:\test
   	</td>
 </tr>
  <tr height="40">
    <td align="center" colspan="2">
    	<input type="button" value="分 割" onclick="splitFile()" />&nbsp;&nbsp;&nbsp;
    	<input type="reset" value="重 置" />
   	</td>
 </tr>
  
</table>
</form>
</body>
</html>

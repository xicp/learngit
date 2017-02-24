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
	function uniteFile(){
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "save.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>文件合并</title>
<body>
<form id="form1" method="post">
<table width="400"  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【文件合并】</td>
  </tr>
   <tr height="40">
   	<td align="right">
    	文件路径：
   	</td>
   	 <td  >
    	<input type=text name="filePath" value="E:\test" />
   	</td>
 	</tr>
   <tr height="40">
   	<td align="right" valign="top"></td>
    <td >
    	
   	</td>
 </tr>
 <tr height="40">
   	<td align="right">
    	文件合并后的路径：
   	</td>
   	 <td >
    	<input type=text name="savePath" />
   	</td>
 </tr>
  <tr height="40">
    <td align="center" colspan="2">
    	<input type="button" value="合 并" onclick="uniteFile()" />
   	</td>
 </tr>
  
</table>
</form>
</body>
</html>

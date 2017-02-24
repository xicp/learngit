<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.SerializeObject"  %>
<%
	String filePath = request.getParameter("path");
	Object []obj = new Object[5];
	if(filePath!=null&&!filePath.equals("")){
		SerializeObject.serialize(filePath);
		obj = SerializeObject.deserialize(filePath);
	}
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
	function serialize(){
		var source = document.getElementById("filePath");
		document.getElementById("path").value = getFilePath(source);
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "index.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>对象的序列化与反序列化</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="path" id="path">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【对象的序列化与反序列化】</td>
  </tr>
   <tr height="40">
    <td align="right"> 文件地址：</td>
    <td>
    	<input name="filePath" id="filePath" type="file" size="30" />
   	</td>
 </tr>
 <tr height="40">
    <td colspan="2" align="center">
    	<textarea rows="5" cols="40">实现对象反序列化，读取的内容为：
<%=obj[0] %>
<%=obj[1] %>
    	</textarea>
   	</td>
 </tr>
  <tr height="40">
    <td align="center" colspan="2">
    	<input type="button" value="序列化" onclick="serialize()" />&nbsp;&nbsp;&nbsp;
   	</td>
 </tr>
  
</table>
</form>
</body>
</html>

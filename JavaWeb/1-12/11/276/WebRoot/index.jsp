<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"  %>
<%@ page import="com.lh.util.StatUtil" %>
<%
	request.setCharacterEncoding("UTF-8");
	String filePath = request.getParameter("sourcePath");
	int count[]=new int[4];
	if(filePath!=null&&!filePath.equals("")){
		count = StatUtil.statis(filePath);
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
	function stat(){
		var source = document.getElementById("filePath");
		document.getElementById("sourcePath").value = getFilePath(source);
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "index.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>利用StreanTokenizer统计文件字符数</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="sourcePath" id="sourcePath">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【统计txt文件字符数】</td>
  </tr>
   <tr height="40">
    <td align="right"> 选择文件：</td>
    <td>
    	<input name="filePath" id="filePath" type="file" size="30" onchange="stat()"/>
   	</td>
 </tr>
 <tr height="40" align="center">
 
    <td align="left" colspan="2"> 统计结果如下：<br/>
    	数字总数为：<%= count[0]%><br/>
    	文字总数为：<%=count[1] %><br/>
    	其他标记为：<%=count[2] %><br/>
    	总字符数为：<%=count[3] %><br/>
    </td>
 </tr> 
</table>
</form>
</body>
</html>

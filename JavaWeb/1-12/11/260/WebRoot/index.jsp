<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>

<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<%@ page import="com.lh.util.ReplaceFile" %>
<%
	request.setCharacterEncoding("UTF-8");
	String filePath = request.getParameter("pathStr");	//获取文件路径字符串
	String sourceStr = request.getParameter("sourceStr");//获取文件扩展名字符串
	String targetStr = request.getParameter("targetStr");//获取文件扩展名字符串
	boolean res =false;
	if(filePath!=null&&sourceStr!=null&&targetStr!=null){
		
		res = ReplaceFile.replaceFileStr(filePath,sourceStr,targetStr);//调用替换文本的方法 
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
		var extendName = filePath.substring(filePath.lastIndexOf("."));
		if(extendName==".txt"){
			document.getElementById("pathStr").value = filePath;
			document.getElementById("form1").method="post";
			document.getElementById("form1").action = "index.jsp";
			document.getElementById("form1").submit();
		}
		else{
			alert("请选择txt文本文件！");
			return ;
		}
		
	}	
</script>
</head>		
<title>查找替换文本文件内容</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="pathStr" id="pathStr">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【查找替换文本文件内容】</td>
  </tr>
   <tr>
    <td align="right"> 选择文本文件：</td>
    <td>
    	<input name="filepath" id="filepath" type="file" value="${param.pathStr }">
   	</td>
  <tr>
    <td align="right"> 搜索文本：</td>
    <td>
    	<input name="sourceStr" type="text" value="${param.sourceStr }">
   		<font size="2" color="red"></font> 
   	</td>
  </tr>
   <tr>
    <td align="right">替换为：</td>
    <td> <input name="targetStr" type="text" value="${param.targetStr }"></td>
  </tr>
  <tr>
    <td align="center" colspan="2">
    	<%
    		if(res){
    			out.println("替换成功！");
    		}
    	 %>
    </td>
   
  </tr>
  <tr>
    <td height="35" align="center" colspan="2">
    	<input  type="button" onclick="getFilePath()" value="提 交">
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

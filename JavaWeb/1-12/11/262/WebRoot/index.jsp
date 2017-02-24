<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>

<%@ page import="com.lh.util.FileAttributeUtil" %>
<%
	request.setCharacterEncoding("UTF-8");
	String filePath = request.getParameter("pathStr");	//获取文件路径字符串
	FileAttributeUtil fileAttr = new FileAttributeUtil();
	if(filePath!=null&&!filePath.equals("")){
		fileAttr.setFileAttribute(filePath);
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
		document.getElementById("pathStr").value = filePath;
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "index.jsp";
		document.getElementById("form1").submit();
	}
		
	function getCheckboxValue(){
		var readBox = document.getElementById("read");		//只读属性
		var hiddenBox = document.getElementById("hidden");	//隐藏属性
		var docBox = document.getElementById("doc");		//归档属性
		var sysBox = document.getElementById("sys");		//系统属性
		var str="";
		if(readBox.checked){
			str+=" +r";//只读属性命令 
		}else{
			str+=" -r";
		}
		if(hiddenBox.checked){
			str+=" +h";//隐藏属性命令 
		}else {
			str+=" -h";
		}
		if(docBox.checked){
			str+=" +a";//归档属性命令 
		}else{
			str+=" -a";
		}
		if(sysBox.checked){
			str+=" +s";//系统属性命令 
		}else {
			str+=" -s";
		}
		return str;
	}
	function save(){
		document.getElementById("checkboxStr").value=getCheckboxValue();
		document.getElementById("form1").method="post";
		document.getElementById("form1").action = "save.jsp";
		document.getElementById("form1").submit();
	}
</script>
</head>		
<title>设置Windows的文件属性</title>
<body>
<form id="form1" method="post">
<input type="hidden" name="pathStr" id="pathStr" value="<%=fileAttr.getFilePath() %>">
<input type="hidden" name="checkboxStr" id="checkboxStr">
<table  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.gif"> 
  <tr>
    <td height="54" align="center" colspan="2">【设置Windows的文件属性】</td>
  </tr>
   <tr height="50">
    <td align="right"> 选择文本文件：</td>
    <td>
    	<input name="filepath" id="filepath" type="file" value="${param.pathStr }" onchange="getFilePath()">
   	</td>
 </tr>
 <tr  height="50">
 	<td colspan="2" >	
 		文件名称：<%=fileAttr.getFileName() %><br/>
 		文件路径：<%=fileAttr.getFilePath() %>
 	</td>
 </tr>
 <tr>
 	<td colspan="2" align="center">	
 	
 		<input type="checkbox" id="read" value="read" 
 		<%if(fileAttr.isRead()){out.println("checked='checked'");} %> />只读
 		<input type="checkbox" id="hidden" value="hidden" 
 		<%if(fileAttr.isHidden()){out.println("checked='checked'");} %> />隐藏
 		<input type="checkbox" id="doc" value="doc"
 		<%if(fileAttr.isDoc()){out.println("checked='checked'");} %>/>归档
 		<input type="checkbox" id="sys" value="sys"
 		<%if(fileAttr.isSys()){out.println("checked='checked'");} %>/>系统
 	</td>
 </tr>
  <tr>
    <td height="35" align="center" colspan="2">
    	<input  type="button" onclick="save()" value="提 交">
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

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="com.lh.dao.*" %>
<%@ page import="com.lh.util.*" %>

<%
	List<Object []> filePaths = null;
	request.setCharacterEncoding("UTF-8");//设置请求编码
	String filePath = request.getParameter("filepath");//获取文件夹路径
	String key = request.getParameter("key");//获取关键字
	if(filePath!=null&&!filePath.equals("")){//判断是否为空
		FileUtil.createFileIndex(new File(filePath));//调用创建文件索引的方法
		filePaths = FileUtil.searchFilePathByKey(key);//调用文件查询的方法
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
</head>		
<title>在数据库中建立磁盘文件索引</title>
<body>
<form id="form1" method="post" action="index.jsp">
<input type="hidden" name="pathStr" id="pathStr">
<table width="400"  border="0" cellpadding="0" cellspacing="0" class="table1" background="bg.jpg"> 
  <tr>
    <td height="54" align="center" colspan="2">【在数据库中建立磁盘文件索引】</td>
  </tr>
   <tr height="50">
    <td colspan="2" align="center">文件地址：
    	<input name="filepath" id="filepath" type="text" 
    		value="<%if(filePath!=null&&!filePath.equals("")){out.println(filePath);} %>" />
    </td>
  
 </tr>
 <tr>
    <td height="35" colspan="2" align="center">
    
    	<textarea rows="5" cols="30" id="fileIndex"><%
    		if(filePaths!=null){
    			for(Object[] row:filePaths){
    				out.println(row[1]);
    			}
    		}
    	 %></textarea>
    </td>
    </tr>
    <tr >
	  	<td height="35"  align="center">输入关键字：
	  		<input type="text" name="key" id="key" 
	  			value="<%if(key!=null&&!key.equals("")){out.println(key);} %>"/>
	  	</td>
    </tr>
  <tr>
    <td height="35"  colspan="2" align="center">
    	<input  type="submit"  value="开始搜索">
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

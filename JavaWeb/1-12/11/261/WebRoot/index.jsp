<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.lh.util.FolderUtil" %>
<%@ page import="java.io.*"%>
<%
	request.setCharacterEncoding("UTF-8");//设置请求编码
	String filepath1 = request.getParameter("createDir");//获取表单的创建文件夹路径
	String filepath2 = request.getParameter("deleteDir");//获取表单的删除文件夹路径
	String submit = request.getParameter("Submit");//获取提交按钮值 
	boolean createRes = false;//声明创建文件夹是否成功的变量 
	boolean delRes = false;//声明删除文件夹是否成功的变量 
	if(filepath1!=null&&!filepath1.equals("")){//判断是否为空
		if(submit!=null&&submit.equals("创建文件夹")){//判断是否为"创建文件夹"的按钮 
			createRes =FolderUtil.createFolder(filepath1);//调用方法创建文件夹
		}
	}
	if(filepath2!=null&&!filepath2.equals("")){//判断是否为空
		if(submit!=null&&submit.equals("删除文件夹")){//判断是否为"删除文件夹"的按钮
			delRes =FolderUtil.deleteFolder(filepath2);//调用方法删除文件夹 
		}
	}
 %>
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <title>对文件夹创建、删除的操作</title>
  <body>
  <form name="form1" method="post" action="index.jsp">
    <table width="300" height="247" cellpadding="0" cellspacing="0" background="bg.jpg">
      <tr align="center">
        <td height="60" colspan="2"> <br></td>
      </tr>
	  <tr>
        <th colspan="2" scope="col">创建文件夹</th>
      </tr>
      <tr>
        <td width="38%" align="center">文件夹的路径</td>
        <td width="62%"><input name="createDir" type="text" value="<%if(filepath1!=null){out.println(filepath1);} %>"></td>
      </tr>
      <tr align="center">
        <td colspan="2"><input type="submit" name="Submit" value="创建文件夹">
      		<%
      			if(createRes){
      				out.println("文件夹创建成功！");
      			}
      		 %>
        </td>
      </tr>
      <tr align="center">
        <th colspan="2"><hr></th>
      </tr>
      <tr>
        <th colspan="2" align="center">删除文件夹</th>
      </tr>
      <tr>
        <td align="center">文件夹的路径</td>
        <td><input name="deleteDir" type="text" value="<%if(filepath2!=null){out.println(filepath2);} %>"/></td>
      </tr>
      <tr align="center">
        <td colspan="2"><input name="Submit" type="submit" id="Submit" value="删除文件夹">
   		<%
      		if(delRes){
      			out.println("文件夹删除成功！");
      		}
      	%>
   		</td>
      </tr>
      <tr align="center">
        <td height="50" colspan="2">&nbsp;</td>
      </tr>
    </table>
  </form>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>检查表单元素的值是否为空</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function check(){
		var myform = document.getElementById("myform");		//获得form表单对象
		for(var i=0;i<myform.length;i++){		//循环form表单
			if(myform.elements[i].value==""){	//判断每一个元素是否为空
				alert(myform.elements[i].title+"不能为空！");
				myform.elements[i].focus();		//元素获得焦点
				return ;
			}
		}
		myform.submit();
	}
	</script>
	<style type="text/css">
		table{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
		
	
		}
		input{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
		}
		font{
			font-size: 12px;
			font-family: 楷体;
			color:orangered;
		}
		.style1{
			width: 500;
			height: 300;
		}
	</style>
  </head>
  
  <body>
    <fieldset class="style1"><legend>留言薄</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>留言人：</td>
   			<td>
   				<input type="text" name="messageUser" id="messageUser" title="留言人"> 			
   			</td>
   		</tr>
   		<tr>
   			<td>留言标题：</td>
   			<td>
   				<input type="text" name="messageTitle" id="messageTitle" title="留言标题"> 			
   			</td>
   		</tr>
   		<tr>
   			<td>留言内容：</td>
   			<td>
   				<textarea rows="8" cols="45" id="messageContent" title="留言内容"></textarea>
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="2">
   				<input type="button" value="提 交" onclick="check()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>通过正则表达式验证日期</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function CheckDate(str){
		var Expression=/^((((1[6-9]|[2-9]\d)\d{2})(\/|\-)(0?[13578]|1[02])(\/|\-)(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})(\/|\-)(0?[13456789]|1[012])(\/|\-)(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})(\/|\-)0?2(\/|\-)(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/; 
		var objExp=new RegExp(Expression);
		if(objExp.test(str)==true){
			return true;
		}else{
			return false;
		}
	}
	
	function check(){
		var mydate = document.getElementById("mydate"); //获得日期文本框对象 
		if(mydate.value==""){							//判断输入的日期是否为空
			alert("请输入日期！");
			mydate.focus();								//使文本框获得焦点
			return;
		}		
		if(!CheckDate(mydate.value)){					//验证日期格式是否正确 
			alert("您输入的日期不正确，请注意日期格式！");
			mydate.focus();
			return;
		}
		document.getElementById("dateForm").submit();	
	}
	</script>
	<style type="text/css">
		table{
			font-size: 13px;
			font-family: 楷体;
			color:navy;
			border: 1px solid;
			border-color: olive;
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
	</style>
  </head>
  
  <body>
   <form action="" id="dateForm">
   	<table>
   		<tr>
   			<td>请输入日期：</td>
   			<td>
   				<input type="text" name="mydate" id="mydate">
   				<font>
   					格式为：2010/06/17或2010-06-17
   				</font>
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="2">
   				<input type="button" value="验 证" onclick="check()">
   				
   			</td>
   		</tr>
   	</table>
   </form>
  </body>
</html>

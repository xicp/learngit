<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>限制Textarea文本域内容的长度</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 	
	
		function limitTextarea(){
			var max=20;//最多可输入20个字符，中文占2个字节 
			var areaStr = document.getElementById("str").value;
			var temp=0;
			for(var i=0;i<areaStr.length;i++){		//可能包含中文，需要循环判断 
				var code = areaStr.charCodeAt(i);	//转换为Unicode值 
				if(code>255){						//大于255的为中文字符
					temp=temp+2;
				}
				else{
					temp=temp+1;
				}
				if(temp>max){						//如果字符长度超过指定长度，跳出循环 
					break;
				}
			}	
			document.getElementById("str").value=areaStr.substring(0,i);
			document.getElementById("now_len").innerHTML = temp;//当前输入的字符长度
			document.getElementById("remainder_len").innerHTML = max-temp;//剩余字符长度	
			
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
			width: 500px;
			height: 160px;
		}
	</style>
  </head>
  
  <body onload="limitTextarea()" >
    <fieldset class="style1"><legend>留言薄</legend>
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>留言内容： 
   				<font>最多可输入20个字符。</font>
   			</td>
   		</tr>	
   		<tr>
   			<td>
   			
   				<textarea name="s1" rows="5" cols="40" id="str"  onkeyup="limitTextarea()" onkeydown="limitTextarea()"></textarea>
   			</td>
   		</tr>
   		<tr>
   			<td align="right">
   				<font>
   				
   					当前字数：<span  id="now_len"  /></span>&nbsp;&nbsp;剩余字数：<span id="remainder_len" ></span>
   				</font>
   			</td>
   		</tr>  
   		<tr>
   			<td >
   				<input type="button" value="留 言" >
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

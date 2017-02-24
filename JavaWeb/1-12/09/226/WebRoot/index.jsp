<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>把一个长数字分位显示</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 

function compart(lang_num){
	var result=0;	//保存分位后的结果 
	var dec="";		//保存小数点后的数字 
	if(lang_num<4){	//如果小于4位，直接返回 
		result = lang_num;
	}
	else{			//如果大于4位 
		var decimal = lang_num.indexOf(".");	//是否包含小数 
		var temp="";//保存整数部分的分位字符串 
		var res="";	//保存没有分位的整数 
		if(decimal>0){//如果包含小数 
			dec=lang_num.substr(decimal);		//截取小数点后的值
			res=lang_num.substr(0,decimal);		//截取小数点前的整数值
		}else{		//如果不存在小数部分 
			res=lang_num;
		}
		for(var i=res.length;i>0;i=i-3){	//循环整数 ，从整数的个位开始循环 
			if(i-3>0){	//每隔3位加一个逗号 
				temp=","+res.substr(i-3,3)+temp;
			}
			else{		//少于3位时的情况 
				temp=res.substr(0,i)+temp
			}
		}
		result =temp+dec;
	}
	return result;
}
	
		function convert(){
			var lang_number = document.getElementById("lang_number").value;
			if(lang_number==""){
				alert("请输入数字！");
				document.getElementById("lang_number").focus();
				return;
			}
			if(isNaN(lang_number)){
				alert("您输入的数字无效！");
				document.getElementById("lang_number").focus();
				return;
			}
			document.getElementById("result_num").value = compart(lang_number);
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
  
  <body>
    <fieldset class="style1"><legend>长数字分位显示</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入要转换的长数字：</td>
   		</tr>	
   		<tr>
   			<td>
   				<input type="text"  id="lang_number" size="30"> 	
   			</td>
   		</tr>
   		<tr>
   			<td>转换结果：</td>
   		</tr>  
   		
   		<tr>
   			<td>
   				<input type="text"  id="result_num" size="30"/>
   			</td>
   		</tr>
   		
   		<tr>
   			<td  align="center">
   				<input type="button" value="转 换" onclick="convert()">
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

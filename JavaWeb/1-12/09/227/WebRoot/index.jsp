<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>将RGB颜色值转换为16进制</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 

function toHex(r,g,b){
	//如果R、G、B的值为空，修改为0
	if(r==""){
		r=0;
	}
	if(g==""){
		g=0;
	}
	if(b==""){
		b=0;
	}
	var red = parseInt(r).toString(16);		//R值的16进制字符串
	if(red.length<2){						//少于2位 ， 补0
		red="0"+red;
	}
	var green = parseInt(g).toString(16);	//G值的16进制字符串
	if(green.length<2){						//少于2位 ， 补0
		green="0"+green;
	}
	var blue = parseInt(b).toString(16);	//B值的16进制字符串
	if(blue.length<2){						//少于2位 ， 补0
		blue="0"+blue;
	}
	return "#"+red+green+blue;				//组合成一个RGB颜色字符串 
}
	
		function convert(){
			var R = document.getElementById("r_value").value;
			var G = document.getElementById("g_value").value;
			var B = document.getElementById("b_value").value;
			if(isNaN(R)){
				alert("您输入的(R)颜色值必须为0-255之间的数字！");
				return ;
			}else{
				if(R>255){
					alert("请输入0-255之间的数字！");
					return;
				}
			}	
			if(isNaN(G)){
				alert("您输入的(G)颜色值必须为0-255之间的数字！");
				return ;
			}else{
				if(G>255){
					alert("请输入0-255之间的数字！");
					return;
				}
			}
			if(isNaN(B)){
				alert("您输入的(B)颜色值必须为0-255之间的数字！");
				return ;
			}else{
				if(B>255){
					alert("请输入0-255之间的数字！");
					return;
				}
			}
			document.getElementById("hex_num").value = toHex(R,G,B);
			
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
    <fieldset class="style1"><legend>RGB颜色值转换</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入要转换的RGB颜色分量值：</td>
   		</tr>	
   		<tr>
   			<td>
   				R:<input type="text"  id="r_value" size="8"><font>(0-255)</font> <br>	
   				G:<input type="text"  id="g_value" size="8"><font>(0-255)</font><br/>
   				B:<input type="text"  id="b_value" size="8"><font>(0-255)</font>		
   			</td>
   		</tr>
   		<tr>
   			<td>转换后十六进制的颜色值：</td>
   		</tr>  
   		
   		<tr>
   			<td>
   				<input type="text"  id="hex_num" size="30"/>
   			</td>
   		</tr>
   		
   		<tr>
   			<td  align="center">
   				<input type="button" value="转 换" onclick="convert()">
   				<input type="reset" value="重 置" >
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

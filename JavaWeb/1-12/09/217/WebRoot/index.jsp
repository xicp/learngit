<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证数量和金额</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkInsert(){
		var number = document.getElementById("number");	//数量文本框对象
		var price = document.getElementById("price");	//单价文本框对象
		var regExp2 = /^[1-9]+(\d*)$/;					//验证数量的正则表达式
		if(isNaN(price.value)){							//验证单价是否为数字
			alert("您输入的单价不是有效值！");
			price.focus();
			return false;
		}
		if(number.value!=null&&number.value!=""){
			if(!regExp2.test(number.value)){			//验证数量是否符合正则表达式
				alert("数量必须为正整数！");
				number.focus();
				return false;
			}
		}
		return true;
	}
	
	function save(){
		if(checkInsert()){
			document.getElementById("myform").submit();
		}
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
			height: 260px;
		}
	</style>
  </head>
  
  <body>
    <fieldset class="style1"><legend>添加采购信息</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>采购单号：</td>
   			<td>
   				<input type="text"  > 			
   			</td>
   		</tr>	
   		<tr>
   			<td>商品名称：</td>
   			<td>
				<input type="text"  />
   			</td>
   		</tr>
   		<tr>
   			<td>生产厂家：</td>
   			<td>
				<input type="text" />
   			</td>
   		</tr>
   		<tr>
   			<td>规格：</td>
   			<td>
   				<input type="text"  >
   			</td>
   		</tr>
   		<tr>
   			<td>单价：</td>
   			<td>
				<input type="text" id="price"/>元
   			</td>
   		</tr>
   		<tr>
   			<td>数量：</td>
   			<td>
				<input type="text" id="number"/>
   			</td>
   		</tr>		
   		<tr>
   			<td align="center" colspan="2">
   			
   				<input type="button" value="保 存" onclick="save()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

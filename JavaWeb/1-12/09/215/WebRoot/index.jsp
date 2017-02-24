<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>验证车牌号码是否有效</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script language="javascript"> 
	
	function checkNumberPlate(){
		var date =new Date();
		alert(date.getYear());
		var numberPlate = document.getElementById("numberPlate"); 
		var shortProvince = new Array ("京","沪","津","渝","冀","晋","蒙",
		"辽","吉","黑","苏","浙","皖","闽","赣","鲁","豫","鄂","湘","粤","桂",
		"琼","川","贵","云","藏","陕","甘","青","宁","新");
		if(numberPlate.value==""||numberPlate.value==null){//验证是否为空 
			alert("请输入车牌号码！");
			numberPlate.focus();
			return;
		}
		var str = numberPlate.value.substring(0,1);	//截取车牌号的首字符 
		var res = false;
		for(var i=0;i<shortProvince.length;i++){	//循环判断输入的车牌号首字符是否在指定的省份内 
			if(str==shortProvince[i].toString()){
				res = true;							//在指定简写省份名称范围内 
			}
		}	
		//验证普通的车牌号码 ： 吉A-E1234,吉A-EE123,吉A-12345,吉A-6A123
		var regExpression1 = /^[\u4e00-\u9fa5][a-zA-Z]-[0-9A-Za-z]{3}\d{2}$/;
		//验证车牌号尾号为字母的表达式 
		var regExpression2 = /^[\u4e00-\u9fa5][a-zA-Z]-\d{4}[a-zA-Z]$/;
		if(!regExpression1.test(numberPlate.value)&&!regExpression2.test(numberPlate.value)){
			alert("您输入的车牌号码有误！");
			numberPlate.focus();
			return;
		}else{//如果符合规则 ，判断首字符是否为各省级名称的简写 
			if(!res){
				alert("您输入的车牌号码有误，首字符无效！");
				numberPlate.focus();
				return;
			}
		}
		document.getElementById("myform").submit();	
	}
	function aa(){
		var brand = document.getElementById("brand").value;
		document.getElementById("brand").value=brand.replace(/^[\u4e00-\u9fa5]$/g,"");
	
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
			height: 260;
		}
	</style>
  </head>
  
  <body>
    <fieldset class="style1"><legend>添加车辆信息</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>车牌号码：</td>
   			<td>
   				<input type="text"  id="numberPlate"> 			
   			</td>
   		</tr>	
   		<tr>
   			<td>车辆类型：</td>
   			<td>
				<select>
					<option> 请选择 </option>
					<option>大货车</option>
					<option>小货车</option>
					<option>轿车</option>
					<option>其他</option>
				</select>
   			</td>
   		</tr>
   		
   		<tr>
   			<td>车辆品牌：</td>
   			<td>
   				<input type="text" id="brand" onpropertychange="aa()">
   			</td>
   		</tr>
   		<tr>
   			<td>备注：</td>
   			<td>
   				<textarea rows="5" cols="30"></textarea>
   			</td>
   		</tr>
   		<tr>
   			<td align="center" colspan="2">
   			
   				<input type="button" value="提 交" onclick="checkNumberPlate()">
   				
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

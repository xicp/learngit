<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>小写金额转换为大写</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		table{
			font-size: 12px;
			color: gray;
			border: 1px solid;
			border-color: green
		}
		input{
			font-size:12px;
			color: gray;
		}
	</style>
	<script language="javaScript"> 

	function convert(){
		var money_num = document.getElementById("money_num").value;
		if(money_num==""){
			alert("请输入金额！");
			document.getElementById("money_num").focus();
			return;
		}
		if(isNaN(money_num)){
			alert("请输入数字类型的金额 !");
			return;
		}
		if(money_num>999999999999){
			alert("您输入的金额不能大于999999999999!");
			return;
		}
		//将小数点后保留两位小数
		if(money_num.indexOf(".")>0){
			var decimalStr = money_num.split(".");
			if(decimalStr[1].length>2){
				decimalStr[1]=decimalStr[1].substr(0,2);
			}
			money_num = decimalStr[0]+"."+decimalStr[1];
		}
		value=change(money_num); //调用自定义函数转换
		document.getElementById("money_cn").value=value;  //将转换后的值赋给文本框
	}
	
	function change(str){
		je="零壹贰叁肆伍陆柒捌玖";			//大写的数字（0-9）
		cdw="万仟佰拾亿仟佰拾万仟佰拾元角分";	//金额单位
		var newstring=(str*100).toString();	//将金额值乘以100
		newstringlog=newstring.length;		//乘以100之后的金额的长度
		newdw=cdw.substr(cdw.length-newstringlog);
		num0=0;     	//记录零的个数
		wan=0;     		//记录万位出现的次数
		dxje="";     	//记录大写金额
		for(m=1;m<newstringlog+1;m++){
			xzf=newstring.substr(m-1,1);   
			dzf=je.substr(xzf,1);
			dw=newdw.substr(m-1,1);
			if(dzf=="零"){
				dzf="";
			if(dw=="亿"){
			}else if(dw=="万"){
				dzf="";
				wan=1; 
			}else if(dw=="元"){
 
			}else{
				dw="";	//记录单位		
			}
			num0=num0+1;
			}else{
				if(num0-wan>0){
					if(dw!="角"){
					dzf="零"+dzf;
					}
				}
				num0=0;
 
			}
			dxje=dxje+dzf+dw;
		}
		if(newstring.length!=1){
			if(newstring.substr(newstring.length-2)=="00"){
				dxje=dxje+"整";
			}else{
				dxje=dxje;
			}
		}
		return dxje;
	} 	
</script>
  </head>
  
  <body>
  
	<form action="convert.jsp" method="post">
		<table>
			<tr>
				<td align="center" bgcolor="skyblue"> 请输入金额</td>
			</tr>
			<tr height="25">
				<td bgcolor="yellow"> 
					金额：<input type="text" name="money" id="money" />
					<input type="submit" value="转 换">
				</td>
			</tr>
		</table>
	</form>
  </body>
</html>

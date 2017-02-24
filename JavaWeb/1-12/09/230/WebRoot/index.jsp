<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计算两个日期相差的小时数</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script language="javascript"> 
	function checkDate(dateStr){
		if(dateStr==""||dateStr==null){
			return false;
		}
		else{
			if(dateStr.indexOf("-")!=-1){
				var dateArr = dateStr.split("-");
				var year = dateArr[0];	//提取年份
				var month = dateArr[1];	//提取月份
				var day = dateArr[2];	//提取日
				//如果年份、月份、日期 不是数字或者<=0，返回false
				if(isNaN(year)||year<=0){					
					return false;
				}
				if(isNaN(month)||month<=0||month>12){	
					return false;
				}
				if(isNaN(day)||day<=0||day>31){
					return false;
				}
				//年份能被4整除并且不能被100整除，或者能被400整除，则为闰年
				if((year%4==0&&year%100!=0)||(year%400==0)){
					if(month==2){//闰年的2月 
						if(day>29){
							return false;
						}
					}
				}else{//不是闰年的2月 
					if(month==2){
						if(day>28){
							return false;
						}
					}
				}
				//1、3、5、7、8、10、12月份为31天 
				var m1 = new Array(1,3,5,7,8,10,12);
				for(var i=0;i<m1.length;i++){
					if(parseInt(month)==m1[i]){
						if(day>31){
							 return false;
						}
					}
				}
				//4、6、9、12月份为31天 
				var m2 = new Array(4,6,9,11);
				for(var j=0;j<m2.length;j++){
					if(parseInt(month)==m2[j]){
						if(day>30){
							 return false;
						}
					}
				}
			}else{
				return false;
			}
		}
		return true;
	}
		/**
		*计算两个日期相差的小时数 
		*@date1：日期类型的字符串（yyyy-mm-dd） 
		*@date2：日期类相的字符串 （yyyy-mm-dd）
		*@return：返回两个日期相差的小时数  
		*/
		function getMinusHours(date1,date2){
			var date1Str = date1.split("-");//将日期字符串分隔为数组，数组元素分别为年、月、日  	
			//根据年、月、日的值创建Date对象
			var date1Obj = new Date(date1Str[0],(date1Str[1]-1),date1Str[2]);
			var date2Str = date2.split("-");
			var date2Obj = new Date(date2Str[0],(date2Str[1]-1),date2Str[2]);
			var t1 = date1Obj.getTime();//返回从1970-1-1开始计算到Date对象中的时间之间的毫秒数
			var t2 = date2Obj.getTime();//返回从1970-1-1开始计算到Date对象中的时间之间的毫秒数
			var datetime=1000*60*60*24;	//一天时间的毫秒值 
			var minusDays = Math.floor(((t2-t1)/datetime));//计算出两个日期天数差 
			var days = Math.abs(minusDays);	//如果结果为负数，取绝对值
			var minusHours = days*24;		
			return minusHours;
		}
		
		function check(){
			var start_date = document.getElementById("start_date").value;
			var end_date = document.getElementById("end_date").value;
			if(start_date==""){
				alert("请输入开始日期！");
				return;
			}
			else{
				if(!checkDate(start_date)){
					alert("您输入的开始日期无效！");
					return;
				}
			}
			if(end_date==""){
				alert("请输入终止日期！");
				return;
			}else{
				if(!checkDate(end_date)){
					alert("您输入的终止日期无效！");
					return;
				}
			}
			document.getElementById("minus_hour").value = getMinusHours(start_date,end_date);
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
    <fieldset class="style1"><legend>计算两个日期的小时差</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入开始日期：<input type="text"  id="start_date" >	</td>
   		</tr>	
   		
   		<tr>
   			<td>请输入终止日期：<input type="text"  id="end_date" ></td>
   		</tr>	
   		<tr>
   			<td align="center">
   				<font>（格式为：YYYY-MM-DD）</font>	
   			</td>
   		</tr>
   		<tr>
   			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;相差：<input type="text"  id="minus_hour" size="8" >小时</td>
   		</tr>
   		<tr>
   			<td  align="center">
   				<input type="button" value="计 算" onclick="check()">
   		
   			</td>
   		</tr>
   	</table>
   	
   </form>
   </fieldset>
  </body>
</html>

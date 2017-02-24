<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>计算某一天是星期几</title>
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
		*计算某一天是星期几
		*@date：日期类型的字符串（yyyy-mm-dd） 
		*@return：返回星期值   
		*/
		function getWeekByDate(date){
			var dateStr = date.split("-");//将日期字符串分隔为数组，数组元素分别为年、月、日  	
			//根据年、月、日的值创建Date对象
			var dateObj = new Date(dateStr[0],(dateStr[1]-1),dateStr[2]);
			var weeks = ["星期日","星期一","星期二","星期三","星期四","星期五","星期六"];
			return weeks[dateObj.getDay()];
		}
		
		function check(){
			var date = document.getElementById("date").value;
			if(date==""){
				alert("请输入日期！");
				return;
			}
			else{
				if(!checkDate(date)){
					alert("您输入的日期无效！");
					return;
				}
			}
			document.getElementById("dateStr").innerHTML="&nbsp;&nbsp;"+date+"是：";
			document.getElementById("week").value = getWeekByDate(date);
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
    <fieldset class="style1"><legend>计算某一天是星期几</legend>
    
   <form action="" id="myform">
   	<table align="center">
   		<tr>
   			<td>请输入一个日期：<input type="text"  id="date" ><font>（格式为：YYYY-MM-DD）</font>	</td>
   		</tr>	
   		<tr>
   			<td>
   			<span id="dateStr">&nbsp;&nbsp;今天是星期几：</span>
   			<input type="text"  id="week" size="8" ></td>
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

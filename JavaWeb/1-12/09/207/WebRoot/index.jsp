<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title> 验证输入的日期是否正确</title>
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
		var mydate = document.getElementById("mydate");
		if(dateStr==""||dateStr==null){
			return false;
		}
		else{
			if(dateStr.indexOf("-")!=-1){
				var dateArr = dateStr.split("-");
				var year = dateArr[0];//提取年份
				var month = dateArr[1];//提取月份
				var day = dateArr[2];//提取日
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
	
	function check(){
		var mydate = document.getElementById("mydate");
		if(checkDate(mydate.value)){
			document.getElementById("dateForm").submit();
		}else{
			if(mydate.value==""||mydate.value==null){
				alert("请输入日期！");
				mydate.focus();	//日期文本框获得焦点
				return ;
			}
			mydate.focus();
			alert("您输入的日期格式不正确！");
		}
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

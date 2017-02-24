<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>数组转换为字符串</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<style type="text/css">
		table{
			border: 1px solid;
			border-color: green;
			font-family:华文行楷;
			font-size: 15px;
			color:white;
			background-color: gray;
		}
	</style>
  </head>
  
  <body>
  
     <%
      	int month[] =new int[12];			//创建一个月份的数组
      	for(int i=0;i<month.length;i++){	//通过循环给月份数组的元素赋值 
      		month[i] = i+1;
      	}
     %> 
     <!-- 使用useBean动作导入StringUtil类 -->
     <jsp:useBean id="strBean" class="com.lh.bean.StringUtil"></jsp:useBean>
     <!-- 对StringUtil类对象中的intArr数组属性赋值 -->
     <jsp:setProperty property="intArr" name="strBean" value="<%=month %>"/>
  		<table width="220">
  			<tr bgcolor="skyblue">
  				<td align="center">一年中的月份：</td></tr>
  			<tr>
  				<td align="center">
  					<!-- 获得StringUtil类对象中的str属性值，该值为数组转换后的字符串 -->
  					<jsp:getProperty property="str" name="strBean"/>
  				</td>
  			</tr>
  		
  		</table>		
  
  </body>
</html>

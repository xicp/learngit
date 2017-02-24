<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>字符串转换为数组</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
		<style type="text/css">
		table{
			border: 1px solid;
			border-color: green;
		
			font-size: 12px;
		}
		input {
			font-size: 12px;
			color: gray;
		}
		textarea{
			font-size: 12px;
			color: gray;
		}
	</style>
	
	<script type="text/javascript">
		function getSelectCheckbox(){
			var checkObj = document.getElementsByName("like");	//获得复选框对象 ,该对象是一个数组 
			var likeStr ="";
			for(var i=0;i < checkObj.length ;i++){
				if(checkObj[i].checked==true){					//如果某个复选框为选中状态
					likeStr+=checkObj[i].value+",";				//将选中的复选框值组合，并以","分隔
				}
			}
			//将组合后复选框的值赋给隐藏域，表单 提交后，获得的是该隐藏域的值 
			document.getElementById("likes").value = likeStr ;
		}
	</script>
  </head>
  
  <body>
       
  	<form action="toarray.jsp" method="post">
  		<input type="hidden" name = "likes" id="likes" />
  		<table width="220">
  			<tr bgcolor="skyblue">
  				<td align="center">您喜欢的运动有：</td></tr>
  			<tr>
  				<td>
  					<input type="checkbox" name="like" value="打篮球">打篮球
  					<input type="checkbox" name="like" value="踢足球">踢足球
  					<input type="checkbox" name="like" value="打乒乓球">打乒乓球
  					<input type="checkbox" name="like" value="跑步">跑步
  					<input type="checkbox" name="like" value="打羽毛球">打羽毛球
  					<input type="checkbox" name="like" value="游泳">游泳
  				</td>
  			</tr>
  			<tr bgcolor="skyblue">
  				<td align="center"><input  type="submit" value="提 交" onclick="getSelectCheckbox()" /></td>
  			</tr>
  		</table>		
  	</form>
  </body>
</html>

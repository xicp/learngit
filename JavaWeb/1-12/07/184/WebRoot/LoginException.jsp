<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>异常捕捉过滤器</title>
		<style type="text/css">
body,td,div,input {
	font-size: 12px;
}

.error {
	padding: 5px;
	border: 1px solid #lightblue;
	color: red;
	padding-left: 30px;
}
</style>
	</head>
	<body>
		
		<form action="">
			<table align="center">
			<Tr ><Td align="center" colspan="2">
				<a href="${ pageContext.request.requestURI }?action=LoginException"><font
				 style="font-size: large;">
				过滤登录后台操作
			</font>
		</a>
			</Td></Tr>
				<tr>
					<td>
						账号
					</td>
					<td>
						<input type="text" name="account" />
					</td>
				</tr>
				<tr>
					<td>
						密码
					</td>
					<td>
						<input type="password" name="password" />
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="submit" value=" 登录 " />
						<input type="submit" value="退出" />
					</td>
				</tr>
			</table>
		</form>

		<div class="error" align="center">
			${ errormessage }
		</div>
	</body>
</html>
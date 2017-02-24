<%@page contentType="text/html" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>错误提示</title>
    </head>
    <body>
        <h1>${error}</h1>
		<input name="btn_return" type="button" value="返回" onClick="history.back(-1);">
    </body>
</html>

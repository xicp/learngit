<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>自动保存草稿</title>
		<link href="CSS/style.css" rel="stylesheet">
		
<script language="javascript" src="js/request.js"></script>		
<script language="javascript">
var saveReq = false;
//保存 草稿 
function autoSave(){
	var title=document.getElementById("title").value;
	var content=document.getElementById("content").value;
	if(title!="") {		//当文章标题不为空时
		var url = "saveDraft.jsp";
		var param = "title="+title+"&content="+content;
		//调用编写的Ajax请求方法 
		saveReq = httpRequest("post",url,true,callbackFunc_save,param);
	}
}
//回调函数 
function callbackFunc_save(){
	if(saveReq.readyState == 4){
		if(saveReq.status == 200){
			document.getElementById("sysTip").innerHTML = saveReq.responseText;
		}
	}
}
var selectReq = false;
function selectArticle(){
		var url = "getDraft.jsp";
		var param = "nocache="+new Date().getTime();
		selectReq = httpRequest("get",url,true,callbackFunc_select,param);
}
function callbackFunc_select(){
	if(selectReq.readyState == 4){
		if(selectReq.status == 200){
			document.getElementById("draftBox").innerHTML = selectReq.responseText;
		}
	}
}

var delay=1000*60*5;		//定义延迟时间，这里为5分钟
timer=window.setInterval(autoSave,10000);		//每隔5分钟保存一次草稿
timer=window.setInterval(selectArticle,delay);		//每隔5分钟保存一次草稿

</script>

    </head>
    <body onLoad="selectArticle()">
<table width="900" height="265" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg_top.jpg">
  <tr>
    <td height="131" background="images/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="900" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="194" align="center" valign="top" background="images/left_bg.jpg" bgcolor="#FFFFFF"><img src="images/bg_left.jpg" width="194" height="241"><img src="images/title_draft.jpg" width="194" height="32">      <div id="draftBox"></div></td>
    <td align="center" valign="top" bgcolor="#FFFFFF"><img src="images/title_add.jpg" width="524" height="46">
      <form name="form1" method="post" action="">
	  <table width="90%" height="355" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="27" colspan="2" align="center" id="sysTip">&nbsp;</td>
          </tr>
        <tr>
          <td width="16%" height="34">文章标题：</td>
          <td width="84%" align="left">
            <input name="title" id="title" type="text" size="57">  </td>
        </tr>
        <tr>
          <td height="245">文章内容：</td>
          <td><textarea name="content" cols="55" rows="17" id="content"></textarea></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center"><input name="Submit" type="submit" class="btn_grey" value="保存">
            &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="重置"></td>
        </tr>
      </table>
	 </form>    </td>
    <td width="182" valign="top" bgcolor="#FFFFFF"><img src="images/bg_right.jpg" width="182" height="463"></td>
  </tr>
</table>
<table width="900" height="87" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg_top.jpg">
  <tr>
    <td background="images/bg_copyright.jpg">&nbsp;</td>
  </tr>
</table>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>�Զ�����ݸ�</title>
		<link href="CSS/style.css" rel="stylesheet">
		
<script language="javascript" src="js/request.js"></script>		
<script language="javascript">
var saveReq = false;
//���� �ݸ� 
function autoSave(){
	var title=document.getElementById("title").value;
	var content=document.getElementById("content").value;
	if(title!="") {		//�����±��ⲻΪ��ʱ
		var url = "saveDraft.jsp";
		var param = "title="+title+"&content="+content;
		//���ñ�д��Ajax���󷽷� 
		saveReq = httpRequest("post",url,true,callbackFunc_save,param);
	}
}
//�ص����� 
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

var delay=1000*60*5;		//�����ӳ�ʱ�䣬����Ϊ5����
timer=window.setInterval(autoSave,10000);		//ÿ��5���ӱ���һ�βݸ�
timer=window.setInterval(selectArticle,delay);		//ÿ��5���ӱ���һ�βݸ�

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
          <td width="16%" height="34">���±��⣺</td>
          <td width="84%" align="left">
            <input name="title" id="title" type="text" size="57">  </td>
        </tr>
        <tr>
          <td height="245">�������ݣ�</td>
          <td><textarea name="content" cols="55" rows="17" id="content"></textarea></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td align="center"><input name="Submit" type="submit" class="btn_grey" value="����">
            &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="����"></td>
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

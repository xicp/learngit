<%@page contentType="text/html" pageEncoding="GBK"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>ʵʱ��ʾ��������</title>
		<link href="CSS/style.css" rel="stylesheet">
		
<script language="javascript" src="js/request.js"></script>
<script language="javascript">
var request =false;
function send(){	//��֤������Ϣ������
	var user = document.getElementById("user").value;
	var speak = document.getElementById("speak").value;
	if(user==""){
		alert("�����������ǳƣ�");
		return false;
	}
	if(speak==""){
		alert("������Ϣ������Ϊ�գ�");
		document.getElementById("speak").focus();
		return false;
	}
	document.getElementById("speak").value="";				//��������ı����ֵ
	document.getElementById("speak").focus();				//�������ı����ý���
       var url="Chat";											//��������ַ
	var param ="action=send&user="+user+"&speak="+speak;	//������� 
	request=httpRequest("post",url,true,callback,param);	//�������󷽷� 	
}
function callback(){
	request =false;
}

function getContent(){
	var url="Chat";											//��������ַ
	var param ="action=get&nocache="+new Date().getTime();	//������� 
	request=httpRequest("post",url,true,callback_content,param);	//�������󷽷� 	
}
//Ajax�ص����� 
function callback_content(){
	if(request.readyState == 4){
		if(request.status == 200){
			document.getElementById("content").innerHTML=request.responseText;		//��ʾ��������
			request =false;
		}
	}
}

window.setInterval("getContent();",1000);
window.onload=function(){
	 getContent();		//��ҳ����������Ajax��ȡ��������
}
</script>
    </head>
    <body>
<table width="689" height="148" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top.jpg">
  <tr>
    <td height="131" background="images/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="689" height="217" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="206" valign="top" bgcolor="#EAF7FD" style="padding:10px;"><div id="content" style="height:206px; overflow:hidden;">��ӭ���ٱ̺����������ң�</div></td>
  </tr>
</table>
<table width="689" height="86" border="0" align="center" cellpadding="0" cellspacing="0" background="images/bg_bottom.jpg">
  <tr>
    <td height="83" align="center" background="images/top_bg.jpg"><form id="form1" method="post" action="">
      <input name="user" type="text" id="user" size="20">
      ˵��
      <input name="speak" type="text" id="speak" size="50" onKeyDown="if(event.keyCode==13 && event.ctrlKey){send();}">
    &nbsp;
    
    <input name="Submit" type="button" class="btn_grey" value="����" onClick="send()">
    </form>
    </td>
  </tr>
</table>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=GBK">
        <title>��ʼ����</title>
		<link href="CSS/style.css" rel="stylesheet"/>
<script language="javascript" src="js/request.js"></script>
	<script language="javascript">
		timer = window.setInterval("showStartTime();showRemainTime();",1000); 	
		
		var request1= false;
		var request2 = false;
		//����Servlet��ÿ�ʼʱ�� 
		function showStartTime(){
			var url = "StartExam";
			//�˴���Ҫ��&nocache="+new Date().getTime()�����򽫳���ʱ�䲻�Զ��߶������
			var parameter="action=showStartTime&nocache="+new Date().getTime();
			request1 = httpRequest("get",url,true,callbackFunc,parameter);	
		}
		//�ص����� 
		function callbackFunc(){
			if( request1.readyState==4 ){ 
	    	 	if( request1.status == 200 ){
	    	 		showStartTimediv.innerHTML=request1.responseText;
				}
			}
		}
		//����Servlet���ʣ��ʱ�� 
		function showRemainTime(){
			var url = "StartExam";
			var parameter="action=showRemainTime&nocache="+new Date().getTime();
			request2 = httpRequest("post",url,true,callbackFunc_R,parameter);	
		}
		//�ص����� 
		function callbackFunc_R(){
			if( request2.readyState==4 ){ 
	    	 	if( request2.status == 200 ){
	    	 		h=request2.responseText;
	    	 		showRemainTimediv.innerHTML=h;
	    	 		h=h.replace(/\s/g,"");	//ȥ���ַ����е�Unicode�հ׷�
					showRemainTimediv.innerHTML=h;
					if(h=="00:00:00"){
						form1.submit();
					}
				}
			}
		}
	</script>
<script language=javascript>
function keydown(){
	if(event.keyCode==8){
		event.keyCode=0;
		event.returnValue=false;
		alert("��ǰ���ò�����ʹ���˸��");
	  }if(event.keyCode==13){
		event.keyCode=0;
		event.returnValue=false;
		alert("��ǰ���ò�����ʹ�ûس���");
	  }if(event.keyCode==116){
		event.keyCode=0;
		event.returnValue=false;
		alert("��ǰ���ò�����ʹ��F5ˢ�¼�");
	  }if((event.altKey)&&((window.event.keyCode==37)||(window.event.keyCode==39))){
		event.returnValue=false;
		alert("��ǰ���ò�����ʹ��Alt+��������������");
	  }if((event.ctrlKey)&&(event.keyCode==78)){
	   event.returnValue=false;
	   alert("��ǰ���ò�����ʹ��Ctrl+n�½�IE����");
	  }if((event.shiftKey)&&(event.keyCode==121)){
	   event.returnValue=false;
	   alert("��ǰ���ò�����ʹ��shift+F10");
	  }
}
function click() {
 event.returnValue=false;
	 alert("��ǰ���ò�����ʹ���Ҽ���");
}
document.oncontextmenu=click;
</script>

    </head>
    
    <body onLoad="showStartTime();showRemainTime();" onkeydown="keydown()">
<table width="770" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="40" height="39" background="images/startExam_leftTop.jpg">&nbsp;</td>
    <td width="667" align="right" background="images/startExam_top.jpg">����ʱ�䵽����Ծ����Զ��ύ��&nbsp;
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>	
<td width="23%" nowrap height=23 align=right>����ʱ�䣺</td>
		<td width="14%" nowrap><font color="#FF0000">${time}</font>����</td>
		<td width="13%" nowrap>�� ʱ��</td>
		<td width="60" nowrap><div id="showStartTimediv">00:00:00</div>
		</td>
		<td width="16%" nowrap>ʣ��ʱ�䣺</td>
		<td width="60" align=left nowrap><div id="showRemainTimediv"></div></td></tr>
</table>	
	</td>
    <td width="19" background="images/startExam_top.jpg">&nbsp;</td>
    <td width="44" background="images/startExam_rightTop.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="435" rowspan="2" background="images/startExam_left.jpg">&nbsp;</td>
    <td height="43" colspan="2"><img src="images/startExam_ico.jpg" width="117" height="43"></td>
    <td rowspan="2" background="images/startExam_right.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="600" colspan="2" valign="top">
	<form action="ok.jsp" method="post" name="form1">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2" align="center" class="title">�����רҵӢ�� &nbsp;&nbsp;���Ծ�
          </td>
        </tr>
        <tr>
          <td width="64%">&nbsp;</td>
          <td width="36%">&nbsp;����<font color="red">100</font>��&nbsp;&nbsp;&nbsp;��ѡ��<font color="red">40</font>��&nbsp;&nbsp;&nbsp;��ѡ��<font color="red">60</font>��</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td>

<table id="single" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>

  <tr>
    <td colspan="4" height=23 style="font-size:11pt;">һ����ѡ�⣨<font color=red>ÿ��40�֣�����÷�</font>��</td>
  </tr>
  <tr>
    <td height=23 colspan="4" align=center nowrap>
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8%" align=right height=23>[&nbsp;1&nbsp;]</td>
		  <td width="2%">&nbsp;</td>
		  <td width="90%" align=left nowrap style="font-size:11pt;">EPROM����ʲô��		  </td>
        </tr>
      </table>	</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="sAnswer" type="radio" class="noborder" value="A"></td>
    <td width="3%" align=center nowrap>A.</td>
    <td width="86%" align=left nowrap>�ɱ�̴洢��</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="sAnswer" type="radio" class="noborder" value="B"></td>
    <td width="3%" align=center nowrap>B.</td>
    <td width="86%" align=left nowrap>�ɲ��ɱ�̴洢��</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="sAnswer" type="radio" class="noborder" value="C"></td>
    <td width="3%" align=center nowrap>C.</td>
    <td width="86%" align=left nowrap>ֻ���洢��</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="sAnswer" type="radio" class="noborder" value="D"></td>
    <td width="3%" align=center nowrap>D.</td>
    <td width="86%" align=left nowrap>�ɲ��ɱ��ֻ���洢��</td>
  </tr>
</table>

<table id="single" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>

  <tr>
    <td colspan="4" height=23 style="font-size:11pt;">������ѡ�⣨<font color=red>ÿ��60�֣�����÷�</font>��</td>
  </tr>
  <tr>
    <td height=23 colspan="4" align=center nowrap>
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8%" align=right height=23>[&nbsp;1&nbsp;]</td>
		  <td width="2%">&nbsp;</td>
		  <td width="90%" align=left nowrap style="font-size:11pt;">����WWW����ȷ��������Щ��		  </td>
        </tr>
      </table>	</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="mAnswer" type="checkbox" class="noborder" id="mAnswer" value="A"></td>
    <td width="3%" align=center nowrap>A.</td>
    <td width="86%" align=left nowrap>ȫ����</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="mAnswer" type="checkbox" class="noborder" id="mAnswer" value="B"></td>
    <td width="3%" align=center nowrap>B.</td>
    <td width="86%" align=left nowrap>��ά��</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="mAnswer" type="checkbox" class="noborder" id="mAnswer" value="C"></td>
    <td width="3%" align=center nowrap>C.</td>
    <td width="86%" align=left nowrap>������</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap><input name="mAnswer" type="checkbox" class="noborder" id="mAnswer" value="D"></td>
    <td width="3%" align=center nowrap>D.</td>
    <td width="86%" align=left nowrap>World Wide Web����д </td>
  </tr>
</table>		
		</td>
	  </tr>
        <tr>
		  <td align="center"><input name="mySubmit" type="submit" class="btn_grey" value="����">	  </td>
        </tr>
      </table>
	  </form>
	  </td>
  </tr>
  <tr>
    <td width="40" height="40" background="images/startExam_leftBottom.jpg">&nbsp;</td>
    <td colspan="2" background="images/startExam_bottom.jpg">&nbsp;</td>
    <td background="images/startExam_rightBottom.jpg">&nbsp;</td>
  </tr>
</table>
    </body>
</html>
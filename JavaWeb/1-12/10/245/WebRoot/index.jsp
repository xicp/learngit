<%@page contentType="text/html" pageEncoding="GBK"%>


<html>
<head>
<title>�����������ļ��ϴ�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">

<script language="javascript" src="js/request.js"></script>
<script language="javascript">
var request = false;
function getProgress(){	
		var url="showProgress.jsp";									//��������ַ
		var param ="nocache="+new Date().getTime();//����ÿ������URL��������ͬ �������ϴ�ʱ����������
		request=httpRequest("post",url,true,callbackFunc,param);	//�������󷽷� 		
}
//Ajax�ص�����
function callbackFunc(){
	if( request.readyState==4 ){		 //�ж���Ӧ�Ƿ���� 
    	 	if( request.status == 200 ){  //�ж���Ӧ�Ƿ�ɹ�
    	 	
        		var h = request.responseText;//��÷��ص���Ӧ���ݣ�������λ�ϴ����Ȱٷֱ�
  				h=h.replace(/\s/g,"");	//ȥ���ַ����е�Unicode�հ׷�
				document.getElementById("progressPercent").style.display="";	//��ʾ�ٷֱ�	
				progressPercent.innerHTML=h+"%";		//��ʾ��ɵİٷֱ�
				document.getElementById("progressBar").style.display="block";	//��ʾ������
				document.getElementById("imgProgress").width=h*(235/100);		//��ʾ��ɵĽ���
		}
	}
}

function deal(form){
	form.submit();									//�ύ��
	timer=window.setInterval("getProgress()",500);	//ÿ��500�����ȡһ���ϴ�����
}
</script>
</head>
<body>
<form  enctype="multipart/form-data" method="post" action="UpLoad?action=uploadFile">
  <table width="400" height="247" border="0" align="center" cellpadding="0" cellspacing="0" background="images/upFile_bg.gif">
      <tr>
      <td height="40" align="center">&nbsp;</td>
    </tr>
    <tr>
      <td height="207" align="center">
        <table width="309" height="190"  border="0" align="right" cellpadding="0" cellspacing="0">
          <tr>
            <td height="34">��ѡ���ϴ����ļ���</td>
          </tr>
          <tr>
            <td height="42"><input name="file" type="file" size="34"></td>
          </tr>
          <tr>
            <td height="50">            ע���ļ���С�������50M���ڡ�</td>
          </tr>
          <tr>
            <td height="29" align="center"><div id="progressBar" class="prog_border" align="left"><img src="images/progressBar.gif" width="0" height="13" id="imgProgress"></div>
            <span id="progressPercent" style="width:40px;display:none">0%</span></td>
          </tr>
          <tr>
            <td height="29" align="center"><input  type="button" class="btn_grey" value="�ύ" onClick="deal(this.form)">
  &nbsp;
  <input name="Reset" type="reset" class="btn_grey" value="����"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>


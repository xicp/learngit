<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="js/request.js"></script>
<script language="javascript">
	var request=false;
	function login(){
		
	}
	 
	function checkName(){
		var name=document.getElementById("username").value;
		if(name==null||name==""){
			alert("�������û�����");
			document.getElementById("username").focus();
			return false;
		}
		else{
			var url= "UserServlet";	//��������ַ
			var param = "name="+name;						//�������
		    request=httpRequest("post",url,true,callbackFunc,param);//����Ajax�ύ���󷽷�
		}
	}
	
	//��Ӧ�Ļص�����
	function callbackFunc(){
		if( request.readyState==4 ){ 
     	 	if( request.status == 200 ){   	
     	 		//��ôӷ������˷��ص�XML��Ϣ��noIteranceΪXML�е�Ԫ�� 
         		var noIterance=request.responseXML.getElementsByTagName("noIterance");
         		//��ôӷ������˷��ص�XML��Ϣ��iteranceΪXML�е�Ԫ�� 
         		var iterance=request.responseXML.getElementsByTagName("iterance");
         		if(typeof(noIterance)!="undefined"&& noIterance.length>0){   
	         		alert("��ϲ�������û�������ע�ᣡ");
	         		request=false;
	         		return true;
         		}
         		if(typeof(iterance)!="undefined"&& iterance.length>0){
	         		alert("�û����Ѵ��ڣ����������룡");
	         		document.getElementById("username").focus();
	         		request=false;
	         		return false;
         		}
			}
		}
	}
</script>
</head>
<body>
<table width="599"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="36" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
    <td width="552" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="10" valign="top">&nbsp;</td>
          <td width="542" valign="top"><table width="100%" height="350"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="25" height="350" valign="top">&nbsp;</td>
              <td width="567" valign="top">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="100%" height="5"></td>
                  </tr>
                  <tr valign="top">
                    <td height="41" background="Images/center_how.GIF"><table width="100%" height="29"  border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="6%" height="7">&nbsp;</td>
                        <td width="94%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td>ע�����û�</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr align="center" valign="top">
                    <td height="69">
				   <form name="form1" method="post" action="">
				     <table width="76%" height="295"  border="0" cellpadding="0" cellspacing="0">
                       <tr>
                         <td width="22%">&nbsp;</td>
                         <td width="78%">&nbsp;</td>
                       </tr>
                       
                       <tr>
                         <td align="center">�û�����</td>
                         <td><input name="username" type="text" class="table" id="username">
                             <a href="#" onClick="checkName()">[����û�]</a>&nbsp;*</td>
                       </tr>
                       <tr>
                         <td align="center">���룺</td>
                         <td class="word"><input name="PWD1" type="password" class="table" id="PWD1">
                           *</td>
                       </tr>
                       <tr>
                         <td align="center">ȷ�����룺</td>
                         <td class="word"><input name="PWD2" type="password" class="table" id="PWD2">
                           *</td>
                       </tr>
                      
                       <tr>
                         <td align="center">�Ա�</td>
                         <td><input name="sex" type="radio" class="noborder" id="man" value="m" checked>
                           �С�
                           <input name="sex" type="radio" class="noborder" id="woman" value="f">
                           Ů</td>
                       </tr>
                     
                       <tr>
                         <td align="center">��ַ��</td>
                         <td><input name="address" type="text" class="table" id="address" size="50"></td>
                       </tr>
                       <tr>
                         <td align="center">Email��</td>
                         <td class="word"><input name="Email" type="text" class="table" id="Email" size="40">
                           *</td>
                       </tr>
                       <tr>
                         <td colspan="2" align="center">
                         <input name="save" type="submit" class="btn_grey"  value="ע ��" >
                              &nbsp;
                              <input name="re" type="reset" class="btn_grey" value="�� ��"></td>
                       </tr>
                     </table>
				   </form></td>
                  </tr>
                </table>
                </td>
            </tr>
          </table></td>
        </tr>
    </table></td>
    <td width="11" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
</table>
</body>
</html>

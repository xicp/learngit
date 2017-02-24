<%@page contentType="text/html" pageEncoding="GBK"%>


<html>
<head>
<title>带进度条的文件上传</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">

<script language="javascript" src="js/request.js"></script>
<script language="javascript">
var request = false;
function getProgress(){	
		var url="showProgress.jsp";									//服务器地址
		var param ="nocache="+new Date().getTime();//保持每次请求URL参数都不同 ，避免上传时进度条不动
		request=httpRequest("post",url,true,callbackFunc,param);	//调用请求方法 		
}
//Ajax回调函数
function callbackFunc(){
	if( request.readyState==4 ){		 //判断响应是否完成 
    	 	if( request.status == 200 ){  //判断响应是否成功
    	 	
        		var h = request.responseText;//获得返回的响应数据，该数据位上传进度百分比
  				h=h.replace(/\s/g,"");	//去除字符串中的Unicode空白符
				document.getElementById("progressPercent").style.display="";	//显示百分比	
				progressPercent.innerHTML=h+"%";		//显示完成的百分比
				document.getElementById("progressBar").style.display="block";	//显示进度条
				document.getElementById("imgProgress").width=h*(235/100);		//显示完成的进度
		}
	}
}

function deal(form){
	form.submit();									//提交表单
	timer=window.setInterval("getProgress()",500);	//每隔500毫秒获取一次上传进度
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
            <td height="34">请选择上传的文件：</td>
          </tr>
          <tr>
            <td height="42"><input name="file" type="file" size="34"></td>
          </tr>
          <tr>
            <td height="50">            注：文件大小请控制在50M以内。</td>
          </tr>
          <tr>
            <td height="29" align="center"><div id="progressBar" class="prog_border" align="left"><img src="images/progressBar.gif" width="0" height="13" id="imgProgress"></div>
            <span id="progressPercent" style="width:40px;display:none">0%</span></td>
          </tr>
          <tr>
            <td height="29" align="center"><input  type="button" class="btn_grey" value="提交" onClick="deal(this.form)">
  &nbsp;
  <input name="Reset" type="reset" class="btn_grey" value="重置"></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>


<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�ϴ��ļ���������</title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function checkM(myform){
			if(myform.file.value==""){
				alert("��ѡ���ļ�!");myform.file.focus();return false;
			}
		}
	</script>
	<script type="text/javascript">
		function getFilePath(file){
			var filePath;
			file.select();
			try{
				filePath = document.selection.createRange().text;//����ļ��ı���·��
			} 
			finally{
				document.selection.empty();
			}
			return filePath;
		}
		function upload(){
			var file = document.getElementById("filePath");
			var str =  getFilePath(file);
			document.getElementById("pathStr").value =encodeURI(str);
		}
	</script>
  </head>
  
  <body>
  <form action="save.jsp" method="post" enctype="multipart/form-data" name="form1" onsubmit="return checkM(form1)">
    <table height="112" background="bg.jpg" border="0" cellspacing="0" cellpadding="0">
    <tr><td height="30"></td></tr>
      <tr>
       
        <td colspan="2"><input type="hidden" name="pathStr" id="pathStr"></td>
      </tr>
      <tr>
        <td>ѡ���ļ���</td>
        <td><input type="file" name="file" id="filePath"></td>
      </tr>
      <tr align="center">
        <td colspan="2"><input type="submit" name="Submit" onclick="upload()" value="�� ��"></td>
      </tr>
    </table>
  </form>
  </body>
</html>

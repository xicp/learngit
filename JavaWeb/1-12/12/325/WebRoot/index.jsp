<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">    
    <title>ͨ��JspSmardUploadʵ���ļ������ϴ�</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/style.css">	
	<style type="text/css">
div{
    position:absolute;
    left:410px;
    top:100px;
}
</style>
	
<script type="text/javascript">
function addMoreRow(){//��ӱ�����
    var perent = event.srcElement.parentNode.parentNode; <!--��ȡ�����¼���������Ԫ��--> 
    var oTable = perent.parentNode.parentNode;			  <!--��ȡ���Ԫ��-->
    oNewRow = oTable.insertRow();						  <!--����������һ��-->
    for(i=0;i<perent.cells.length;i++)
    {									<!--ѭ����Ӵ����¼��ϼ�Ԫ��ӵ�е���Ԫ��-->
        oNewRow.insertCell().innerHTML=perent.cells[i].innerHTML;
    }    
    perent.all("DelBtn").disabled=false; <!--������Ԫ���еġ�ɾ������ť����Ϊ��ѡ״̬��-->
    oNewRow.all("DelBtn").disabled=false; <!--������ӵ����еġ�ɾ������ť����Ϊ��ѡ״̬-->
}
function deleteMoreRow(){//ɾ��������
    var perent=event.srcElement.parentNode.parentNode; <!--��ȡ�����¼���������Ԫ��--> 
    var table=perent.parentNode.parentNode;		   <!--��ȡ���Ԫ��-->
    if(table.rows.length>1)					       <!--�����ǰ����ָ����������1-->
    {
        table.deleteRow(perent.rowIndex);			   <!--ɾ����ǰ��-->
        if(table.rows.length==1)				    <!--�����ǰ�������Ϊ1-->	
        {	
           table.all("DelBtn").disabled=true;	 	<!--��ɾ����ť����Ϊ����ѡ-->
        }
    }
}
</script>
</head>
<body topmargin="10">
<p>
<table width="565" height="330" background="images/fileUpload.jpg" align="center">
<tr>
<td>
<div style="width:350px;height:200px;overflow:auto">
<form action="FileUpload" name="form1" method="post"
	enctype="multipart/form-data" onsubmit="return Mycheck()">
<table>
<tr>
<td nowrap="nowrap">
�ļ�
</td>
<td>
<input type="file" name="filePath" size="15"
	onKeyDown="DisabledKeyInput()" />
</td>
<td> <input type="button" name="insertButton" value="���"
	onclick="addMoreRow()"></td>
<td nowrap="nowrap">
<input type="button" name="delBtn" value="ɾ��" disabled="disabled"
	onClick="deleteMoreRow()"> </td> </tr> </table> <table> <tr
	align="center"> <td align="center"> <input type="submit"
	name="fileUpload" value="�ϴ�"> <input type="reset" name="cancel"
	value="ȡ��"> </td> 
	<%
 	String result = (String) request.getAttribute("result");
 	if (result != null) {
 		out.println("<script >alert('" + result + "');</script>");
 	}
 	%> 
 </tr> 
 </table> 
 </form> 
 </div>
  </td>
   <tr> 
   <label> 
   </table>
    </body> 
    </html>
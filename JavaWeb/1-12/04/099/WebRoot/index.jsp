<%@ page contentType="text/html; charset=gbk" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>ͬһ��ҳ�еĶ���ύ</title>
<link href="Css/Css.css" rel="stylesheet" type="text/css">
</head>
<script language="javascript" type="">
function Mycheck(){
if(form1.text1.value=="")
{alert("������������ݣ�����");form1.text1.focus();return;}
form1.submit();
}
</script>
<script language="javascript" type="">
function Mycheck1(){
if(form2.text2.value=="")
{alert("�������������!!");form2.text2.focus();return;}
form2.submit();
}
</script>
<script language="javascript" type="">
function Mycheck2(){
if(form3.text3.value=="")
{alert("�������������!!!");form3.text3.focus();return;}
form3.submit();
}
</script>
<%
request.setCharacterEncoding("gb2312");
String text1="";
String text2="";
String text3="";
String message="";
if(request.getParameter("text1")!=null){
text1=request.getParameter("text1");
message="�ύ�˵�1�������ύ����Ϊ"+text1+"";
}
if(request.getParameter("text2")!=null){
text2=request.getParameter("text2");
message="�ύ�˵�2�������ύ����Ϊ"+text2+"";
}
if(request.getParameter("text3")!=null){
text3=request.getParameter("text3");
message="�ύ�˵�3�������ύ����Ϊ"+text3+"";
}



%>
<body>
<table width="368" height="261" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="images/00.jpg"><table width="303" height="112" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td width="48">&nbsp;</td>
        <td width="255" align="right"><table border="0" cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td width="288"><form name="form1" method="post" action="?formid=1">
        ��1��
            <input name="text1" type="text" class="text" value="<%=text1%>">
            <input type="button" name="submit1" value="�ύ" onClick="Mycheck();">
            </form></td>
          </tr>
          <tr>
            <td><form name="form2" method="post" action="?formid=2">
        ��2��
            <input name="text2" type="text" class="text" value="<%=text2%>">
            <input type="button" name="submit2" value="�ύ" onClick="Mycheck1();">
            </form></td>
          </tr>
          <tr>
            <td><form name="form3" method="post" action="?formid=3">
        ��3��
            <input name="text3" type="text" class="text" value="<%=text3%>">
            <input type="button" name="submit3" value="�ύ" onClick="Mycheck2();">
            </form></td>
          </tr>
          <tr>
            <td height="10" align="center">
            <%if(!message.equals("")){%>
     <%=message%>��<a href="#" onClick="javascript:history.go(-1);">����</a>
            <%}%>
            </td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

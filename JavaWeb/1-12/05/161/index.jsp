<%@ page contentType="text/html;charset=GBK"%>

<html>
<head>
 <title>�ر����ݿ�ķ���</title>
 <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<script language="javascript">
  function change(){
    document.connectionform.action="doclose.jsp";
  }
</script>
<body>
 <center>
  <form action="dogetcon.jsp" name="connectionform"> 
  <table width="250"  height="100" border=1 cellspacing="0" bordercolor="black" bordercolorlight="black" bordercolordark="white" style="margin-top:200">
   <tr>
     <td align="center" heigth="40" bgcolor="lightgrey">����״̬��
        <%
          String formname=(String)session.getAttribute("formname");//ͨ���ж�formname��ֵ��ѡ����ʾ���Ӳ�������Ϣ���ǹرղ�������Ϣ
                                                                   //�������ύ��dogetcon.jspҳ������ø�ֵΪ"create"���������ύ��doclose.jspҳ������ø�ֵΪ"close"
          if(formname==null)formname="create";
          if(formname.equals("create")){
            if(session.getAttribute("connectionstatus")==null){
        %>
               û�н������ӣ�
        <%
           }
           else{
        %>       
               <%=session.getAttribute("connectionstatus")%>
        <%  
            }
           }
           else if(formname.equals("close")){
        %>
              <%=session.getAttribute("closestatus")%>
        <%
           }
        %>
      </td>
    </tr>
   <tr>
     <td align="center" height="60" valign="middle">
        <input type="submit" name="create" value="�������">
        <input type="submit" name="close" value="�ر�����" onclick="change()">
     </td>
   </tr>
   <tr bgcolor="lightgrey">
     <td align="center">��ȷ�����������֧��JavaScript�ű���</td>
   </tr>
  </table>
  </form>
 </center>
</body>
</html>

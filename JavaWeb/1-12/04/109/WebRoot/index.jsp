<%@ page contentType="text/html;charset=GBK"%>
<%
   int i=0;
   synchronized(application){
       if(application.getAttribute("times")==null){
	       i=1;
       }
       else{
	       i=Integer.parseInt((String)application.getAttribute("times"));
           i++;
       }
       application.setAttribute("times",Integer.toString(i));
   }
%>
<html>
  <head>
    <title>ͨ��Application����ʵ����վ������</title>
 	<link rel="stylesheet" type="text/css" href="css/style.css">
  </head>
  <body>
    <center>
      <table height="70" width="200" border="1" bordercolor="black" bordercolorlight="black" bordercolordark="white" cellspacing="0" style="margin-top:200">
        <tr bgcolor="lightgrey">
         <td align="center">��ӭ���ʣ�</td>
        </tr>
        <tr>
         <td align="center">
          ���ǵ�<b><%=i%></b>λ���ʱ���վ���οͣ�
         </td>
        </tr>
      </table>
    </center>
  </body>
</html>


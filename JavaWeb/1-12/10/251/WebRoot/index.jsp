<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.core.ConnDB"%>

<html>
<head>
<title>ʵ�ֿ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="js/request.js"></script>
<script language="javascript">

var request = false; 		//���ڱ���XMLHttpRequest�����ȫ�ֱ��� 
var offsetE;				//����һ��ȫ�ֱ��������ڱ���ƫ�����Ķ���
function getData(element,id){
	offsetE=element;		//����ǰ��ƫ�������󱣴浽ȫ�ֱ�����	
	var url="getTip.jsp";										//��������ַ
	var param ="id="+id+"&nocache="+new Date().getTime()		//������� 
	request=httpRequest("get",url,true,callbackFunc,param);		//�������󷽷� 
}
//Ajax�ص�����
function callbackFunc(){
	if(request.readyState == 4){
		if(request.status == 200){
			document.getElementById("toolTip").style.left=(offsetE.offsetLeft+150)+"px";	//���ù�����ʾ����߾�
			document.getElementById("toolTip").style.top=offsetE.offsetTop+"px";		//���ù�����ʾ���ϱ߾�
			document.getElementById("goodsIntroduce").innerHTML=request.responseText;		//��ʾ������ʾ
			document.getElementById("toolTip").style.display="block";		//��ʾ������ʾ
			request = false;
		}
	}
}

function clearTip(){
	document.getElementById("toolTip").style.display="none";	//���ع�����ʾ
}
</script>
</head>
<body>
<jsp:include page="navigation.jsp"/>
<table width="788" height="236"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="199" height="182" valign="top" bgcolor="#FFFFFF"><img src="images/left.gif" width="199" height="575"></td>
    <td width="405" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45" valign="top" background="images/sub_newgoods.gif">&nbsp;</td>
        </tr>
        <tr>
          <td height="10" valign="top">&nbsp;</td>
        </tr>
        <tr>
          <td height="94" valign="top">
		  <div style="position:absolute">
<table width="100%" height="162"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="CFCFCF">
         <%
         	ConnDB conn = new ConnDB();
         	
			ResultSet rs=conn.executeQuery("select * from tb_goods order by name");
			int new_ID=0;
			String new_goodsname="";
			float new_price=0;
			String new_picture="";
        	int s=0;
			while (rs.next()){
				new_ID=rs.getInt("ID");
				new_goodsname=rs.getString("name");
				new_price=rs.getFloat("price");
				new_picture=rs.getString("picture");
				if(s%2==0){
		%>
        <tr>
        
          <td align="center" onMouseOver="getData(this,<%=new_ID%>)" onMouseOut="clearTip()"><table width="0" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="95" align="center"><img src="images/goods/<%=new_picture%>" width="120" height="80"></td>
              </tr>
              <tr>
                <td height="22" align="center"><a href="#" class="word_green">�� <%=new_goodsname%></a></td>
              </tr>
              <tr>
                <td height="20" align="center">��Ʒ�۸�<%=new_price%></td>
              </tr>
              <tr>
                <td height="22" align="center"><img src="images/btn_buy.GIF" width="52" height="20">                </td>
              </tr>
            </table></td>
          <%}else{%>
          <td align="center" onMouseOver="getData(this,<%=new_ID%>)" onMouseOut="clearTip()"><table width="0" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="95" align="center"><img src="images/goods/<%=new_picture%>" width="120" height="80"></td>
              </tr>
              <tr>
                <td height="22" align="center"><a href="#" class="word_green">�� <%=new_goodsname%></a></td>
              </tr>
              <tr>
                <td height="20" align="center">��Ʒ�۸�<%=new_price%></td>
              </tr>
              <tr>
                <td height="22" align="center"><img src="images/btn_buy.GIF" width="52" height="20">                </td>
              </tr>
            </table></td>
        </tr>
        <%}
		  s++;
		  }%>
      </table>
      
	  	 <div id="toolTip" style=" background-image:url(images/tip.gif); width:206px; height:155px; display:none; position:absolute; z-index:100;">
	  	   <table width="100%" height="138" border="0" cellpadding="0" cellspacing="0">
             <tr>
               <td width="20%" height="28">&nbsp;</td>
               <td width="71%" valign="middle">&nbsp;</td>
               <td width="9%" valign="middle">&nbsp;</td>
             </tr>
             <tr>
               <td>&nbsp;</td>
               <td valign="top" id="goodsIntroduce">����</td>
               <td valign="top">&nbsp;</td>
             </tr>
           </table>
	  	 </div>
	  </div>		  </td>
        </tr>
    </table></td>
    <td width="196" valign="top" bgcolor="#FFFFFF"><img src="images/right.jpg" width="196" height="559"></td>
  </tr>
</table>

 <jsp:include page="copyright.jsp"/>

</body>
</html>
<%conn.close();%>

<%@ page language="java" import="java.io.*" pageEncoding="GBK"%>
<%!
private void copy(File[] s,File d){//���帳ֵ�ļ��еķ���
	if(!d.exists())//���ָ����Ŀ��Ŀ¼������
		d.mkdir();//����Ŀ¼
	for(int i=0;i<s.length;i++){//ѭ������Դ�ļ���
		if(s[i].isFile()){//���Ϊ�ļ� 
			try{
				FileInputStream fis=new FileInputStream(s[i]);//�����ļ�·���������ļ�������
				File newFile = new File(d.getPath()+File.separator+s[i].getName());//����Ŀ���ļ�·��
				FileOutputStream out=new FileOutputStream(newFile);//����Ŀ���ļ�·�������ļ������ 
				int count;
				if((count=fis.read())>=0){//��Դ�ļ� �ж�ȡ�����ֽ����� 
					out.write(count);		//���ֽ�����д��Ŀ���ļ��� 
				}
				out.close();//�ر��� 
				fis.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(s[i].isDirectory()){//���Ϊ�ļ��� 
			File des=new File(d.getPath()+File.separator+s[i].getName());//�����ļ����� 
			des.mkdir();//����Ŀ���ļ�Ŀ¼
			copy(s[i].listFiles(),des);//��������copy����
		}
	}
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>�ļ��и���</title>
	<style>
	body,td{ font-size:12px;}
	</style>
  </head>
  <%
  request.setCharacterEncoding("GBK");
  File sourFolder=null,targetFolder=null;
  String source=request.getParameter("sourFolder");
  String target=request.getParameter("targetFolder");
  if(source!=null){
	  sourFolder=new File(source);
	  if(!sourFolder.isDirectory()||!sourFolder.exists()){
		  out.print("<script language='javascript'>alert('Դ�ļ��в�����')</script>");
	  }
  }
  if(target!=null){
	  targetFolder=new File(target);
	  if(!targetFolder.exists()){
		  out.print("<script language='javascript'>alert('Ŀ���ļ��в�����')</script>");
	  }else{
		  copy(sourFolder.listFiles(),targetFolder);
	  }
  }
  %>
  <body>
  <form name="form1" method="post" action="index.jsp">
    <table width="488" height="217" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="middle" background="bg.gif"><table width="488" height="200" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="125">&nbsp;</td>
            <td width="323" valign="top"><table width="98%" height="189"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40%" height="24">&nbsp;&nbsp;Դ�ļ��У�
                  <input name="sourFolder" type="text" value="<%=source==null?"":source %>" size="32"></td>
              </tr>
              <tr>
                <td height="21">Ŀ���ļ��У�
                  <input name="targetFolder" type="text" value="<%=target==null?"":target %>" size="32"></td>
              </tr>
              <tr>
                <td height="24">Դ�ļ������ݣ�</td>
              </tr>
              <tr>
                <td height="31"><textarea name="textarea" cols="42" rows="6" readonly><%
                if(sourFolder!=null){
                	File[] files=sourFolder.listFiles();
                	for(int i=0;i<files.length;i++){
                		out.println((files[i].isDirectory()?"�ļ���\t":"�ļ�\t")+ files[i].getName());
			   	     }
                }
        %></textarea></td>
              </tr>
              <tr>
                <td height="26" align="center"><input type="submit" name="Submit" value="����"></td>
              </tr>
            </table></td>
            <td width="40">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table>
  </form>
  </body>
</html>

<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page import="com.jspsmart.upload.Files" %>
<jsp:useBean id="myup" class="com.jspsmart.upload.SmartUpload"/>
<center>�����ϴ��ļ������Եȡ���</center>
<%
  String filedir="/file/";//�ϴ�Ŀ���ļ���
  String errors="";
  long maxsize=2*1024*1024;//�ϴ��ļ������ռ����� 
  boolean allow=true;
  
  try{
	  myup.initialize(pageContext);//��ʼ�� 
	  myup.setMaxFileSize(maxsize);//�����ļ������ռ����� 
	  myup.setDeniedFilesList("exe,jsp,bat");//�������Ƶ��ļ� 
	  myup.upload();//ִ���ϴ����� 
  }catch(SecurityException e){
	  allow=false;
	  errors+="��ֹ�ϴ�\"*.exe\"��\"*.jsp\"��\".bat\"�ļ�";//�ϴ�ʧ����ʾ��Ϣ 
	  e.printStackTrace();
  }

  if(allow){//����ϴ��ɹ� 
      try{
	      Files files=myup.getFiles();//��ȡ�ϴ����ļ����� 
      	  for(int i=0;i<files.getCount();i++){//�����ļ� 
      	      File singlefile=files.getFile(i);
      	      if(!singlefile.isMissing()){	    	  
      	          String name=singlefile.getFileName();//��ȡ�ϴ��ļ����ļ��� 	    	  
      	          singlefile.saveAs(filedir+name,File.SAVEAS_VIRTUAL);
      	          errors+="<li>�ļ�"+(i+1)+"�ϴ��ɹ���</li>";//�ϴ��ɹ�����Ϣ         				  
      	      }		  
      	  }	  
      }catch(java.lang.NumberFormatException e){
	      errors="�ļ��ϴ�ʧ�ܣ�";
    	  e.printStackTrace();
      }
  }
  request.setAttribute("errors",errors);//������ʾ��Ϣ 
%>
<jsp:forward page="fileup.jsp"/>
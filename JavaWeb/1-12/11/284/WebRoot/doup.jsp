<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="com.jspsmart.upload.File" %>
<%@ page import="com.jspsmart.upload.Files" %>
<jsp:useBean id="myup" class="com.jspsmart.upload.SmartUpload"/>
<center>正在上传文件，请稍等……</center>
<%
  String filedir="/file/";//上传目标文件夹
  String errors="";
  long maxsize=2*1024*1024;//上传文件的最大空间限制 
  boolean allow=true;
  
  try{
	  myup.initialize(pageContext);//初始化 
	  myup.setMaxFileSize(maxsize);//设置文件的最大空间限制 
	  myup.setDeniedFilesList("exe,jsp,bat");//设置限制的文件 
	  myup.upload();//执行上传方法 
  }catch(SecurityException e){
	  allow=false;
	  errors+="禁止上传\"*.exe\"、\"*.jsp\"、\".bat\"文件";//上传失败提示信息 
	  e.printStackTrace();
  }

  if(allow){//如果上传成功 
      try{
	      Files files=myup.getFiles();//获取上传的文件对象 
      	  for(int i=0;i<files.getCount();i++){//遍历文件 
      	      File singlefile=files.getFile(i);
      	      if(!singlefile.isMissing()){	    	  
      	          String name=singlefile.getFileName();//获取上传文件的文件名 	    	  
      	          singlefile.saveAs(filedir+name,File.SAVEAS_VIRTUAL);
      	          errors+="<li>文件"+(i+1)+"上传成功！</li>";//上传成功的信息         				  
      	      }		  
      	  }	  
      }catch(java.lang.NumberFormatException e){
	      errors="文件上传失败！";
    	  e.printStackTrace();
      }
  }
  request.setAttribute("errors",errors);//保存提示信息 
%>
<jsp:forward page="fileup.jsp"/>
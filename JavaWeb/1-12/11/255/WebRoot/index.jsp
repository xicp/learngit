<%@ page language="java" import="java.io.*" pageEncoding="GBK"%>
<%!
private void copy(File[] s,File d){//定义赋值文件夹的方法
	if(!d.exists())//如果指定的目标目录不存在
		d.mkdir();//创建目录
	for(int i=0;i<s.length;i++){//循环遍历源文件夹
		if(s[i].isFile()){//如果为文件 
			try{
				FileInputStream fis=new FileInputStream(s[i]);//根据文件路径名创建文件输入流
				File newFile = new File(d.getPath()+File.separator+s[i].getName());//创建目标文件路径
				FileOutputStream out=new FileOutputStream(newFile);//根据目标文件路径创建文件输出流 
				int count;
				if((count=fis.read())>=0){//从源文件 中读取单个字节数据 
					out.write(count);		//将字节数据写入目标文件中 
				}
				out.close();//关闭流 
				fis.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(s[i].isDirectory()){//如果为文件夹 
			File des=new File(d.getPath()+File.separator+s[i].getName());//创建文件对象 
			des.mkdir();//创建目标文件目录
			copy(s[i].listFiles(),des);//继续调用copy方法
		}
	}
}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>文件夹复制</title>
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
		  out.print("<script language='javascript'>alert('源文件夹不存在')</script>");
	  }
  }
  if(target!=null){
	  targetFolder=new File(target);
	  if(!targetFolder.exists()){
		  out.print("<script language='javascript'>alert('目标文件夹不存在')</script>");
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
                <td width="40%" height="24">&nbsp;&nbsp;源文件夹：
                  <input name="sourFolder" type="text" value="<%=source==null?"":source %>" size="32"></td>
              </tr>
              <tr>
                <td height="21">目标文件夹：
                  <input name="targetFolder" type="text" value="<%=target==null?"":target %>" size="32"></td>
              </tr>
              <tr>
                <td height="24">源文件夹内容：</td>
              </tr>
              <tr>
                <td height="31"><textarea name="textarea" cols="42" rows="6" readonly><%
                if(sourFolder!=null){
                	File[] files=sourFolder.listFiles();
                	for(int i=0;i<files.length;i++){
                		out.println((files[i].isDirectory()?"文件夹\t":"文件\t")+ files[i].getName());
			   	     }
                }
        %></textarea></td>
              </tr>
              <tr>
                <td height="26" align="center"><input type="submit" name="Submit" value="复制"></td>
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

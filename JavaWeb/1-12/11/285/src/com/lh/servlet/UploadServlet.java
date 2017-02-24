package com.lh.servlet;

import java.io.*;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;

public class UploadServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String uploadPath=getServletContext().getRealPath("/")+"upload";          //定义上传文件的地址 
		File folder = new File(uploadPath);
		if(!folder.exists())
			folder.mkdirs();
		String message=null;
		if(ServletFileUpload.isMultipartContent(request)){  //判断是否获取的是文件
			DiskFileItemFactory disk=new DiskFileItemFactory();
			disk.setSizeThreshold(20*1024);                 //设置内存可存字节数
			disk.setRepository(disk.getRepository());       //设置临时文件目录
			ServletFileUpload up=new ServletFileUpload(disk);
			int maxsize=2*1024*1024;
			List list=null;
			try{
				list=up.parseRequest(request);              //获取上传列表
			}
			catch(Exception e){
				e.printStackTrace();
			}
			Iterator i=list.iterator();                     //创建列表的迭代器
			while(i.hasNext()){
				FileItem fm=(FileItem)i.next();             //遍历列表
				if(!fm.isFormField()){
					String fname=fm.getName();              //获取文件名
					String filePath =fm.getName();	//获取文件全路径名
					String fileName="";
					int startIndex = filePath.lastIndexOf("\\");
					if(startIndex!=-1){						//对文件名进行截取
						fileName = filePath.substring(startIndex+1);
					}else{
						fileName=filePath;
					} 
					if(fm.getSize()>maxsize){
						message="文件太大了，不要超过2MB";
						break;
					}
					String fileSize=new Long(fm.getSize()).toString();
					if((fname==null)||(fname.equals(""))&&(fileSize.equals("0"))){
						message="文件名不能为空，文件大小也不能为零！";
						break;
					}
					File saveFile=new File(uploadPath,fileName);
					try{
						fm.write(saveFile);                //向文件中写入数据
						message="文件上传成功！";
					}
					catch(Exception e1){
						e1.printStackTrace();
					}
				}
			}
		}
		request.setAttribute("result",message);
		RequestDispatcher rd=request.getRequestDispatcher("message.jsp");
		rd.forward(request, response);
	}
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}

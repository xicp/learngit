package com.lh.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;

	public class UploadServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String path = this.getServletContext().getRealPath("/")+"/upload";
		File folder = new File(path);
		if(!folder.exists())
			folder.mkdirs();
		String result = null;
		long maxsize=2*1024*1024;
		try{
			SmartUpload upfile=new SmartUpload();       //实例化对象 
			upfile.initialize(this.getServletConfig(),request,response);     //执行初始化操作 
			upfile.upload();                            //上传文件到服务器
		
			Files file=upfile.getFiles();              // 获取文件组
			if(file.getSize()>maxsize){                 //判断文件大小是否符合
				result="太大了！";
			}
			com.jspsmart.upload.File files=file.getFile(0);                  //实例化文件对象
			
			if((!files.isMissing())&&(file.getSize()<maxsize)){
				String fname=files.getFileName();       //获取文件名 
				//String s= URLEncoder.encode(fname,"utf-8");
				upfile.save("/upload/");                //保存上传的文件
				result="上传成功！";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		//将信息发送到指定页面 
		request.setAttribute("result", result);
		RequestDispatcher rd=request.getRequestDispatcher("secc.jsp");
		rd.forward(request, response);		
	}
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

}

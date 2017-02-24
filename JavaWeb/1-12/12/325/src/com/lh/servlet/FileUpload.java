package com.lh.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;


public class FileUpload extends HttpServlet {
	public FileUpload() {
		super();
	}
	public void destroy() {
		super.destroy(); 
		
	}	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		SmartUpload smartUpload= new SmartUpload();			//创建上传文件的核心对象
		String res = "没有确定要上传的文件！";			  	//设置返回信息字符串
		String uploadPath = this.getServletContext().getRealPath("/")+"upload";
		java.io.File uploadFolder = new java.io.File(uploadPath);
		if(!uploadFolder.exists())
			uploadFolder.mkdirs();
		long maxsize = 1024 * 1024 * 5;					  	//定义上传文件的大小
		try {
			smartUpload.initialize(this.getServletConfig(), request, response); //初始化SmartUpload对象
			smartUpload.upload();							//调用upload()方法
			Files uploadFiles = smartUpload.getFiles();		//获取所有上传文件
			if (uploadFiles.getSize() > maxsize) {			//判断上传文件的长度是否大于设置的最大文件长度
				res = "文件大小超出范围！";	
			}
			for (int i = 0; i < uploadFiles.getCount(); i++) { //获取遍历上传的所有文件
				File file = uploadFiles.getFile(i);		 	//获取每个上传的文件对象
				if ((!file.isMissing()) && (uploadFiles.getSize() < maxsize)) {//如果用户选择了上传文件，并且上传的文件小于限制的大小						
					String fileName = uploadFolder.getName()+"/" +file.getFileName();//定义上传文件的名称
					file.saveAs(fileName, File.SAVEAS_VIRTUAL); //保存文件
					res = "文件上传成功！";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("result", res);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}	
	public void init() throws ServletException {
		
	}
}

package com.lh.servlet;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebWorkPathServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public WebWorkPathServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");//设置响应正文的MIME类型，以及字符编码格式
		PrintWriter out = response.getWriter();
		ServletContext context = this.getServletContext();
		Enumeration e = context.getAttributeNames();//获得ServletContext对象中的所有属性名
		while(e.hasMoreElements()){//循环Enumeration对象，读取出 ServletContext对象中的所有属性值
			String attributeName = (String)e.nextElement();
			out.println("<br>"+attributeName+" : "+context.getAttribute(attributeName));
		}
		out.close();
		//获得web应用的工作目录
		File workPath = (File)context.getAttribute("javax.servlet.context.tempdir");
		FileWriter writer =new FileWriter(workPath+"/test.txt");
		BufferedWriter bf = new BufferedWriter(writer);
		bf.write("获取Web应用的工作目录");	//向文件中写入字符
		bf.newLine();						//换行
		bf.write("明日科技！");
		bf.flush();							//刷新缓冲区
		bf.close();							//关闭缓冲区输出流
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}

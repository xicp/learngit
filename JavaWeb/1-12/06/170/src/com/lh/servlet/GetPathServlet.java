package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPathServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GetPathServlet() {
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
		String scheme = request.getScheme();			//获取请求协议（http）
		String serverName = request.getServerName();	//获取服务器名称（localhost）
		int serverPort = request.getServerPort();		//获取服务器端口号
		String contextPath = request.getContextPath();	//返回Web应用的URL入口
		//以上这些属性组合成一个站点路径（http://localhost:8080/149/）
		String path = scheme+"://"+serverName+":"+serverPort+contextPath+"/";
		//getRealPath()方法返回一个给定虚拟路径的真实路径
		String realPath = this.getServletContext().getRealPath("index.jsp");
		//设置HTTP响应的征文的MIME类型以及字符编码格式
		request.setAttribute("path", path);				//将Web路径添加到request对象中
		request.setAttribute("realPath", realPath);		//将真实路径添加到request对象中
	
		request.getRequestDispatcher("path.jsp").forward(request, response);
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

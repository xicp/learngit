package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForwardServlet extends HttpServlet {

	
	public ForwardServlet() {
		super();
	}


	public void destroy() {
		super.destroy(); 	
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
		request.setCharacterEncoding("UTF-8");		//设置请求数据的字符编码格式
		String name = request.getParameter("name"); //获得请求表单中的用户名
		String pwd = request.getParameter("pwd");	//获得请求表单中的密码
		if((name!=null&&!name.equals(""))&&(pwd!=null&&!pwd.equals(""))){
			if(name.equals("mr")&&pwd.equals("123")){
				//使用RequestDispatcher对象将页面请求转发到success.jsp页
				request.getRequestDispatcher("success.jsp").forward(request, response);
			}else{
			
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
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

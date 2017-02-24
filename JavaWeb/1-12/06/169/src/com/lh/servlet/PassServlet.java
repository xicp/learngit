package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.bean.UserInfo;

public class PassServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PassServlet() {
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
		request.setCharacterEncoding("UTF-8");			//设置请求的字符编码格式
		String name = request.getParameter("name");		//获取用户名
		String pwd = request.getParameter("pwd");		//获取密码
		String sex = request.getParameter("sex");		//获取性别
		String age = request.getParameter("age");		//获取年龄
		String email = request.getParameter("email");	//获取Email
		UserInfo user = new UserInfo(); 				//创建封装用户信息的JavaBean对象
		//以下方法将获得的表单数据封装到user对象中
		user.setUserName(name);
		user.setUserPwd(pwd);
		user.setUserSex(sex);
		Integer userAge = new Integer(age);
		user.setUserAge(userAge);
		user.setEmail(email);
		request.setAttribute("User", user);				//将user对象添加到request对象中
		//将请求转发到logininfo.jsp页面
		request.getRequestDispatcher("logininfo.jsp").forward(request, response);
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

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
		request.setCharacterEncoding("UTF-8");			//����������ַ������ʽ
		String name = request.getParameter("name");		//��ȡ�û���
		String pwd = request.getParameter("pwd");		//��ȡ����
		String sex = request.getParameter("sex");		//��ȡ�Ա�
		String age = request.getParameter("age");		//��ȡ����
		String email = request.getParameter("email");	//��ȡEmail
		UserInfo user = new UserInfo(); 				//������װ�û���Ϣ��JavaBean����
		//���·�������õı����ݷ�װ��user������
		user.setUserName(name);
		user.setUserPwd(pwd);
		user.setUserSex(sex);
		Integer userAge = new Integer(age);
		user.setUserAge(userAge);
		user.setEmail(email);
		request.setAttribute("User", user);				//��user������ӵ�request������
		//������ת����logininfo.jspҳ��
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

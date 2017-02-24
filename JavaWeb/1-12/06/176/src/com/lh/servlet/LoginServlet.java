package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.bean.UserInfo;
import com.lh.dao.LoginDao;

public class LoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");//���������ַ������ʽ
		/**�����ǻ�ñ��ύ������ֵ*/
		String name = request.getParameter("name");
		String pwd= request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		int userAge =0;
		if(age!=null&&!age.equals("")){
			userAge = Integer.parseInt(age);
		}
		String email = request.getParameter("email");
		/**���´��뽫��õı�ֵ��װ���û���Ϣ������*/
		UserInfo user = new UserInfo();
		user.setName(name);
		user.setPwd(pwd);
		user.setSex(sex);
		user.setAge(userAge);
		user.setEmail(email);
		boolean res = LoginDao.getInstance().saveUser(user);//���û�ע����Ϣ���浽���ݿ�
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>JDBC�������ݿ�</TITLE></HEAD>");
		out.println("  <BODY>");
		if(res){
			out.println("<font color='green' size=2>ע��ɹ���</font>");
		}else{	
			out.println("<font color='orangered' size=2>ע��ʧ�ܣ�</font>");
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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

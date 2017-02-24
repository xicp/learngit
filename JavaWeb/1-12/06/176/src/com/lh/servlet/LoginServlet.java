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

		request.setCharacterEncoding("UTF-8");//设置请求字符编码格式
		/**以下是获得表单提交过来的值*/
		String name = request.getParameter("name");
		String pwd= request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		int userAge =0;
		if(age!=null&&!age.equals("")){
			userAge = Integer.parseInt(age);
		}
		String email = request.getParameter("email");
		/**以下代码将获得的表单值封装到用户信息对象中*/
		UserInfo user = new UserInfo();
		user.setName(name);
		user.setPwd(pwd);
		user.setSex(sex);
		user.setAge(userAge);
		user.setEmail(email);
		boolean res = LoginDao.getInstance().saveUser(user);//将用户注册信息保存到数据库
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>JDBC访问数据库</TITLE></HEAD>");
		out.println("  <BODY>");
		if(res){
			out.println("<font color='green' size=2>注册成功！</font>");
		}else{	
			out.println("<font color='orangered' size=2>注册失败！</font>");
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

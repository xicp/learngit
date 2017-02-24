package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.dao.UserDao;
import com.lh.model.User;

public class UserLoginServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserLoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType( "text/xml;charset=UTF-8" );//设置响应格式为test/xml
		//禁止缓存
		response.addHeader( "Cache-Control", "no-store,no-cache,must-revalidate" );
		response.addHeader( "Cache-Control", "post-check=0,pre-check=0" );
		response.addHeader( "Expires", "0" );
		response.addHeader( "Pragma", "no-cache" );
		PrintWriter out = response.getWriter();
		out.println( "<?xml version=\"1.0\" encoding=\"utf-8\"?>" );
		out.println( "<checkLogin>" );
		String name = request.getParameter( "name" );	//获取用户名
		String pwd = request.getParameter("pwd");		//获取密码
		name= java.net.URLDecoder.decode(name,"UTF-8");	//根据UTF-8将字符串解码
		pwd= java.net.URLDecoder.decode(pwd,"UTF-8");	//根据UTF-8将字符串解码
		User user = new User();
		user.setName(name);
		user.setPwd(pwd);
		boolean result=UserDao.getInstance().checkLogin(user);
		if(result==true) 
			out.println("<hasUser id=\"ok\"/>");
		else
			out.println("<noUser>"+name+"</noUser>");
		out.println( "</checkLogin>" );
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

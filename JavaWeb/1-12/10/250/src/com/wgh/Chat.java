package com.wgh;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Chat extends HttpServlet {

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
		response.setContentType("text/html;charset=GBK");
		String action = request.getParameter("action");
        if ("send".equals(action)) {	//��������
            this.send(request, response);
        }else if("get".equals(action)){
        	this.get(request,response);
        }
		
	}
	
	public void send(HttpServletRequest request,HttpServletResponse response)  throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		ServletContext application=getServletContext();		//��ȡapplication����
		String user=request.getParameter("user");			//��ȡ�û��ǳ�
		String speak=request.getParameter("speak");			//��ȡ˵������
		user = java.net.URLDecoder.decode(user, "UTF-8");
		speak = java.net.URLDecoder.decode(speak, "UTF-8");
		Vector<String> v=null;
		String message="["+user+"]˵��"+speak;			//���˵������
		if(null==application.getAttribute("message")){
			v=new Vector<String>();
		}else{
			v=(Vector<String>)application.getAttribute("message");
		}
		v.add(message);	
		application.setAttribute("message", v);		//���������ݱ��浽application��
        Random random = new Random();
		request.getRequestDispatcher("Chat?action=get&nocache=" + random.nextInt(10000)).forward(request, response);
	}
	
	public void get(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		/*********************��ȡ������Ϣ****************************/
		ServletContext application=getServletContext();		//��ȡapplication����
		String msg="";
		if(null!=application.getAttribute("message")){
			Vector<String> v_temp=(Vector<String>)application.getAttribute("message");
			for(int i=v_temp.size()-1;i>=0;i--){
				msg=msg+"<br>"+v_temp.get(i);
			}
		}else{
			msg="��ӭ���ٱ������ң�";
		}
        request.setAttribute("msg", msg);
        request.getRequestDispatcher("content.jsp").forward(request, response);		
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

package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IncomeTaxServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public IncomeTaxServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}
	//计算个人所得税
	public double getTax(double charge){
		double tax = 0;
		if(charge<=0){
			tax = 0;
		}else if(charge>0&&charge<=500){
			tax = charge*0.05;
		}else if(charge>500&&charge<=2000){
			tax = charge*0.1-25;
		}else if(charge>2000&&charge<=5000){
			tax = charge*0.15-125;
		}else if(charge>5000&&charge<=20000){
			tax = charge*0.2-375;
		}else if(charge>20000&&charge<=40000){
			tax = charge*0.25-1375;
		}else if(charge>40000&&charge<=60000){
			tax = charge*0.30-3375;
		}else if(charge>60000&&charge<=80000){
			tax = charge*0.35-6375;
		}else if(charge>80000&&charge<=100000){
			tax = charge*0.4-10375;
		}else if(charge>100000){
			tax = charge*0.45-15375;
		}
		return tax;
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		double laborage = Double.parseDouble(request.getParameter("laborage"));//工资
		double startPoint = Double.parseDouble(request.getParameter("startpoint"));//征税起点
		double  myTax = this.getTax(laborage - startPoint);//计算个人所得税
		request.setAttribute("Tax", myTax);//将个人所得税的值保存在请求范围内
		//请求转发到result.jsp页
		request.getRequestDispatcher("result.jsp").forward(request, response);
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

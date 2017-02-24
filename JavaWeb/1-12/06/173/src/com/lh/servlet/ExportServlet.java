package com.lh.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ExportServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ExportServlet() {
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

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/vnd.ms-excel");//设置响应正文的MIME类型，该类型表示Excel
		//response.addHeader("Content-Disposition", "attachment;filename=logininfo.xls");
		String name = request.getParameter("name");
		String pwd =request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		ServletOutputStream out = response.getOutputStream();//响应输出流对象
		HSSFWorkbook wb = new HSSFWorkbook();				//创建Excel表格
		HSSFSheet  sheet = wb.createSheet("用户注册信息");	//创建工作簿
		sheet.setColumnWidth(4, 5000);						//设置列宽
		HSSFRow titleRow = sheet.createRow(0);				//创建Excel中的标题行
		HSSFCell titleCell1 =titleRow .createCell(0);		//在行中创建第1个单元格
		titleCell1.setCellValue("用户姓名");					//设置第1个单元格的值
		HSSFCell titleCell2= titleRow.createCell(1);		//在行中创建第2个单元格
		titleCell2.setCellValue("密码");						//设置第2个单元格的值
		HSSFCell titleCell3 =titleRow .createCell(2);		//在行中创建第3个单元格
		titleCell3.setCellValue("性别");						//设置第3个单元格的值
		HSSFCell titleCell4= titleRow.createCell(3);		//在行中创建第4个单元格
		titleCell4.setCellValue("年龄");						//设置第4个单元格的值
		HSSFCell titleCell5= titleRow.createCell(4);		//在行中创建第5个单元格
		titleCell5.setCellValue("Email");					//设置第5个单元格的值
		HSSFRow valueRow = sheet.createRow(1);				//创建第2行
		HSSFCell nameCell = valueRow.createCell(0);			//在第2行中创建单元格
		nameCell.setCellValue(name);
		HSSFCell pwdCell = valueRow.createCell(1);
		pwdCell.setCellValue(pwd);
		HSSFCell sexCell = valueRow.createCell(2);
		sexCell.setCellValue(sex);
		HSSFCell ageCell = valueRow.createCell(3);
		ageCell.setCellValue(age);
		HSSFCell emailCell = valueRow.createCell(4);
		emailCell.setCellValue(email);
		HSSFCellStyle cellStyle = wb.createCellStyle();
		wb.write(out);										//将响应流输入到Excel表格中
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

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
		response.setContentType("application/vnd.ms-excel");//������Ӧ���ĵ�MIME���ͣ������ͱ�ʾExcel
		//response.addHeader("Content-Disposition", "attachment;filename=logininfo.xls");
		String name = request.getParameter("name");
		String pwd =request.getParameter("pwd");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String email = request.getParameter("email");
		ServletOutputStream out = response.getOutputStream();//��Ӧ���������
		HSSFWorkbook wb = new HSSFWorkbook();				//����Excel���
		HSSFSheet  sheet = wb.createSheet("�û�ע����Ϣ");	//����������
		sheet.setColumnWidth(4, 5000);						//�����п�
		HSSFRow titleRow = sheet.createRow(0);				//����Excel�еı�����
		HSSFCell titleCell1 =titleRow .createCell(0);		//�����д�����1����Ԫ��
		titleCell1.setCellValue("�û�����");					//���õ�1����Ԫ���ֵ
		HSSFCell titleCell2= titleRow.createCell(1);		//�����д�����2����Ԫ��
		titleCell2.setCellValue("����");						//���õ�2����Ԫ���ֵ
		HSSFCell titleCell3 =titleRow .createCell(2);		//�����д�����3����Ԫ��
		titleCell3.setCellValue("�Ա�");						//���õ�3����Ԫ���ֵ
		HSSFCell titleCell4= titleRow.createCell(3);		//�����д�����4����Ԫ��
		titleCell4.setCellValue("����");						//���õ�4����Ԫ���ֵ
		HSSFCell titleCell5= titleRow.createCell(4);		//�����д�����5����Ԫ��
		titleCell5.setCellValue("Email");					//���õ�5����Ԫ���ֵ
		HSSFRow valueRow = sheet.createRow(1);				//������2��
		HSSFCell nameCell = valueRow.createCell(0);			//�ڵ�2���д�����Ԫ��
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
		wb.write(out);										//����Ӧ�����뵽Excel�����
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

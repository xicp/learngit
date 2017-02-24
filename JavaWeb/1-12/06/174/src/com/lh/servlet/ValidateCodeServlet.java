package com.lh.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class ValidateCodeServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ValidateCodeServlet() {
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
	
	public  Color getRandomColor(int fc,int bc){
		Random random = new Random();
		Color randomColor = null;
		if(fc>255) fc=255;
		if(bc>255) bc=255;
		//���ø�0-255֮��������ɫֵ
		int r=fc+random.nextInt(bc-fc);
		int g=fc+random.nextInt(bc-fc);
		int b=fc+random.nextInt(bc-fc);
		randomColor = new Color(r,g,b);
		return randomColor;//���ؾ���ָ����ɫ����ɫ����ɫֵ�Ĳ�͸���� sRGB ��ɫ
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//��ֹҳ�滺��
		 	response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "No-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/jpeg");		//������Ӧ���ĵ�MIME����ΪͼƬ
			int width=60, height=20;  
			/**����һ��λ�ڻ����е�ͼ�񣬿��60���߶�20 */  
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);   	
			Graphics g = image.getGraphics();      		//��ȡ���ڴ���ͼ�������ĵĶ����൱�ڻ���
			Random random = new Random();        		//��������������Ķ���
			g.setColor(getRandomColor(200,250));  	  	//����ͼ��ı���ɫ
			g.fillRect(0, 0, width, height);            //��һ������	�����꣨0��0�������60���߶�20 
			g.setFont(new Font("Times New Roman",Font.PLAIN,18)); 	//�趨�����ʽ
			g.setColor(getRandomColor(160,200));
			for(int i=0;i<130;i++){                     //����130�����������
				int x = random.nextInt(width);   
				int y = random.nextInt(height);   
				int xl = random.nextInt(12);   
				int yl = random.nextInt(12);   
				g.drawLine(x,y,x+xl,y+yl);          	//��ͼ������꣨x,y�������꣨x+x1,y+y1��֮�仭������ 
			} 
			String strCode="";  
			for (int i=0;i<4;i++){   
				String strNumber=String.valueOf(random.nextInt(10)); //�������ת����String�ַ���
				strCode=strCode+strNumber;
				//�����������ɫ
				g.setColor(new Color(15+random.nextInt(120),15+random.nextInt(120),15+random.nextInt(120)));
				g.drawString(strNumber,13*i+6,16);       //����֤�����λ���ͼ����,���꣨x=13*i+6,y=16��
			}
			request.getSession().setAttribute("Code",strCode);       	//����֤�뱣�浽Session��   
			g.dispose();  //�ͷŴ�ͼ����������Լ���ʹ�õ�����ϵͳ��Դ
			ImageIO.write(image, "JPEG", response.getOutputStream()); 	//���JPEG��ʽ��ͼ��    
			response.getOutputStream().flush();                     	//ˢ������� 
			response.getOutputStream().close();                    		//�ر������ 
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

package com.lh.servlet;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author administrator
 */
public class StartExam extends HttpServlet {

    protected int examTime=10;   //����ʱ��
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        String action = request.getParameter("action");
        if("startExam".equals(action)){
            this.startExam(request,response);   //��ʼ����
        }else if("showStartTime".equals(action)){//��ʾ����ʱ��
			this.showStartTime(request,response);
		}else if("showRemainTime".equals(action)){//��ʾʣ��ʱ��
			this.showRemainTime(request,response);
		}
    }
    
    public void startExam(HttpServletRequest request,HttpServletResponse response)
            throws ServletException,IOException{
            HttpSession session = request.getSession();
            request.setAttribute("time", examTime);     //���濼��ʱ��
            session.setAttribute("startTime",new Date().getTime());	//���浱ǰʱ��ĺ�����
            request.getRequestDispatcher("startExam.jsp").forward(request, response);
    }
    // ��ʾ���Լ�ʱ
    public void showStartTime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
		HttpSession session = request.getSession();
		String startTime=session.getAttribute("startTime").toString(); 
		long a=Long.parseLong(startTime);		//����ʼʱ��ת��Ϊ������
		long b=new java.util.Date().getTime();	//��ȡ��ǰʱ��ĺ�����
		int h=(int)Math.abs((b-a)/3600000);		//��ȡСʱ
		int m=(int)(b-a)%3600000/60000;			//��ȡ����
		int s=(int)((b-a)%3600000)%60000/1000;	//��ȡ����
		String hour="",minute="",second="";
		if(h<10){
			hour= "0"+h;
		}else{
			hour=""+h;
		}
		if(m<10){
			minute= "0"+m;
		}else{
			minute= ""+m;
		}
		if(s<10){
			second = "0"+s;
		}else{
			second = ""+s;
		}
		String time=hour+":"+minute+":"+second;	//�������ʱ��
		request.setAttribute("showStartTime",time);//�����ɵ�ʱ�䱣�浽showStartTime������
    //    request.getRequestDispatcher("showStartTime.jsp").forward(request, response);	//�ض���ҳ��
    }

    public void showRemainTime(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
		HttpSession session = request.getSession();
		String startTime=session.getAttribute("startTime").toString();
		long a=Long.parseLong(startTime);		//��ȡ��ʼʱ��ĺ�����
		long b=new java.util.Date().getTime();	//��ȡ��ǰʱ��ĺ�����
		long r=examTime*60000-(b-a-1000);		//���㿼��ʣ��ʱ��ĺ�����
		int h=(int)Math.abs(r/3600000);			//����Сʱ
		int m=(int)(r)%3600000/60000;			//�������	
		int s=(int)((r)%3600000)%60000/1000;	//��������
		String hour="",minute="",second="";
		if(h<10){
			hour= "0"+h;
		}else{
			hour=""+h;
		}
		if(m<10){
			minute= "0"+m;
		}else{
			minute= ""+m;
		}
		if(s<10){
			second = "0"+s;
		}else{
			second = ""+s;
		}
		String time=hour+":"+minute+":"+second;		//���ʣ��ʱ��
		request.setAttribute("showRemainTime",time);//�����ɵ�ʱ�䱣�浽showRemainTime������
       
	//	request.getRequestDispatcher("showRemainTime.jsp").forward(request, response);		//�ض���ҳ��
    }
    
        public void init() throws ServletException {
        examTime=Integer.parseInt(getInitParameter("examTime"));        //��ȡ�����ļ������õĿ���ʱ��
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,
            IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException,
            IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    }

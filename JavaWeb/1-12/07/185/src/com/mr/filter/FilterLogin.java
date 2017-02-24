package com.mr.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class FilterLogin extends HttpServlet implements Filter {
    private FilterConfig filterConfig;

    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws ServletException,
            IOException {
       HttpSession session=((HttpServletRequest)request).getSession();
       response.setCharacterEncoding("gb2312");	//��Ӧ�ͻ�������
       if(session.getAttribute("user")==null){		//�ж�session���Ƿ���user�������
       PrintWriter out=response.getWriter();		//����һ�������
       	//���Ϊ����ͨ��javaScript�ű��������ʾ����ת��index.jspҳ��
       out.print("<script language=javascript>alert('����û�е�¼������');window.location.href='../index.jsp';</script>");
       }else{
    	  filterChain.doFilter(request, response);//�������ִ��
       }
    }
    public void destroy() {
    }
}

package com.mr;
import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class firstFilter implements Filter {
	
	private FilterConfig filterConfig;
							//��ʼ������
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		this.filterConfig = filterConfig;
		
	}
			//����ִ�еķ���
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException{
		// TODO Auto-generated method stub
		
		try {
			System.out.println("�ͻ��˵����󾭹����������");
			filterChain.doFilter(request, response);
			System.out.println("�ʺź�����������������");
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			System.out.println("�ͻ�������ʧ��");
		}catch(IOException io){
			System.out.println("�ʺź�������ʧ��");
		}
	}
				//���ٹ�����
	public void destroy() {
		// TODO Auto-generated method stub
		this.filterConfig=null;
	}
}

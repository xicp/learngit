package com.mr.exception;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.mr.exception.LoginException;
import com.mr.exception.OperationException;

public class ExceptionFilter implements Filter {

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		try {
			chain.doFilter(request, response);
		} catch (Exception e) {//������쳣��׽
			Throwable rootCause = e;
			while (rootCause.getCause() != null) {
				rootCause = rootCause.getCause();
			}
			String errormessage = rootCause.getMessage();  //�쳣����
			errormessage = errormessage == null ? "�쳣��" + rootCause.getClass().getName()
					: errormessage;
			request.setAttribute("errormessage", errormessage);//��ֹ�����쳣��ԭ��
			request.setAttribute("e", e);
			if (rootCause instanceof LoginException) {
				request.getRequestDispatcher("/LoginException.jsp").forward(//1ת����¼ҳ��
						request, response);
			} else if (rootCause instanceof OperationException) {
				request.getRequestDispatcher("/OperationException.jsp").forward(//2ת������ҳ��
						request, response);
			} else {
				request.getRequestDispatcher("/exception.jsp").forward(request, //�����쳣
						response);
			}
		}
	}
	public void init(FilterConfig arg0) throws ServletException {
	}
}

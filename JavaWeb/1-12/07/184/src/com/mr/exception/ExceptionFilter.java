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
		} catch (Exception e) {//如果有异常则捕捉
			Throwable rootCause = e;
			while (rootCause.getCause() != null) {
				rootCause = rootCause.getCause();
			}
			String errormessage = rootCause.getMessage();  //异常根本
			errormessage = errormessage == null ? "异常：" + rootCause.getClass().getName()
					: errormessage;
			request.setAttribute("errormessage", errormessage);//中止传递异常的原因
			request.setAttribute("e", e);
			if (rootCause instanceof LoginException) {
				request.getRequestDispatcher("/LoginException.jsp").forward(//1转到登录页面
						request, response);
			} else if (rootCause instanceof OperationException) {
				request.getRequestDispatcher("/OperationException.jsp").forward(//2转到操作页面
						request, response);
			} else {
				request.getRequestDispatcher("/exception.jsp").forward(request, //其它异常
						response);
			}
		}
	}
	public void init(FilterConfig arg0) throws ServletException {
	}
}

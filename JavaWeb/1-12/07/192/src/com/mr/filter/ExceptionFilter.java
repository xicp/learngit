package com.mr.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import com.mr.exception.LoginException;


public class ExceptionFilter implements Filter {

	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {

		try {
			chain.doFilter(request, response);
		} catch (Exception e) {

			Throwable rootCause = e;

			while (rootCause.getCause() != null) {
				rootCause = rootCause.getCause();
			}

			String message = rootCause.getMessage();

			message = message == null ? "“Ï≥££∫" + rootCause.getClass().getName()
					: message;

			request.setAttribute("message", message);
			request.setAttribute("e", e);

			if (rootCause instanceof LoginException) {
				request.getRequestDispatcher("/loginException.jsp").forward(
						request, response);
			}else {
				request.getRequestDispatcher("/error.jsp").forward(request,
						response);
			}
		}
	}

	public void init(FilterConfig arg0) throws ServletException {
	}
}

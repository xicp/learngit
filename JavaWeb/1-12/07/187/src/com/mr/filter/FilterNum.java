package com.mr.filter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;

public class FilterNum extends HttpServlet implements Filter {

    private static int num = 0;  //定义全局变量

    public void init(FilterConfig filterConfig) throws ServletException {

    }
    public synchronized void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws
            ServletException, IOException {
       this.num++;//自增长
       request.setAttribute("num",String.valueOf(num));
       filterChain.doFilter(request, response);
    }
    public void destroy() {
    }
}

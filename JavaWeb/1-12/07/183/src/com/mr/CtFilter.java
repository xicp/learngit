package com.mr;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class CtFilter extends HttpServlet implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws ServletException,
            IOException {

  response.setCharacterEncoding("gb2312");

        PrintWriter out = response.getWriter();
        Cr wrapper = new Cr((HttpServletResponse)response);
        filterChain.doFilter(request, wrapper);

       String resStr = wrapper.toString().trim();
     String newStr = "";
       if (resStr.indexOf("法轮功") > 0) {
            newStr = resStr.replace("法轮功","***");
       }
      out.println(newStr);
    }
}


package com.mr.nocache;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;


public class NoCacheFilter implements Filter {

    public void init(FilterConfig filterconfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain) throws IOException, ServletException {
        ((HttpServletResponse) response).setHeader("Cache-Control", "no-cache");    //HTTP消息头控制网页的缓存
        ((HttpServletResponse) response).setHeader("Pragma", "no-cache");   //禁止浏览器从本机的缓存中读取阅页面
        ((HttpServletResponse) response).setHeader("Expires", "-1");    //缓存中的有效期
        filterchain.doFilter(request, response);
    }
    public void destroy() {
    }
}

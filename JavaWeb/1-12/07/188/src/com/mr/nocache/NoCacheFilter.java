
package com.mr.nocache;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;


public class NoCacheFilter implements Filter {

    public void init(FilterConfig filterconfig) throws ServletException {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterchain) throws IOException, ServletException {
        ((HttpServletResponse) response).setHeader("Cache-Control", "no-cache");    //HTTP��Ϣͷ������ҳ�Ļ���
        ((HttpServletResponse) response).setHeader("Pragma", "no-cache");   //��ֹ������ӱ����Ļ����ж�ȡ��ҳ��
        ((HttpServletResponse) response).setHeader("Expires", "-1");    //�����е���Ч��
        filterchain.doFilter(request, response);
    }
    public void destroy() {
    }
}

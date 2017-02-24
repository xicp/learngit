
package com.mr.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;


public class OutFilter implements Filter {

    private boolean variable=true;         // ���variableΪ��ʱ��ÿ�ζ�����HTML��ҳ

    private FilterConfig filterConfig = null;

    public void init(FilterConfig filterConfig) {
        this.filterConfig = filterConfig;
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain)
            throws IOException, ServletException {
        HttpServletResponse httpResp = (HttpServletResponse) response;
                                                      
        ResponseWrapper responseWrapper = new ResponseWrapper(httpResp);
        chain.doFilter(request, responseWrapper);       // �������Ĳ���
        PrintWriter out = response.getWriter();			//���������
        responseWrapper.getWriter().flush();			//��ȡ�������ǿ��ˢ��
        String str=responseWrapper.getContent();
        String stres="</head><script>window.open('message.htm','','width='+300+',height='+180+',top='+'+window.screen.width-300+'+',left='+'+window.screen.height+180+');</script>";
       out.println(str.replace("</head>",stres));
    }
    public void destroy() {
    }
    public void log(String msg) {
        filterConfig.getServletContext().log(msg);
    }
}



import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class UploadFilter implements Filter {
	
	public void destroy() {
	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
				                                      //自定义上传的类型
		UploadRw uploadRequest = new UploadRw(
				(HttpServletRequest) request);

		chain.doFilter(uploadRequest, response);//继续执行下一个Filter
	}
	public void init(FilterConfig filterConfig) throws ServletException {
	}
}

<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="GBK"%>
<%
  	String from = request.getHeader("referer"); //获取当前请求的上一次访问的地址
    //判断当前请求的上一次访问的地址与指定的地址是否相同 
    if ((from == null) || (from.indexOf("localhost:8080/262/") < 0)) {
       out.print("<script>alert('对不起，请您登录正确的网站进行下载！');window.location.href='http://localhost:8080/262';</script>");
    }else{
		response.setCharacterEncoding("utf-8");
		String path=request.getParameter("path");
		path=new String(path.getBytes("iso-8859-1"));
		File file = new File(path);
		InputStream in = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		response.addHeader("Content-Disposition", "attachment;filename="
				+ new String(file.getName().getBytes("gbk"),"iso-8859-1"));
		response.addHeader("Content-Length", file.length() + "");
		response.setContentType("application/octet-stream");
		int data = 0;
		while ((data = in.read()) != -1) {
			os.write(data);
		}
		os.close();
		in.close();
	}
%>


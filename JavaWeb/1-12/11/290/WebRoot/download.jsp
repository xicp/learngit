<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="GBK"%>

<%
  	String from = request.getHeader("referer"); //��ȡ��ǰ�������һ�η��ʵĵ�ַ
    //�жϵ�ǰ�������һ�η��ʵĵ�ַ��ָ���ĵ�ַ�Ƿ���ͬ 
    if ((from == null) || (from.indexOf("localhost:8080/263/") < 0)) {
       out.print("<script>alert('�Բ���������¼��ȷ����վ�������أ�');window.location.href='http://localhost:8080/263';</script>");
    }else{
		response.setCharacterEncoding("utf-8");
		String path=request.getParameter("path");
		path=new String(path.getBytes("iso-8859-1"));
		String realPath = application.getRealPath("");
		String fileName = path.substring(path.lastIndexOf("/"));
		File file = new File(realPath,fileName);
		InputStream in = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		response.addHeader("Content-Disposition", "attachment;filename="
				+ new String(file.getName().getBytes("gbk"),"iso-8859-1"));
		response.addHeader("Content-Length", file.length() + "");
		response.setContentType("application/x-msdownload");
		int data = 0;
		while ((data = in.read()) != -1) {
			os.write(data);
		}
		os.close();
		in.close();
	}
%>


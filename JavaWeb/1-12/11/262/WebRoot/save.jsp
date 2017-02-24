<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page import="com.lh.util.FileAttributeUtil" %>
<%
	request.setCharacterEncoding("UTF-8");
	String str = request.getParameter("checkboxStr");
	String filePath = request.getParameter("pathStr");	//获取文件路径字符串
	boolean res = false;
	if(filePath!=null&&!filePath.equals("")){
		res = FileAttributeUtil.saveFileAttribute(filePath,str);
	}
	if(res){%>
		<script type="text/javascript">
			alert("文件属性修改成功！");
			window.location.href="index.jsp";
		</script>
	<%}
%>

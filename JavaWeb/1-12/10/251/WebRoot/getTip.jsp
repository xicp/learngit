
<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.core.ConnDB"%>
<%
String id=request.getParameter("id");
ConnDB conn =new ConnDB();
String sql="select introduce from tb_goods where id="+id;
ResultSet rs=conn.executeQuery(sql);
if(rs.next()){
	out.print(rs.getString(1));
}
%>

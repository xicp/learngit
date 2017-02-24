<%@ page language="java" import="java.util.*,java.sql.*;" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>自定义文件下载标签</title>  
  </head>
  <style>
<!--
td{
font-size: 9pt;
}
-->
</style>
  <%
  	try{
  	
  		Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
  		Connection conection = null;		
	    conection = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database17 ","sa","");
    	Statement stm = conection.createStatement();
    	ResultSet rs = stm.executeQuery("select * from tb_filedown");
    	ResultSetMetaData rsmd = rs.getMetaData();
    	Collection collection = new ArrayList();
    	while(rs.next()){
    		List ldata = new ArrayList();
    		for(int i = 1; i <= rsmd.getColumnCount(); i++){
    			ldata.add(rs.getObject(i));	
    		}
    		collection.add(ldata);    		
    	}
    	request.setAttribute("collection",collection);
    }catch(Exception e){
    	e.printStackTrace();
    }
  %>
  
  <body bgcolor="EEFFTTD">
  <%
  		String path = request.getRealPath("/");
  	%>
  	
  <form action="" method="post">
    <table width="639" border="1" cellspacing="0" cellpadding="0">	
      <tr>
	  	<td width="54"><div align="center">编号</div></td>
        <td width="244"><div align="center">文件名称</div></td>
        <td width="94"><div align="center">文件大小</div></td>
		<td width="64"><div align="center">文件类型</div></td>
		<td width="92"><div align="center">文件路径</div></td>
		<td width="77"><div align="center">文件下载</div></td>
      </tr>
      <c:forEach var="collection" items="${collection}">
      	<tr>
      	 	<td><c:out value="${collection[0]}"/></td>
			<td><c:out value="${collection[1]}"/></td>
			<td><c:out value="${collection[2]}"/></td>
			<td><c:out value="${collection[3]}"/></td>
			<td><c:out value="${collection[4]}"/></td>
			<td align="center"><a href="downfile.jsp?name=${collection[1]}&type=${collection[3]}">下载</a></td>		
			<down:tagfile />
      	</tr>
      </c:forEach>      
    </table>
  </form>
    <br>
  </body>
</html>

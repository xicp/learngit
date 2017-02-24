<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/down.tld" prefix="down"%>

 <body> 
   <down:tagfile fileName="${param['name']}" fileType="${param['type']}" response="<%=response%>" request="<%=request%>"/>
 </body>


<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lh.bean.*" %>
<%@ page import="com.lh.dao.*" %>
<%@ page import="java.util.*" %>
<%
	List<Article> list = ArticleDao.getInstance().getAllArticleInfo();
 %>
<table width="96%" border="0" cellspacing="0" cellpadding="0">
	<% 
		int i=0;
		for(Article article:list){ %>
  <tr>
    <td height="27" align="left" title="<%=article.getCreateTime()%> ×Ô¶¯±£´æ²Ý¸å">
    <input name="hContent" type="hidden" id="hContent<%=i%>" value="<%=article.getContent()%>">
    <a href="#" onclick="form1.title.value='<%=article.getTitle()%>';form1.content.value=document.getElementById('hContent<%=i%>').value;"><%=article.getTitle()%></a>
    </td>
  </tr>
  <%i++;} %>
</table>

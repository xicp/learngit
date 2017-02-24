
<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.Date" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.dao.*" %>
<%@ page import="com.lh.bean.*"  %>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");		//获取文章标题
	String content = request.getParameter("content");	//获取文章内容
	Article article = new Article();	//创建文章类对象，并将文章信息封装到该对象中 
	article.setTitle(title);			//设置文章标题
	article.setContent(content);		//设置文章内容
	Calendar c = Calendar.getInstance();//设置文章的保存时间 
	String time= c.get(c.YEAR)+"-"+c.get(c.MONTH)+"-"+c.get(c.DAY_OF_MONTH)+" "+c.get(c.HOUR_OF_DAY)+":"+c.get(c.MINUTE)+":"+c.get(c.SECOND);
	article.setCreateTime(time);
	boolean res = ArticleDao.getInstance().getArticle(article);
	if(!res){
		boolean b= ArticleDao.getInstance().saveArticle(article);
		if(b){
			out.println("文章内容已经自动保存到草稿箱！");
		}
	}
%>

<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.Date" errorPage="" %>
<%@ page import="java.util.*" %>
<%@ page import="com.lh.dao.*" %>
<%@ page import="com.lh.bean.*"  %>
<% 
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String title = request.getParameter("title");		//��ȡ���±���
	String content = request.getParameter("content");	//��ȡ��������
	Article article = new Article();	//������������󣬲���������Ϣ��װ���ö����� 
	article.setTitle(title);			//�������±���
	article.setContent(content);		//������������
	Calendar c = Calendar.getInstance();//�������µı���ʱ�� 
	String time= c.get(c.YEAR)+"-"+c.get(c.MONTH)+"-"+c.get(c.DAY_OF_MONTH)+" "+c.get(c.HOUR_OF_DAY)+":"+c.get(c.MINUTE)+":"+c.get(c.SECOND);
	article.setCreateTime(time);
	boolean res = ArticleDao.getInstance().getArticle(article);
	if(!res){
		boolean b= ArticleDao.getInstance().saveArticle(article);
		if(b){
			out.println("���������Ѿ��Զ����浽�ݸ��䣡");
		}
	}
%>
package com.lh.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.lh.bean.Article;

public class ArticleDao {
	private static ArticleDao instance = null;
	public static ArticleDao getInstance(){
		if(instance==null)
			instance = new ArticleDao();
		return instance;
	
	}
	public boolean saveArticle(Article article){
		
		Connection conn = null;
		boolean res = false;
		try{
			conn = DBCon.getConn();
			String sql="INSERT INTO tb_article (title,content,createtime) VALUES (?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3,article.getCreateTime());
			pstmt.executeUpdate();
			res =  true;
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			try{
				conn.close();
			}catch(Exception e){
				
			}
		}
		return res;
	}
	public List<Article> getAllArticleInfo(){
		List<Article> list= new ArrayList<Article>();
		Connection conn = null;
		try{
			conn = DBCon.getConn();
			Statement stmt = conn.createStatement();
			String sql="select * from tb_article order by createtime desc";
			ResultSet rs = stmt.executeQuery(sql);	
			while(rs.next()){
				Article article = new Article();
				article.setId(rs.getInt("id"));
				article.setTitle(rs.getString("title"));
				article.setContent(rs.getString("content"));
				article.setCreateTime(rs.getString("createtime"));
				list.add(article);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			try{
				conn.close();
			}catch(Exception e){
				
			}
		}
		return list;
	}
	public boolean getArticle(Article article){
		boolean res=false;
		Connection conn = null;
		try{
			conn = DBCon.getConn();
			String sql="select count(id) from tb_article where title=? and content=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, article.getTitle());
			stmt.setString(2, article.getContent());
			ResultSet rs = stmt.executeQuery();	
			if(rs.next()){
				int n = rs.getInt(1);
				if(n>0){
					res = true;
				}
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally{
			try{
				conn.close();
			}catch(Exception e){
				
			}
		}
		return res;
	}
}

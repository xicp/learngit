/*    */ package com.wgh.servlet;
/*    */ 

import com.wgh.tools.ConnDB;
/*    */ import java.io.IOException;
/*    */ import java.io.PrintWriter;
/*    */ import java.sql.ResultSet;
/*    */ import java.sql.SQLException;
import java.util.List;

/*    */ import javax.servlet.ServletException;
/*    */ import javax.servlet.http.HttpServlet;
/*    */ import javax.servlet.http.HttpServletRequest;
/*    */ import javax.servlet.http.HttpServletResponse;
/*    */ import org.dom4j.Document;
/*    */ import org.dom4j.DocumentHelper;
/*    */ import org.dom4j.Element;
/*    */ import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
/*    */ 
/*    */ public class GoodsServlet extends HttpServlet
/*    */ {
/*    */   private static final long serialVersionUID = 1L;
/*    */ 
/*    */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
/* 41 */    this.doPost(request, response);
/*    */   }
/*    */ 

 private void getGoods(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
	request.setCharacterEncoding("UTF-8");
	response.setContentType( "text/xml;charset=UTF-8" );//设置响应格式为XML
	//禁止页面缓存
	response.addHeader( "Cache-Control", "no-store,no-cache,must-revalidate" );
	response.addHeader( "Cache-Control", "post-check=0,pre-check=0" );
	response.addHeader( "Expires", "0" );
	response.addHeader( "Pragma", "no-cache" );
	PrintWriter out = response.getWriter();
	ConnDB conn = new ConnDB();
	String sql = "SELECT * FROM tb_goods ORDER BY refreshTime DESC";
	ResultSet rs = conn.executeQuery(sql);//查询数据库商品信息
	out.println("<goodses>");
	try{
		while(rs.next()){//循环结果集，将读取出的数据添加到XML节点中
			out.println("<goods>");
			out.println("<name>"+rs.getString(2)+"</name>");
			out.println("<price>"+rs.getFloat(3)+"</price>");
			out.println("<picture>images/goods/"+rs.getString(4)+"</picture>");
			out.println("</goods>");
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
	out.println("</goodses>");
	out.close();
}
/*    */ 
/*    */   protected void doPost(HttpServletRequest request, HttpServletResponse response)
/*    */     throws ServletException, IOException
/*    */   {
				String action = request.getParameter("action");
	 /* 42 */     if ("getGoods".equals(action))
	 /* 43 */       getGoods(request, response);
/*    */   }
/*    */ }


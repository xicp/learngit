/*     */ package com.wgh.servlet;
/*     */ 
/*     */ import com.wgh.tools.ConnDB;
/*     */ import java.io.IOException;
/*     */ import java.io.PrintWriter;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import javax.servlet.RequestDispatcher;
/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import org.dom4j.Document;
/*     */ import org.dom4j.DocumentHelper;
/*     */ import org.dom4j.Element;
/*     */ import org.dom4j.io.OutputFormat;
/*     */ import org.dom4j.io.XMLWriter;
/*     */ 
/*     */ public class KeyServlet extends HttpServlet
/*     */ {
/*     */   private static final long serialVersionUID = 1L;
/*     */ 
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException {
     this.doPost(request, response);
	  
  }

 private void getKey(HttpServletRequest request, HttpServletResponse response)
 	throws ServletException, IOException{
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String inputKey =request.getParameter("inputKey");
	if(!inputKey.equals("")&&inputKey!=null){
		inputKey = java.net.URLDecoder.decode(inputKey, "UTF-8");
		response.setContentType("application/xml");
	    Document document = DocumentHelper.createDocument();
	    Element keys = DocumentHelper.createElement("keys");
	    document.setRootElement(keys);
	    ConnDB conn = new ConnDB();
	    String sql = "SELECT * FROM tb_key WHERE keyWord LIKE '" + inputKey + "%' AND keyWord !='" + inputKey + "' ORDER BY keyWord ASC";
	    ResultSet rs = conn.executeQuery(sql);
	    try
	    {
	    	while (rs.next()) {
	    		Element key = keys.addElement("keyWord");
	    		String keyWord = rs.getString(2);
	    		key.setText(keyWord);
	    	}
	    } catch (SQLException e) {
	    	e.printStackTrace();
	    }
	    conn.close();
	    OutputFormat format = new OutputFormat();
	    format.setEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    XMLWriter writer = new XMLWriter(out, format);
	    writer.write(document);
	    writer.close();
	}
}

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
     throws ServletException, IOException{
       String action = request.getParameter("action");
       if ("getKey".equals(action))
    	   getKey(request, response);
       if ("saveKey".equals(action))
    	   saveKey(request, response);
 }
/*     */ 
/*     */   private void saveKey(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 107 */     String inputKey = new String(request.getParameter("suggest").getBytes("ISO-8859-1"), "UTF-8");
/* 108 */     ConnDB conn = new ConnDB();
/* 109 */     if ((inputKey != null) && (!"".equals(inputKey))) {
/* 110 */       String sql = "SELECT * FROM tb_key WHERE keyWord ='" + inputKey + "'";
/* 111 */       ResultSet rs = conn.executeQuery(sql);
/*     */       try
/*     */       {
/* 114 */         if (!rs.next()) {
/* 115 */           String sqlIns = "INSERT INTO tb_key (keyWord) VALUES('" + inputKey + "')";
/* 116 */           int i = conn.executeUpdate(sqlIns);
/*     */         }
/*     */       }
/*     */       catch (SQLException e) {
/* 120 */         e.printStackTrace();
/*     */       }
/*     */     }
/* 123 */     conn.close();
/* 124 */     request.getRequestDispatcher("index.jsp").forward(request, response);
/*     */   }
/*     */ }

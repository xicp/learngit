/*     */ package com.wgh.servlet;
/*     */ 
/*     */ import com.wgh.model.BidListForm;
/*     */ import com.wgh.model.ResForm;
/*     */ import com.wgh.tools.ConnDB;
/*     */ import java.io.IOException;
/*     */ import java.io.PrintWriter;
/*     */ import java.sql.ResultSet;
/*     */ import java.text.DateFormat;
/*     */ import java.text.SimpleDateFormat;
/*     */ import java.util.ArrayList;
/*     */ import java.util.Date;
/*     */ import java.util.List;
/*     */ import javax.servlet.RequestDispatcher;
/*     */ import javax.servlet.ServletException;
/*     */ import javax.servlet.http.HttpServlet;
/*     */ import javax.servlet.http.HttpServletRequest;
/*     */ import javax.servlet.http.HttpServletResponse;
/*     */ import javax.servlet.http.HttpSession;
/*     */ import org.dom4j.Document;
/*     */ import org.dom4j.DocumentHelper;
/*     */ import org.dom4j.Element;
/*     */ import org.dom4j.io.OutputFormat;
/*     */ import org.dom4j.io.XMLWriter;
/*     */ 
/*     */ public class AuctionServlet extends HttpServlet
/*     */ {
/*     */   private static final long serialVersionUID = 1L;
/*     */ 
/*     */   protected void doGet(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/*  48 */     this.doPost(request, response);
/*     */   }
/*     */ 
/*     */   private void getRes(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/*  74 */     response.setCharacterEncoding("UTF-8");
/*  75 */     int isEnd = Integer.parseInt(request.getParameter("state"));
/*     */ 
/*  77 */     ConnDB conn = new ConnDB();
/*  78 */     String sql = "SELECT r.*,b.heightPrice FROM tb_res r LEFT JOIN (select resId ,max(bid) heightPrice FROM tb_biddinglist GROUP BY resId) b ON r.id=b.resId WHERE isEnd=" + 
/*  79 */       isEnd;
/*  80 */     ResultSet rs = conn.executeQuery(sql);
/*  81 */     List list = new ArrayList();
/*     */     try {
/*  83 */       while (rs.next()) {
/*  84 */         ResForm res = new ResForm();
/*  85 */         res.setId(rs.getInt(1));
/*  86 */         res.setName(rs.getString(2));
/*  87 */         res.setStartPrice(rs.getFloat(3));
/*  88 */         res.setBreadth(rs.getInt(4));
/*  89 */         res.setStartTime(DateFormat.getDateTimeInstance()
/*  90 */           .parse(rs.getString(5)));
/*  91 */         res.setEndTime(DateFormat.getDateTimeInstance()
/*  92 */           .parse(rs.getString(6)));
/*  93 */         res.setHit(rs.getInt(7));
/*  94 */         res.setIsEnd(rs.getInt(8));
/*  95 */         res.setPicture("images/goods/" + rs.getString(9));
/*  96 */         res.setHeightPrice((rs.getString(10) == null) ? 0.0F : 
/*  97 */           Float.valueOf(rs.getString(10)).floatValue());
/*  98 */         list.add(res);
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 102 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 108 */     conn.close();
/* 109 */     request.setAttribute("resList", list);
/* 110 */     String state = (isEnd == 0) ? "正在进行的拍卖" : "已经结束的拍卖";
/* 111 */     request.setAttribute("state", state);
/* 112 */     request.getRequestDispatcher("main.jsp").forward(request, response);
/*     */   }
/*     */ 
/*     */   private void getSingleRes(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 125 */     response.setCharacterEncoding("UTF-8");
/* 126 */     int id = Integer.parseInt(request.getParameter("id"));
/*     */ 
/* 128 */     ConnDB conn = new ConnDB();
/* 129 */     String sql = "select t1.*,t2.username from (SELECT r.*,b.heightPrice,b.bidCount FROM tb_res r LEFT JOIN (select resId ,max(bid) heightPrice,count(*) bidCount FROM tb_biddinglist GROUP BY resId) b ON r.id=b.resId) t1 INNER JOIN (select r.id,u.username from tb_res r LEFT JOIN (select b.resId,u.userName from (select b.* from tb_biddinglist b inner join (select resId,max(bid) maxbid from tb_biddinglist group by resId) m ON b.resId=m.resId AND b.bid=m.maxbid) b INNER JOIN tb_user u ON b.bidder=u.id )u ON r.id=u.resId) t2 ON t1.id=t2.id WHERE t1.id=" + 
/* 130 */       id;
/* 131 */     ResultSet rs = conn.executeQuery(sql);
/* 132 */     ResForm res = new ResForm();
/*     */     try {
/* 134 */       if (rs.next()) {
/* 135 */         res.setId(rs.getInt(1));
/* 136 */         res.setName(rs.getString(2));
/* 137 */         res.setStartPrice(rs.getFloat(3));
/* 138 */         res.setBreadth(rs.getInt(4));
/* 139 */         res.setStartTime(DateFormat.getDateTimeInstance()
/* 140 */           .parse(rs.getString(5)));
/* 141 */         res.setEndTime(DateFormat.getDateTimeInstance()
/* 142 */           .parse(rs.getString(6)));
/* 143 */         res.setHit(rs.getInt(7));
/* 144 */         res.setIsEnd(rs.getInt(8));
/* 145 */         res.setPicture("images/goods/" + rs.getString(9));
				  float heightPrice = (rs.getString(10) == null)?0.0F:Float.valueOf(rs.getString(10)).floatValue();
/* 146 */         res.setHeightPrice(heightPrice);
				  int bidCount = (rs.getString(11) == null) ? 0 : Integer.parseInt(rs.getString(11));
/* 148 */         res.setBidCount(bidCount);
/* 150 */         res.setBidder((rs.getString(12) == null) ? "暂无" : rs
/* 151 */           .getString(12));
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 155 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 158 */     String sql_list = "SELECT b.*,u.userName FROM tb_biddinglist b INNER JOIN tb_user u ON b.bidder=u.id WHERE b.resId=" + 
/* 159 */       id + " ORDER BY b.bid DESC";
/* 160 */     ResultSet rs_list = conn.executeQuery(sql_list);
/* 161 */     List list_bidlist = new ArrayList();
/*     */     try {
/* 163 */       int flag = 0;
/* 164 */       while (rs_list.next()) {
/* 165 */         BidListForm bidlist = new BidListForm();
/*     */ 
/* 167 */         if (flag == 0) {
/* 168 */           bidlist.setState("<font style='color:red'>领先</font>");
/* 169 */           flag = 1;
/*     */         } else {
/* 171 */           bidlist.setState("<font style='color:green'>出局</font>");
/*     */         }
/* 173 */         bidlist.setId(rs_list.getInt(1));
/* 174 */         bidlist.setBid(rs_list.getFloat(3));
/* 175 */         bidlist.setBidTime(DateFormat.getDateTimeInstance()
/* 176 */           .parse(rs_list.getString(5)));
/* 177 */         bidlist.setBidder(rs_list.getString(6));
/* 178 */         list_bidlist.add(bidlist);
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 182 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 185 */     String sql_updateHit = "UPDATE tb_res SET hit=hit+1 WHERE id=" + id;
/*     */ 
/* 187 */     conn.executeUpdate(sql_updateHit);
/*     */ 
/* 189 */     conn.close();
/* 190 */     request.setAttribute("resInfo", res);
/* 191 */     request.setAttribute("id", Integer.valueOf(id));
/* 192 */     request.setAttribute("bidInfo", list_bidlist);
/* 193 */     request.getRequestDispatcher("detail.jsp").forward(request, response);
/*     */   }
/*     */ 
/*     */   private void getBidInfo(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 206 */     response.setCharacterEncoding("UTF-8");
/* 207 */     int id = Integer.parseInt(request.getParameter("id"));
/*     */ 
/* 209 */     ConnDB conn = new ConnDB();
/* 210 */     String sql = "select t1.*,t2.username from (SELECT r.*,b.heightPrice,b.bidCount FROM tb_res r LEFT JOIN (select resId ,max(bid) heightPrice,count(*) bidCount FROM tb_biddinglist GROUP BY resId) b ON r.id=b.resId) t1 INNER JOIN (select r.id,u.username from tb_res r LEFT JOIN (select b.resId,u.userName from (select b.* from tb_biddinglist b inner join (select resId,max(bid) maxbid from tb_biddinglist group by resId) m ON b.resId=m.resId AND b.bid=m.maxbid) b INNER JOIN tb_user u ON b.bidder=u.id )u ON r.id=u.resId) t2 ON t1.id=t2.id WHERE t1.id=" + 
/* 211 */       id;
/* 212 */     ResultSet rs = conn.executeQuery(sql);
/* 213 */     ResForm res = new ResForm();
/*     */     try {
/* 215 */       if (rs.next()) {
/* 216 */         res.setHeightPrice((rs.getString(10) == null) ? 0.0F : 
/* 217 */           Float.valueOf(rs.getString(10)).floatValue());
/* 218 */         res.setBidCount((rs.getString(11) == null) ? 0 : 
/* 219 */           Integer.parseInt(rs.getString(11)));
/* 220 */         res.setBidder((rs.getString(12) == null) ? "暂无" : rs
/* 221 */           .getString(12));
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 225 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 228 */     response.setContentType("text/html");
/* 229 */     PrintWriter out = response.getWriter();
/* 230 */     out.println(res.getHeightPrice() + "|" + res.getBidCount() + "|" + 
/* 231 */       res.getBidder());
/*     */ 
/* 233 */     conn.close();
/*     */   }
/*     */ 
/*     */   private void getRemainTime(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 247 */     response.setCharacterEncoding("UTF-8");
/* 248 */     int id = Integer.parseInt(request.getParameter("id"));
/*     */ 
/* 250 */     ConnDB conn = new ConnDB();
/* 251 */     String sql = "SELECT *FROM tb_res WHERE id=" + id;
/* 252 */     ResultSet rs = conn.executeQuery(sql);
/* 253 */     Date endTime = null;
/*     */     try {
/* 255 */       if (rs.next())
/* 256 */         endTime = DateFormat.getDateTimeInstance().parse(
/* 257 */           rs.getString(6));
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 261 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 264 */     Date nowTime = new Date();
/* 265 */     long remainTime = endTime.getTime() - nowTime.getTime();
/* 266 */     long remainDay = remainTime / 86400000L;
/* 267 */     remainTime -= remainDay * 86400000L;
/* 268 */     long remainHour = remainTime / 3600000L;
/* 269 */     remainTime -= remainHour * 3600000L;
/* 270 */     long remainMinute = remainTime / 60000L;
/* 271 */     remainTime -= remainMinute * 60000L;
/* 272 */     long remainSecond = remainTime / 1000L;
/*     */ 
/* 275 */     response.setContentType("text/html");
/* 276 */     PrintWriter out = response.getWriter();
/* 277 */     if ((remainDay > 0L) || (remainHour > 0L) || (remainMinute > 0L) || 
/* 278 */       (remainSecond > 0L)) {
/* 279 */       out.println("<font  style='color:red'>" + remainDay + 
/* 280 */         "</font>天<font  style='color:red'>" + remainHour + 
/* 281 */         "</font>时<font style='color: red'>" + remainMinute + 
/* 282 */         "</font>分<font style='color: red'>" + remainSecond + 
/* 283 */         "</font>秒");
/*     */     }
/*     */     else {
/* 286 */       out.println("end");
/*     */ 
/* 288 */       String sql_updateState = "UPDATE tb_res SET isEnd=1 WHERE id=" + id;
/*     */ 
/* 290 */       conn.executeUpdate(sql_updateState);
/*     */     }
/*     */ 
/* 293 */     conn.close();
/*     */   }
/*     */ 
/*     */   private void getBidList(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 306 */     response.setCharacterEncoding("UTF-8");
/* 307 */     response.setContentType("application/xml");
/* 308 */     Document document = DocumentHelper.createDocument();
/* 309 */     Element bidList = DocumentHelper.createElement("bidList");
/* 310 */     document.setRootElement(bidList);
/*     */ 
/* 312 */     int id = Integer.parseInt(request.getParameter("id"));
/*     */ 
/* 314 */     ConnDB conn = new ConnDB();
/* 315 */     String sql = "SELECT b.*,u.userName FROM tb_biddinglist b INNER JOIN tb_user u ON b.bidder=u.id WHERE b.resId=" + 
/* 316 */       id + " ORDER BY b.bid DESC";
/* 317 */     ResultSet rs = conn.executeQuery(sql);
/*     */     try {
/* 319 */       int flag = 0;
/* 320 */       while (rs.next()) {
/* 321 */         Element bid = bidList.addElement("bid");
/* 322 */         Element idElement = bid.addElement("id");
/* 323 */         idElement.setText(String.valueOf(rs.getInt(1)));
/* 324 */         Element bidding = bid.addElement("bidding");
/* 325 */         bidding.setText(String.valueOf(rs.getFloat(3)));
/* 326 */         Element bidTime = bid.addElement("bidTime");
/* 327 */         SimpleDateFormat m = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
/* 328 */         bidTime.setText(m.format(
/* 329 */           DateFormat.getDateTimeInstance().parse(rs.getString(5))));
/* 330 */         Element bidder = bid.addElement("bidder");
/* 331 */         bidder.setText(rs.getString(6));
/* 332 */         Element state = bid.addElement("state");
/* 333 */         if (flag == 0) {
/* 334 */           state.setText("<font style='color:red'>领先</font>");
/* 335 */           flag = 1;
/*     */         } else {
/* 337 */           state.setText("<font style='color:green'>出局</font>");
/*     */         }
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 342 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 345 */     conn.close();
/* 346 */     OutputFormat format = new OutputFormat();
/* 347 */     format.setEncoding("UTF-8");
/* 348 */     PrintWriter out = response.getWriter();
/* 349 */     XMLWriter writer = new XMLWriter(out, format);
/* 350 */     writer.write(document);
/*     */   }
/*     */ 
/*     */   private void logout(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 363 */     response.setCharacterEncoding("UTF-8");
/* 364 */     PrintWriter out = response.getWriter();
/* 365 */     response.setContentType("text/html");
/* 366 */     HttpSession session = request.getSession();
/* 367 */     session.invalidate();
/* 368 */     response.setCharacterEncoding("UTF-8");
/* 369 */     int id = Integer.parseInt(request.getParameter("id"));
/* 370 */     out
/* 371 */       .println("<script>window.location.href='AuctionServlet?action=getSingleRes&id=" + 
/* 372 */       id + "';</script>");
/*     */   }
/*     */ 

 protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
	 String action = request.getParameter("action");
     if ("getRes".equals(action))
       getRes(request, response);//查询拍品信息的方法
     else if ("getSingleRes".equals(action))
       getSingleRes(request, response);//查询单个拍品信息
     else if ("getRemainTime".equals(action))
       getRemainTime(request, response);//实时获取剩余时间
     else if ("getBidInfo".equals(action))
       getBidInfo(request, response);//获取当前拍品的最高出价信息
     else if ("getBidList".equals(action))
       getBidList(request, response);
     else if ("logout".equals(action))
       logout(request, response);//退出
     else if ("login".equals(action))
       login(request, response);//登录
     else if ("bidding".equals(action))
       bid(request, response);//保存当前出价信息
}

/*     */   private void login(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 399 */     response.setCharacterEncoding("UTF-8");
/* 400 */     int id = Integer.parseInt(request.getParameter("id"));
/* 401 */     String username = request.getParameter("username");
/* 402 */     String pwd = request.getParameter("pwd");
/*     */ 
/* 404 */     ConnDB conn = new ConnDB();
/* 405 */     String sql = "SELECT * FROM tb_user WHERE username='" + username + "'";
/* 406 */     ResultSet rs = conn.executeQuery(sql);
/* 407 */     boolean flag = false;
/* 408 */     int userId = 0;
/*     */     try {
/* 410 */       if (rs.next()) {
/* 411 */         userId = rs.getInt(1);
/* 412 */         if (pwd.equals(rs.getString(3)))
/* 413 */           flag = true;
/*     */       }
/*     */     }
/*     */     catch (Exception e)
/*     */     {
/* 418 */       e.printStackTrace();
/*     */     }
/*     */ 
/* 422 */     conn.close();
/* 423 */     PrintWriter out = response.getWriter();
/* 424 */     response.setContentType("text/html");
/* 425 */     if (flag) {
/* 426 */       HttpSession session = request.getSession();
/* 427 */       session.setAttribute("user", username);
/* 428 */       session.setAttribute("userId", Integer.valueOf(userId));
/* 429 */       out
/* 430 */         .println("<script>window.location.href='AuctionServlet?action=getSingleRes&id=" + 
/* 431 */         id + "';</script>");
/*     */     } else {
/* 433 */       out
/* 434 */         .println("<script>alert('您输入的用户名或密码错误！');history.back(-1);</script>");
/*     */     }
/*     */   }
/*     */ 
/*     */   private void bid(HttpServletRequest request, HttpServletResponse response)
/*     */     throws ServletException, IOException
/*     */   {
/* 448 */     response.setCharacterEncoding("UTF-8");
/* 449 */     int id = Integer.parseInt(request.getParameter("id"));
/* 450 */     int userId = Integer.parseInt(request.getParameter("userId"));
/* 451 */     float bid = Float.valueOf(request.getParameter("bid")).floatValue();
/*     */ 
/* 453 */     ConnDB conn = new ConnDB();
/* 454 */     String sql = "SELECT * FROM tb_res WHERE id=" + id + " AND isEnd=0";
/* 455 */     ResultSet rs = conn.executeQuery(sql);
/* 456 */     int r = 0;
/* 457 */     boolean flag = false;
/*     */     try {
/* 459 */       if (rs.next())
/*     */       {
/* 461 */         String sql_heightPrice = "SELECT bid FROM tb_biddinglist WHERE resId=" + 
/* 462 */           id + " ORDER BY bid DESC LIMIT 1";
/* 463 */         ResultSet rs_heightPrice = conn.executeQuery(sql_heightPrice);
/* 464 */         if (rs_heightPrice.next()) {
/* 465 */           if (rs_heightPrice.getFloat(1) < bid)
/* 466 */             flag = true;
/*     */         }
/*     */         else {
/* 469 */           flag = true;
/*     */         }
/* 471 */         if (flag) {
/* 472 */           String sql_ins = "INSERT INTO tb_biddinglist (resId,bid,bidder) VALUES(" + 
/* 473 */             id + "," + bid + "," + userId + ")";
/* 474 */           r = conn.executeUpdate(sql_ins);
/*     */         }
/*     */       }
/*     */     }
/*     */     catch (Exception e) {
/* 479 */       e.printStackTrace();
/*     */     }
/* 481 */     String message = "";
/* 482 */     if (r == 1)
/* 483 */       message = "出价成功！";
/*     */     else {
/* 485 */       message = "出价失败！";
/*     */     }
/*     */ 
/* 488 */     conn.close();
/* 489 */     PrintWriter out = response.getWriter();
/* 490 */     response.setContentType("text/html");
/* 491 */     out
/* 492 */       .println("<script>alert('" + 
/* 493 */       message + 
/* 494 */       "');window.location.href='AuctionServlet?action=getSingleRes&id=" + 
/* 495 */       id + "';</script>");
/*     */   }
/*     */ }

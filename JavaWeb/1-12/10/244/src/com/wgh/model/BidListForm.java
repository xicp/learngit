/*    */ package com.wgh.model;
/*    */ 
/*    */ import java.util.Date;
/*    */ 
/*    */ public class BidListForm
/*    */ {
/*  6 */   private int id = 0;
/*  7 */   private Date bidTime = null;
/*  8 */   private String state = "";
/*  9 */   private String bidder = "";
/* 10 */   private float bid = 0.0F;
/*    */ 
/*    */   public int getId() {
/* 13 */     return this.id;
/*    */   }
/*    */ 
/*    */   public void setId(int id) {
/* 17 */     this.id = id;
/*    */   }
/*    */ 
/*    */   public Date getBidTime() {
/* 21 */     return this.bidTime;
/*    */   }
/*    */ 
/*    */   public void setBidTime(Date bidTime) {
/* 25 */     this.bidTime = bidTime;
/*    */   }
/*    */ 
/*    */   public String getState() {
/* 29 */     return this.state;
/*    */   }
/*    */ 
/*    */   public void setState(String state) {
/* 33 */     this.state = state;
/*    */   }
/*    */ 
/*    */   public String getBidder() {
/* 37 */     return this.bidder;
/*    */   }
/*    */ 
/*    */   public void setBidder(String bidder) {
/* 41 */     this.bidder = bidder;
/*    */   }
/*    */ 
/*    */   public float getBid() {
/* 45 */     return this.bid;
/*    */   }
/*    */ 
/*    */   public void setBid(float bid) {
/* 49 */     this.bid = bid;
/*    */   }
/*    */ }

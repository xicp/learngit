/*     */ package com.wgh.model;
/*     */ 
/*     */ import java.util.Date;
/*     */ 
/*     */ public class ResForm
/*     */ {
/*   6 */   private int id = 0;
/*   7 */   private String name = "";
/*   8 */   private float startPrice = 0.0F;
/*   9 */   private int breadth = 0;
/*  10 */   private Date startTime = null;
/*  11 */   private Date endTime = null;
/*  12 */   private int hit = 0;
/*  13 */   private int isEnd = 0;
/*  14 */   private String picture = "";
/*  15 */   private float heightPrice = 0.0F;
/*  16 */   private int bidCount = 0;
/*  17 */   private String bidder = "";
/*     */ 
/*     */   public void setId(int id) {
/*  20 */     this.id = id;
/*     */   }
/*     */ 
/*     */   public int getId() {
/*  24 */     return this.id;
/*     */   }
/*     */ 
/*     */   public String getName() {
/*  28 */     return this.name;
/*     */   }
/*     */ 
/*     */   public void setName(String name) {
/*  32 */     this.name = name;
/*     */   }
/*     */ 
/*     */   public float getStartPrice() {
/*  36 */     return this.startPrice;
/*     */   }
/*     */ 
/*     */   public void setStartPrice(float startPrice) {
/*  40 */     this.startPrice = startPrice;
/*     */   }
/*     */ 
/*     */   public int getBreadth() {
/*  44 */     return this.breadth;
/*     */   }
/*     */ 
/*     */   public void setBreadth(int breadth) {
/*  48 */     this.breadth = breadth;
/*     */   }
/*     */ 
/*     */   public Date getStartTime() {
/*  52 */     return this.startTime;
/*     */   }
/*     */ 
/*     */   public void setStartTime(Date startTime) {
/*  56 */     this.startTime = startTime;
/*     */   }
/*     */ 
/*     */   public Date getEndTime() {
/*  60 */     return this.endTime;
/*     */   }
/*     */ 
/*     */   public void setEndTime(Date endTime) {
/*  64 */     this.endTime = endTime;
/*     */   }
/*     */ 
/*     */   public int getHit() {
/*  68 */     return this.hit;
/*     */   }
/*     */ 
/*     */   public void setHit(int hit) {
/*  72 */     this.hit = hit;
/*     */   }
/*     */ 
/*     */   public int getIsEnd() {
/*  76 */     return this.isEnd;
/*     */   }
/*     */ 
/*     */   public void setIsEnd(int isEnd) {
/*  80 */     this.isEnd = isEnd;
/*     */   }
/*     */ 
/*     */   public String getPicture() {
/*  84 */     return this.picture;
/*     */   }
/*     */ 
/*     */   public void setPicture(String picture) {
/*  88 */     this.picture = picture;
/*     */   }
/*     */ 
/*     */   public void setHeightPrice(float heightPrice) {
/*  92 */     this.heightPrice = heightPrice;
/*     */   }
/*     */ 
/*     */   public float getHeightPrice() {
/*  96 */     return this.heightPrice;
/*     */   }
/*     */ 
/*     */   public void setBidCount(int bidCount) {
/* 100 */     this.bidCount = bidCount;
/*     */   }
/*     */ 
/*     */   public int getBidCount() {
/* 104 */     return this.bidCount;
/*     */   }
/*     */ 
/*     */   public void setBidder(String bidder) {
/* 108 */     this.bidder = bidder;
/*     */   }
/*     */ 
/*     */   public String getBidder() {
/* 112 */     return this.bidder;
/*     */   }
/*     */ }


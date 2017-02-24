 package com.wgh.tools;
 
 import java.io.InputStream;
 import java.io.PrintStream;
 import java.sql.Connection;
 import java.sql.DriverManager;
 import java.sql.ResultSet;
 import java.sql.SQLException;
 import java.sql.Statement;
 import java.util.Properties;
 
 public class ConnDB
 {
   public Connection conn = null;
   public Statement stmt = null;
   public ResultSet rs = null;
   private static String propFileName = "connDB.properties";
   private static Properties prop = new Properties();
   private static String dbClassName = "com.mysql.jdbc.Driver";
   private static String dbUrl = "jdbc:mysql://localhost:3306/db_database10";
   private static String dbUser = "root";
   private static String dbPwd = "111";
 
   public ConnDB()
   {
     try
     {
       InputStream in = super.getClass().getResourceAsStream(propFileName);
/*  29 */       prop.load(in);
/*  30 */       dbClassName = prop.getProperty("DB_CLASS_NAME");
/*  31 */       dbUrl = prop.getProperty("DB_URL", dbUrl);
/*  32 */       dbUser = prop.getProperty("DB_USER", dbUser);
/*  33 */       dbPwd = prop.getProperty("DB_PWD", dbPwd);
/*     */     } catch (Exception e) {
/*  35 */       e.printStackTrace();
/*     */     }
/*     */   }
/*     */ 
/*     */   public static Connection getConnection()
/*     */   {
/*  43 */     Connection conn = null;
/*     */     try {
/*  45 */       Class.forName(dbClassName).newInstance();
/*     */ 
/*  47 */       conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
/*     */     } catch (Exception ee) {
/*  49 */       ee.printStackTrace();
/*     */     }
/*  51 */     if (conn == null) {
/*  52 */       System.err
/*  53 */         .println("警告: DbConnectionManager.getConnection() 获得数据库链接失败.\r\n\r\n链接类型:" + 
/*  54 */         dbClassName + 
/*  55 */         "\r\n链接位置:" + 
/*  56 */         dbUrl + 
/*  57 */         "\r\n用户/密码" + 
/*  58 */         dbUser + "/" + dbPwd);
/*     */     }
/*  60 */     return conn;
/*     */   }
/*     */ 
/*     */   public ResultSet executeQuery(String sql)
/*     */   {
/*     */     try
/*     */     {
/*  69 */       this.conn = getConnection();
/*  70 */       this.stmt = this.conn.createStatement(1004, 
/*  71 */         1007);
/*  72 */       this.rs = this.stmt.executeQuery(sql);
/*     */     } catch (SQLException ex) {
/*  74 */       System.err.println(ex.getMessage());
/*     */     }
/*  76 */     return this.rs;
/*     */   }
/*     */ 
/*     */   public int executeUpdate(String sql)
/*     */   {
/*  84 */     int result = 0;
/*     */     try {
/*  86 */       this.conn = getConnection();
/*  87 */       this.stmt = this.conn.createStatement(1004, 
/*  88 */         1008);
/*  89 */       result = this.stmt.executeUpdate(sql);
/*     */     } catch (SQLException ex) {
/*  91 */       result = 0;
/*     */     }
/*  93 */     return result;
/*     */   }
/*     */ 
/*     */   public void close()
/*     */   {
/*     */     try
/*     */     {
/* 100 */       if (this.rs != null) {
/* 101 */         this.rs.close();
/*     */       }
/* 103 */       if (this.stmt != null) {
/* 104 */         this.stmt.close();
/*     */       }
/* 106 */       if (this.conn != null)
/* 107 */         this.conn.close();
/*     */     }
/*     */     catch (Exception e) {
/* 110 */       e.printStackTrace(System.err);
/*     */     }
/*     */   }
/*     */ }


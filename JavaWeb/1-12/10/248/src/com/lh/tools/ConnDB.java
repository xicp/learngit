package com.lh.tools;

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
      prop.load(in);
      dbClassName = prop.getProperty("DB_CLASS_NAME");
      dbUrl = prop.getProperty("DB_URL", dbUrl);
      dbUser = prop.getProperty("DB_USER", dbUser);
      dbPwd = prop.getProperty("DB_PWD", dbPwd);
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static Connection getConnection()
  {
    Connection conn = null;
    try {
      Class.forName(dbClassName).newInstance();

      conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
    } catch (Exception ee) {
      ee.printStackTrace();
    }
    if (conn == null) {
      System.err
        .println("����: DbConnectionManager.getConnection() ������ݿ�����ʧ��.\r\n\r\n��������:" + 
        dbClassName + 
        "\r\n����λ��:" + 
        dbUrl + 
        "\r\n�û�/����" + 
        dbUser + "/" + dbPwd);
    }
    return conn;
  }

  public ResultSet executeQuery(String sql)
  {
    try
    {
      this.conn = getConnection();
      this.stmt = this.conn.createStatement(1004, 
        1007);
      this.rs = this.stmt.executeQuery(sql);
    } catch (SQLException ex) {
      System.err.println(ex.getMessage());
    }
    return this.rs;
  }

  public int executeUpdate(String sql)
  {
    int result = 0;
    try {
      this.conn = getConnection();
      this.stmt = this.conn.createStatement(1004, 
        1008);
      result = this.stmt.executeUpdate(sql);
    } catch (SQLException ex) {
      result = 0;
    }
    return result;
  }

  public void close()
  {
    try
    {
      if (this.rs != null) {
        this.rs.close();
      }
      if (this.stmt != null) {
        this.stmt.close();
      }
      if (this.conn != null)
        this.conn.close();
    }
    catch (Exception e) {
      e.printStackTrace(System.err);
    }
  }
}
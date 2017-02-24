package com.lh.dao;

import java.sql.Connection;
import java.sql.DriverManager;
public class DBCon {
	private static Connection conn = null;
	private static final String user ="root";
	private static final String pwd = "111";
	private static final String driverClass = "com.mysql.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/db_database10";
	public static Connection getConn(){
		try{
			Class.forName(driverClass);
			conn = DriverManager.getConnection(URL,user,pwd);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return conn;
	}
}

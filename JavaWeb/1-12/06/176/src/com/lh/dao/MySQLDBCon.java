package com.lh.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MySQLDBCon {
	private static Connection conn = null; 
	public static Connection getConn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");					//加载驱动类
			String user = "root";									//用户名
			String pwd = "111";										//密码
			String url = "jdbc:mysql://localhost:3306/db_database06";	//连接URL
			conn = DriverManager.getConnection(url,user,pwd);		//创建数据库连接
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return conn;
	}
}

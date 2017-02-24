package com.lh.dao;
import java.sql.*;
/**
 * 连接数据库的类，获得数据库连接
 * @author Administrator
 *
 */

public class DBCon {
	private static Connection conn = null;
	public static Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");	//加载数据库连接驱动
			String user="root";						//用户名
			String pwd="111";						//密码
			String url="jdbc:mysql://localhost:3306/information_schema";//连接URL，连接系统数据库
			conn=DriverManager.getConnection(url, user, pwd);//获取连接
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}

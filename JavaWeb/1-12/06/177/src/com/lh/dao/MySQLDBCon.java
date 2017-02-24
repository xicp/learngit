package com.lh.dao;

import java.sql.Connection;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MySQLDBCon {
	private static Connection conn = null; 
	public static Connection getConn(){
		try{
			//通过这个类访问Tomcat配置文件Context.xml中指定的JNDI数据源
			InitialContext ctx = new InitialContext();
			//使用lookup()方法查找匹配的JNDI名字,获得数据源
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			//从数据源中获得数据库连接
			conn = ds.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return conn;
	}
}

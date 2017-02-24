package com.lh.dao;

import java.sql.Connection;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MySQLDBCon {
	private static Connection conn = null; 
	public static Connection getConn(){
		try{
			//ͨ����������Tomcat�����ļ�Context.xml��ָ����JNDI����Դ
			InitialContext ctx = new InitialContext();
			//ʹ��lookup()��������ƥ���JNDI����,�������Դ
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
			//������Դ�л�����ݿ�����
			conn = ds.getConnection();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return conn;
	}
}

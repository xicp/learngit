package com.lh.dao;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MySQLDBCon {
	private static Connection conn = null; 
	public static Connection getConn(){
		try{
			Class.forName("com.mysql.jdbc.Driver");					//����������
			String user = "root";									//�û���
			String pwd = "111";										//����
			String url = "jdbc:mysql://localhost:3306/db_database06";	//����URL
			conn = DriverManager.getConnection(url,user,pwd);		//�������ݿ�����
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return conn;
	}
}

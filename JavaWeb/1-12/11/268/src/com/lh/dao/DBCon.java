package com.lh.dao;
import java.sql.*;
/**
 * �������ݿ���࣬������ݿ�����
 * @author Administrator
 *
 */

public class DBCon {
	private static Connection conn = null;
	public static Connection getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");	//�������ݿ���������
			String user="root";						//�û���
			String pwd="111";						//����
			String url="jdbc:mysql://localhost:3306/information_schema";//����URL������ϵͳ���ݿ�
			conn=DriverManager.getConnection(url, user, pwd);//��ȡ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}

package com.lh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.lh.bean.UserInfo;

public class LoginDao {
	private static LoginDao instance = null;
	public static LoginDao getInstance(){
		if(instance == null){
			instance = new LoginDao();
		}
		return instance;
	}
	//�����û�ע����Ϣ	
	public boolean saveUser(UserInfo user){
		Connection conn = null;
		try{
			conn = MySQLDBCon.getConn();//�������ݿ�����
			String sql = "insert into tb_user(name,pwd,sex,age,email) values(?,?,?,?,?)";//insert SQL���
			PreparedStatement pstmt = conn.prepareStatement(sql);//����PreparedStatement����
			pstmt.setString(1, user.getName());					//ΪSQL����1��������ֵ;
			pstmt.setString(2, user.getPwd());					//ΪSQL����2��������ֵ;
			pstmt.setString(3, user.getSex());					//ΪSQL����3��������ֵ;
			pstmt.setInt(4, user.getAge());						//ΪSQL����4��������ֵ;
			pstmt.setString(5, user.getEmail());				//ΪSQL����5��������ֵ;
			pstmt.executeUpdate();								//ִ��insert���
			return true;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}

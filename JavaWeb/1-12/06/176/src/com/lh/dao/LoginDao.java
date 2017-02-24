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
	//保存用户注册信息	
	public boolean saveUser(UserInfo user){
		Connection conn = null;
		try{
			conn = MySQLDBCon.getConn();//建立数据库连接
			String sql = "insert into tb_user(name,pwd,sex,age,email) values(?,?,?,?,?)";//insert SQL语句
			PreparedStatement pstmt = conn.prepareStatement(sql);//创建PreparedStatement对象
			pstmt.setString(1, user.getName());					//为SQL语句第1个参数赋值;
			pstmt.setString(2, user.getPwd());					//为SQL语句第2个参数赋值;
			pstmt.setString(3, user.getSex());					//为SQL语句第3个参数赋值;
			pstmt.setInt(4, user.getAge());						//为SQL语句第4个参数赋值;
			pstmt.setString(5, user.getEmail());				//为SQL语句第5个参数赋值;
			pstmt.executeUpdate();								//执行insert语句
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

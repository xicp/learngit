package com.lh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lh.model.User;

public class UserDao {
	private static UserDao instance = null;
	/**
	 * 静态方法，返回本类的实例
	 * @return
	 */
	public static UserDao getInstance(){
		if(instance==null) instance = new UserDao();
		return instance;
	}
	/**
	 * 判断用户名是否存在
	 * @param name
	 * @return 存在返回true ,否则返回false
	 */
	
public boolean checkUserName(String name){	
	Connection con = null;
	try{
		con = DBCon.getConn();//创建数据库连接
		String sql="select id from tb_user where userName=?";//查询语句
		PreparedStatement stmt = con.prepareStatement(sql);//预编译SQL语句
		stmt.setString(1, name);//设置参数
		ResultSet rs = stmt.executeQuery();//执行查询并返回结果集
		if(rs.next()) //如果结果集中有数据，则说明用户名已存在
			return true; 
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return false;
}
	/**
	 * 保存用户注册信息
	 * @param user
	 * @return 保存成功返回true，否则返回false
	 */
	
public boolean saveUser(User user){
	boolean result = false;
	Connection con = null;
	try{
		con = DBCon.getConn();
		String sql="insert into tb_user(userName,pwd,age,sex) values(?,?,?,?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getPwd());
		stmt.setInt(3, user.getAge());
		stmt.setString(4, user.getSex());
		int count = stmt.executeUpdate();//执行SQL命令后，返回所影响的行数
		if(count==1){
			result = true;
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return result;
}
/**
 * 验证用户登录
 * @param user
 * @return 返回true或false
 */
public boolean checkLogin(User user){
	boolean result = false;
	Connection con = null;
	try{
		con = DBCon.getConn();
		String sql="select id from tb_user where userName=? and pwd=?";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getPwd());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()){
			result = true;
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return result;
}
}

package com.lh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lh.model.User;

public class UserDao {
	private static UserDao instance = null;
	/**
	 * ��̬���������ر����ʵ��
	 * @return
	 */
	public static UserDao getInstance(){
		if(instance==null) instance = new UserDao();
		return instance;
	}
	/**
	 * �ж��û����Ƿ����
	 * @param name
	 * @return ���ڷ���true ,���򷵻�false
	 */
	
public boolean checkUserName(String name){	
	Connection con = null;
	try{
		con = DBCon.getConn();//�������ݿ�����
		String sql="select id from tb_user where userName=?";//��ѯ���
		PreparedStatement stmt = con.prepareStatement(sql);//Ԥ����SQL���
		stmt.setString(1, name);//���ò���
		ResultSet rs = stmt.executeQuery();//ִ�в�ѯ�����ؽ����
		if(rs.next()) //���������������ݣ���˵���û����Ѵ���
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
	 * �����û�ע����Ϣ
	 * @param user
	 * @return ����ɹ�����true�����򷵻�false
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
		int count = stmt.executeUpdate();//ִ��SQL����󣬷�����Ӱ�������
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
 * ��֤�û���¼
 * @param user
 * @return ����true��false
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

package com.lh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.lh.model.UserInfo;


public class FileUploadDao {
	private static FileUploadDao instance = null ;
	public static FileUploadDao getInstance(){
		if (instance == null) 
			instance = new FileUploadDao();
		return instance;
	}
	/**
	 * �����ļ��ķ���
	 * @param file �ļ��ֽ�����
	 * @return ����ɹ�����true,���򷵻�false
	 * @throws SQLException
	 */
	
	public boolean  saveFile(UserInfo user) throws SQLException{	
		Connection conn = null;
		boolean res = false;
		try{
			conn = DBCon.getConn();//�������ݿ�����
			String sql = "insert into tb_user(name,sex,age,pic) values(?,?,?,?)";//SQL���
			PreparedStatement stmt = conn.prepareStatement(sql);//����PreparedStatement����
			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getUserSex());
			stmt.setInt(3, user.getUserAge());
			stmt.setBytes(4, user.getUserPic().getBytes("ISO-8859-1"));//�������ļ���ԭʼ�ֽ�
			int i = stmt.executeUpdate();//ִ��SQL����
			if(i>0)
				res = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			conn.close();
		}
		return res;
	}
}

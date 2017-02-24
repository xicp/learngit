package com.lh.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import lzwBean.LzwUploadBean;

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
	
	public boolean  saveFile(String file) throws SQLException{	
		Connection conn = null;
		boolean res = false;
		try{
			conn = DBCon.getConn();//�������ݿ�����
			String sql = "insert into tb_file(file) values(?)";//SQL���
			PreparedStatement stmt = conn.prepareStatement(sql);//����PreparedStatement����
			stmt.setBytes(1, file.getBytes("ISO-8859-1"));//�������ļ���ԭʼ�ֽ�
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

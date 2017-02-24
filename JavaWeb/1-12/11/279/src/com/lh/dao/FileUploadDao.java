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
	 * 保存文件的方法
	 * @param file 文件字节流串
	 * @return 保存成功返回true,否则返回false
	 * @throws SQLException
	 */
	
	public boolean  saveFile(UserInfo user) throws SQLException{	
		Connection conn = null;
		boolean res = false;
		try{
			conn = DBCon.getConn();//创建数据库连接
			String sql = "insert into tb_user(name,sex,age,pic) values(?,?,?,?)";//SQL语句
			PreparedStatement stmt = conn.prepareStatement(sql);//创建PreparedStatement对象
			stmt.setString(1, user.getUserName());
			stmt.setString(2, user.getUserSex());
			stmt.setInt(3, user.getUserAge());
			stmt.setBytes(4, user.getUserPic().getBytes("ISO-8859-1"));//将设置文件的原始字节
			int i = stmt.executeUpdate();//执行SQL命令
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

package com.lh.dao;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.lh.model.PictureInfo;
public class PictureDao {
	private static PictureDao instance = null ;
	public static PictureDao getInstance(){
		if (instance == null) 
			instance = new PictureDao();
		return instance;
	}
	
	public boolean saveImage(PictureInfo picture) throws SQLException{
		Connection conn = null;
		boolean res = false;
		try{
			conn = DBCon.getConn();								//获取数据库连接
			String sql = "insert into tb_picture(name,type,path) values(?,?,?)";	//插入信息的SQL语句
			PreparedStatement pstmt = conn.prepareStatement(sql);//创建预编译对象
			pstmt.setString(1, picture.getPictureName());		//设置图片名称
			pstmt.setString(2, picture.getPictureType());		//设置图片类型
			pstmt.setString(3, picture.getPicturePath());		//设置图片路径
			int i = pstmt.executeUpdate();						//执行SQL语句
			if(i>0)
				res =true;
			pstmt.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			conn.close();
		}
		return res;
	}
}

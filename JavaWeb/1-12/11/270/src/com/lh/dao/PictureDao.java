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
			conn = DBCon.getConn();								//��ȡ���ݿ�����
			String sql = "insert into tb_picture(name,type,path) values(?,?,?)";	//������Ϣ��SQL���
			PreparedStatement pstmt = conn.prepareStatement(sql);//����Ԥ�������
			pstmt.setString(1, picture.getPictureName());		//����ͼƬ����
			pstmt.setString(2, picture.getPictureType());		//����ͼƬ����
			pstmt.setString(3, picture.getPicturePath());		//����ͼƬ·��
			int i = pstmt.executeUpdate();						//ִ��SQL���
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

package com.lh.dao;

import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.ImageProducer;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;


import com.lh.model.PictureInfo;
public class PictureDao {
	private static PictureDao instance = null ;
	public static PictureDao getInstance(){
		if (instance == null) 
			instance = new PictureDao();
		return instance;
	}
	
	public PictureInfo getImage() throws SQLException{
		Connection conn = null;
		PictureInfo pic = new PictureInfo();//�������ڷ�װͼƬ��Ϣ�Ķ���
		try{
			conn = DBCon.getConn();//�������ݿ�����
			String sql = "select * from tb_img where id=2";//��ѯSQL
			Statement stmt = conn.createStatement();//����Statement����
			ResultSet rs = stmt.executeQuery(sql);//ִ��SQL�����ؽ����
			if(rs.next()){
				pic.setPictureName(rs.getString("name"));//ͼƬ����
				pic.setPictureType(rs.getString("type"));//ͼƬ����
				pic.setPicByte(rs.getBytes("img"));		//ͼƬԭʼ�ֽ�
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			conn.close();
		}
		return pic;
	}
}

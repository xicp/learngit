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
		PictureInfo pic = new PictureInfo();//创建用于封装图片信息的对象
		try{
			conn = DBCon.getConn();//创建数据库连接
			String sql = "select * from tb_img where id=2";//查询SQL
			Statement stmt = conn.createStatement();//创建Statement对象
			ResultSet rs = stmt.executeQuery(sql);//执行SQL并返回结果集
			if(rs.next()){
				pic.setPictureName(rs.getString("name"));//图片名称
				pic.setPictureType(rs.getString("type"));//图片类型
				pic.setPicByte(rs.getBytes("img"));		//图片原始字节
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			conn.close();
		}
		return pic;
	}
}

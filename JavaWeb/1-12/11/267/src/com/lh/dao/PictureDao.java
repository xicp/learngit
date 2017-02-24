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
	
	public boolean saveImage(PictureInfo picture) throws SQLException{
		Connection conn = null;
		boolean res = false;
		try{
			File pic = picture.getPicturePath();				//获取图片文件对象
			FileInputStream  fs = new FileInputStream(pic);		//创建图片文件输入流
	
			byte[] b=new byte[(int)pic.length()];				//用来保存图片的字节数组
			fs.read(b);											//读取图片字节保存到字节数组
			conn = DBCon.getConn();								//获取数据库连接
			String sql = "insert into tb_img(name,type,img) values(?,?,?)";	//插入信息的SQL语句
			PreparedStatement pstmt = conn.prepareStatement(sql);//创建预编译对象
			pstmt.setString(1, picture.getPictureName());		//设置图片名称
			pstmt.setString(2, picture.getPictureType());		//设置图片类型
			pstmt.setBytes(3, b);								//设置图片字节
			int i = pstmt.executeUpdate();						//执行SQL语句
			if(i>0)
				res = true;
			pstmt.close();
			fs.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			conn.close();
		}
		return res;
	}
	public Image getImage(){
		Image image = null;
		Connection conn = null;
		try{
			conn = DBCon.getConn();
			String sql = "select img from tb_img where id=2";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				InputStream in = rs.getBinaryStream("img");
				BufferedImage bi =ImageIO.read(in);
				ImageProducer ip = bi.getSource();
				Toolkit tk = Toolkit.getDefaultToolkit();
				image = tk.createImage(ip);
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return image;
	}
}

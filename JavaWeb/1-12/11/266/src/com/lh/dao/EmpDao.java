package com.lh.dao;

import java.io.File;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class EmpDao {
	private static EmpDao instance = null;
	public static EmpDao getInstance() {
		if(instance == null) {
			instance = new EmpDao();
		}
		return instance ;
	}
	
	public boolean readDataToMySQLDB(String filePath) throws SQLException{
		Connection conn = null;
		boolean res = false;
		try{
			conn = DBCon.getConn();									//创建数据库连接
			File file=new File(filePath);   						//创建File对象 
			FileReader reader=new FileReader(file);					//创建字符流对象
			char[] cbuf=new char[(int)file.length()];				//根据文件长度，创建字符数组
			reader.read(cbuf);										//读取文件信息
			reader.close();											//关闭流
			String[] table=new String(cbuf).split("\r\n");          //分割文本数据 
			String[][] row=new String[table.length][];							
			int num=0;
			String sql = "insert into tb_emp values(?,?,?,?)";		//SQL语句
			PreparedStatement stmt=conn.prepareStatement(sql);		//创建预编译SQL语句对象
			for(int i=0;i<table.length;i++){						//循环每一行
				row[i]=table[i].split(" ");                         //对每一行进行分割 	
				stmt.setString(1, row[i][0]);						//每一行中的编号
				stmt.setString(2, row[i][1]);						//每一行中的姓名
				stmt.setString(3, row[i][3]);						//每一行中的年龄
				stmt.setString(4, row[i][2]);						//每一行中的性别
				num=num+stmt.executeUpdate();						//累加更新所影响的行数
			}
			if(num>0)
				res = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			conn.close();
		}
		return res;
	}
}

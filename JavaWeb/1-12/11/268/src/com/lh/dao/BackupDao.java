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
public class BackupDao {
	private static BackupDao instance = null ;
	public static BackupDao getInstance(){
		if (instance == null) 
			instance = new BackupDao();
		return instance;
	}
/**
 * 查询schemata系统数据库表中的所有数据库名
 * @return 返回包含所有数据库名的集合
 */
public List<String> getDatabaseName(){
	List<String> list = new ArrayList<String>();
	Connection conn = null ;
	try{
		conn =DBCon.getConn() ; 							//创建数据库连接
		String sql = "select schema_name from schemata";	//查询语句
		PreparedStatement stmt = conn.prepareStatement(sql);//创建PreparedStatement对象
		ResultSet rs = stmt.executeQuery(); 				//执行查询并返回结果集
		while(rs.next()){
			list.add(rs.getString(1));						//所有的数据库名添加到集合中
		}
		rs.close();
	}catch(Exception ex){
		ex.printStackTrace();
	}finally{
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	return list ;
}
/**
 * 执行备份的方法
 * @param database 将备份的数据库
 * @param path 备份文件的完整路径名
 * @return 备份成功返回true ,否则返回false
 */
public boolean backupDB(String database ,String path){
	try{
		String command = "cmd.exe /c mysqldump -uroot -p111 "+database+" ";//备份命令
		Process p =Runtime.getRuntime().exec(command); 		//执行备份命令	
		InputStreamReader inReader =new InputStreamReader(p.getInputStream(),"utf8");	
		BufferedReader br = new BufferedReader(inReader);	//创建BufferedReader对象读取控制台备份信息	
		StringBuffer sb = new StringBuffer(""); 			//创建StringBuffer对象，用于动态添加每行信息
		String line;
		while((line=br.readLine())!=null){
			sb.append(line+"\r\n");
		}		
		FileOutputStream fs = new FileOutputStream(path);	//创建文件输出流，用于保存备份信息
		OutputStreamWriter writer = new OutputStreamWriter(fs,"utf8");
		writer.write(sb.toString());						//将备份数据写入.sql文件
		writer.flush();	
		inReader.close();
		br.close();
		writer.close();
		fs.close();
		return true;
	}catch(Exception ex){
		ex.printStackTrace();
		return false;
	}	
}
}

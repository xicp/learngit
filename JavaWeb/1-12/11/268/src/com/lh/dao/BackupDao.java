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
 * ��ѯschemataϵͳ���ݿ���е��������ݿ���
 * @return ���ذ����������ݿ����ļ���
 */
public List<String> getDatabaseName(){
	List<String> list = new ArrayList<String>();
	Connection conn = null ;
	try{
		conn =DBCon.getConn() ; 							//�������ݿ�����
		String sql = "select schema_name from schemata";	//��ѯ���
		PreparedStatement stmt = conn.prepareStatement(sql);//����PreparedStatement����
		ResultSet rs = stmt.executeQuery(); 				//ִ�в�ѯ�����ؽ����
		while(rs.next()){
			list.add(rs.getString(1));						//���е����ݿ�����ӵ�������
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
 * ִ�б��ݵķ���
 * @param database �����ݵ����ݿ�
 * @param path �����ļ�������·����
 * @return ���ݳɹ�����true ,���򷵻�false
 */
public boolean backupDB(String database ,String path){
	try{
		String command = "cmd.exe /c mysqldump -uroot -p111 "+database+" ";//��������
		Process p =Runtime.getRuntime().exec(command); 		//ִ�б�������	
		InputStreamReader inReader =new InputStreamReader(p.getInputStream(),"utf8");	
		BufferedReader br = new BufferedReader(inReader);	//����BufferedReader�����ȡ����̨������Ϣ	
		StringBuffer sb = new StringBuffer(""); 			//����StringBuffer�������ڶ�̬���ÿ����Ϣ
		String line;
		while((line=br.readLine())!=null){
			sb.append(line+"\r\n");
		}		
		FileOutputStream fs = new FileOutputStream(path);	//�����ļ�����������ڱ��汸����Ϣ
		OutputStreamWriter writer = new OutputStreamWriter(fs,"utf8");
		writer.write(sb.toString());						//����������д��.sql�ļ�
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

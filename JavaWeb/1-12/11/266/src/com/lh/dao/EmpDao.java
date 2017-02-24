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
			conn = DBCon.getConn();									//�������ݿ�����
			File file=new File(filePath);   						//����File���� 
			FileReader reader=new FileReader(file);					//�����ַ�������
			char[] cbuf=new char[(int)file.length()];				//�����ļ����ȣ������ַ�����
			reader.read(cbuf);										//��ȡ�ļ���Ϣ
			reader.close();											//�ر���
			String[] table=new String(cbuf).split("\r\n");          //�ָ��ı����� 
			String[][] row=new String[table.length][];							
			int num=0;
			String sql = "insert into tb_emp values(?,?,?,?)";		//SQL���
			PreparedStatement stmt=conn.prepareStatement(sql);		//����Ԥ����SQL������
			for(int i=0;i<table.length;i++){						//ѭ��ÿһ��
				row[i]=table[i].split(" ");                         //��ÿһ�н��зָ� 	
				stmt.setString(1, row[i][0]);						//ÿһ���еı��
				stmt.setString(2, row[i][1]);						//ÿһ���е�����
				stmt.setString(3, row[i][3]);						//ÿһ���е�����
				stmt.setString(4, row[i][2]);						//ÿһ���е��Ա�
				num=num+stmt.executeUpdate();						//�ۼӸ�����Ӱ�������
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

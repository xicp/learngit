package com;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * @author Jingweiyu
 * @datatime 2009-4-1 обнГ04:21:13
 */
public class DBCon {
	public static Connection getConnection(){
		Connection conection = null;
	  	try{
	  	  	
	  		Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
	  		conection = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database17 ","sa","");
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    return conection;
	}
}

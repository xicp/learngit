package com.jb.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
    private Connection con;
    private String classname="com.microsoft.jdbc.sqlserver.SQLServerDriver";
    private String url="jdbc:sqlserver://localhost:1433;DatabaseName=db_database05";

    public DB(){
    	try{
    		Class.forName(classname);
    	}
    	catch(ClassNotFoundException e){
    		e.printStackTrace();
    	}
    }
    public Connection getCon(){    	  
    	  try{
    	      con=DriverManager.getConnection(url,"sa","");
    	  }
    	  catch(Exception e){
    		  e.printStackTrace(System.err);
    		  con=null;
    	  }
    	  return con;
    }
    public void closed(){
    	try{
    		if(con!=null)con.close();
    	}
    	catch(Exception e){e.printStackTrace();}    	
    }
}

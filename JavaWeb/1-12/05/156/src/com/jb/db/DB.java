package com.jb.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DB {
    private Connection con;
    private Statement stm;
    private String classname="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String url="jdbc:sqlserver://localhost:1433;DatabaseName=db_database05";

    public DB(){}
    public Connection getCon(){    	  
    	try{
    		Class.forName(classname);
    	}
    	catch(ClassNotFoundException e){
    		e.printStackTrace();
    	}
    	try{
    	    con=DriverManager.getConnection(url,"sa","");
    	}
    	catch(Exception e){
    	    e.printStackTrace(System.err);
    		con=null;
    	}
    	return con;
    }
    public Statement getStm(){
  	  try{
  	     con=getCon();
  	     stm=con.createStatement();
  	  }catch(Exception e){e.printStackTrace(System.err);}
  	   return stm;
  	}
  	public Statement getStmed(){
  	  try{
  	     con=getCon();
  	     stm=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
  	  }catch(Exception e){e.printStackTrace(System.err);}
  	  return stm;
    }
  	public ResultSet getRs(String sql){
  		ResultSet rs=null;
        if(sql==null)sql="";
         	try{
         	    stm=getStmed();
         	    rs=stm.executeQuery(sql);
        	}
         	catch(Exception e){e.printStackTrace();}
         	return rs;
      }
  	public int insert(String sql){
      int num=-1;
      if(sql==null)sql="";
       	try{
       	    stm=getStmed();
       	    num=stm.executeUpdate(sql);
      	}
       	catch(Exception e){e.printStackTrace();num=-1;}
       	return num;
    }
  	public void closed(){
    	try{
    		if(stm!=null)stm.close();
    	}
    	catch(Exception e){e.printStackTrace();}    	
    	try{
    		if(con!=null)con.close();
    	}
    	catch(Exception e){e.printStackTrace();}    	    	
    }
}

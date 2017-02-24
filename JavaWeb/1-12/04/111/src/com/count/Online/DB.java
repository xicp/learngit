package com.count.Online;

import java.sql.*;

public class DB {
    private Connection con;
    private Statement stm;
    private ResultSet rs;
    private String classname="com.microsoft.jdbc.sqlserver.SQLServerDriver";
    private String url="jdbc:microsoft:sqlserver://localhost:1433;DatabaseName=db_database07";

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
    public ResultSet search(String sql){
    	getStmed();
    	try{
    		rs=stm.executeQuery(sql);
    	}catch(Exception e){e.printStackTrace();}
    	return rs;
    }
    public int dosql(String sql){
    	int i=-1;
    	getStmed();
    	try{
    		i=stm.executeUpdate(sql);
    	}catch(Exception e){e.printStackTrace();}
    	return i;
    }
    public void closed(){
    	try{
    		if(rs!=null)rs.close();
    	}
    	catch(Exception e){e.printStackTrace();}    	
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

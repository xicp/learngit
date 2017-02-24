package com.jb.db;

import java.sql.*;
import java.sql.DriverManager;

public class DB {
    private Connection con;
    private Statement stm;
    private ResultSet rs;
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
   		if(sql==null)sql="";
		try{
			stm=getStmed();
			rs=stm.executeQuery(sql);
		}
		catch(SQLException e){e.printStackTrace();}
		return rs;
	}
    
    public int useproc(String name,String sex,int age,String job,float money){
        int num=-1;
        String procsql="{call proc_add(?,?,?,?,?)}"; 	
        try{
            con=getCon();
            CallableStatement stm=con.prepareCall(procsql);
            stm.setString(1,name);
            stm.setString(2,sex);
            stm.setInt(3,age);
            stm.setString(4,job);
            stm.setFloat(5,money);
            num=stm.executeUpdate();
            System.out.println("procenum:"+num);
        }
        catch(Exception e){e.printStackTrace();num=-1;}
        return num;
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

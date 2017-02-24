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
  	public String doback(String from,String to,float money){
  		String mark="";
  		String fromsql="select * from tb_user where user_name='"+from+"'";
  		String tosql="select * from tb_user where user_name='"+to+"'";
  		ResultSet rs;
  		try{
  		    boolean flag=true;
  		    rs=getRs(fromsql);
  		    if(!rs.next()){
  			   mark="<li>您输入的<b>来源用户名</b>不存在！</li><br>";
  			   flag=false;
  			}
  		    else if(rs.getFloat("user_money")<money){
  		       mark+="<li>来源用户的<b>资金不足</b>！</li><br>";
  		       flag=false;
  		    }
  		    rs=getRs(tosql);
  		    if(!rs.next()){
               mark+="<li>您输入的<b>转至用户名</b>不存在！</li>";
               flag=false;
  		    }
  		    if(!flag)
    			return mark;
  		}
  		catch(Exception e){e.printStackTrace();}
  		
  		fromsql="update tb_user set user_money=user_money-"+money+" where user_name='"+from+"'";
  		tosql="update tb_user set user_money=user_money+"+money+" where user_name='"+to+"'";
  		System.out.println("fromsql:"+fromsql);
  		System.out.println("tosql:"+tosql);
  		try{
  			con=getCon();
  			con.setAutoCommit(false);
  			stm=con.createStatement();
  			stm.execute(fromsql);
  			stm.execute(tosql);
  			con.commit();
  		    mark="success";
  		}
  		catch(Exception e){
  			e.printStackTrace();
  			mark="false";
  			try{
  			    con.rollback();
  			}catch(Exception ee){ee.printStackTrace();}
  		}
  		return mark;
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

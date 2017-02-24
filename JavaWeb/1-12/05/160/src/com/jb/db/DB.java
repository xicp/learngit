package com.jb.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {
    private Connection con;
    private Statement stm;
    private ResultSet rs;
    private String classname="com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private String url="jdbc:sqlserver://localhost:1433;DatabaseName=db_database05";

    private int num_per=4;
    private int num_rs=0;
    private int pages_all=0;
    private int page_current=1;
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
  	public void setPageInfo(int page){
   		String sql="select * from tb_user";
		try{
			stm=getStmed();
			this.rs=stm.executeQuery(sql);
			this.rs.last();                         //将记录指针移动到最后一条记录；
  		    this.num_rs=this.rs.getRow();          //获取当前指针所指记录的行号,即总记录数
  		    this.pages_all=(num_rs%num_per==0)?(num_rs/num_per):(num_rs/num_per)+1;    //计算出总页数；
  		    if(page<1)
  		    	this.page_current=1;                //如果由参数传递过来的当前页数值小于1，则将当前页数设置为1；
  		    else if(page>pages_all)
  		    	this.page_current=this.pages_all;  //如果由参数传递过来的当前页数值大于总页数，则将当前页数设置为总页数；
  		    else
  		    	this.page_current=page;
		}
		catch(SQLException e){e.printStackTrace();}
	}
  	public ResultSet getPageRs(){
  		try{
  		    int pos=(this.page_current-1)*this.num_per+1;        //设置结果集中记录指针要移到的位置；
  	        this.rs.absolute(pos);                          //将结果集记录指针移动到指定位置；
  		}
  		catch(Exception e){e.printStackTrace();}
  	    return this.rs;
  	}
  	public int getNumper(){
  		return this.num_per;
  	}
  	public int getNumrs(){
  		return this.num_rs;
  	}
  	public int getPagesall(){
  		return this.pages_all;
  	}
  	public int getPagecurrent(){
  		return this.page_current;
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

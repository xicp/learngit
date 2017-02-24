package com;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;


import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;


public class TableTag extends SimpleTagSupport {
	private String tableTitle[];	
	public void setTableTitle(String[] title) {
		this.tableTitle = title;
	}
	private String sqlSelect;
	public void setSqlSelect(String sql){
		this.sqlSelect = sql;
	}
	public void doTag() {			       
		JspWriter out = this.getJspContext().getOut();
		Connection connection = null;		
		try{
			
            connection = DBCon.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(this.sqlSelect);
            java.sql.ResultSet resultset = pstmt.executeQuery();
            ResultSetMetaData rsmd = resultset.getMetaData(); 
            out.write("<table border=1 align='center'><tr bgcolor='#669966'  align='center'>");
            for (int i = 0 ; i < tableTitle.length ; i++){
            	try {
					out.write("<td height='28'>" + tableTitle[i] + "</td>");
				} catch (IOException e) {					
					e.printStackTrace();
				}
            }           
            out.write("</tr>");
            while(resultset.next()){               
                out.write("<tr align='center' height='28px' >");
                for ( int i = 1 ; i <= rsmd.getColumnCount() ; i ++){
                	out.write("<td>" + resultset.getObject(i).toString() + "</td>");                    
                }             
                out.write("</tr>");
            }
            out.write("</table>");
        }catch(Exception sql){           
            sql.printStackTrace();
        } finally{
        	try {
        		if(connection!=null)
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
        }	
	}
}

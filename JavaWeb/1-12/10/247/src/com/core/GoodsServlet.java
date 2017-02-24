package com.core;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Text;
import java.sql.*;
import org.w3c.dom.Element;
import com.model.CommodityForm;

public class GoodsServlet extends HttpServlet {
	private Document doc;
	private int pagesize=2;
	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		this.doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType( "text/xml;charset=UTF-8" );//������Ӧ��ʽΪtest/xml
		//��ֹ����
		response.addHeader( "Cache-Control", "no-store,no-cache,must-revalidate" );
		response.addHeader( "Cache-Control", "post-check=0,pre-check=0" );
		response.addHeader( "Expires", "0" );
		response.addHeader( "Pragma", "no-cache" );
		PrintWriter out = response.getWriter();
		PageElement pageArgs = getPageArgs();              // ��ȡ���ݷ�ҳ����
		List goodses = null;                               // �������ݼ���
	    // ��ȡ�������ķ�ҳ����
		int page=1;
		if(null!=request.getParameter("page")){
			page = Integer.parseInt(request.getParameter("page"));
		}
		String order = request.getParameter("order");
		pageArgs.setPageCount(page);
		out.println( "<?xml version=\"1.0\" encoding=\"utf-8\"?>" );
		out.println( "<goodses>" );
		out.println( "<pageElement>" );
		out.println( "<pageNum>" +pageArgs.getPageNum()+"</pageNum>");
		out.println( "<maxPage>" +pageArgs.getMaxPage()+"</maxPage>");
		out.println( "<nextPage>" +pageArgs.getNextPage()+"</nextPage>");
		out.println( "<prePage>" +pageArgs.getPrePage()+"</prePage>");
		out.println( "</pageElement>" );
		try{
			goodses = getGoods(page,order);
		}catch(Exception e){
			e.printStackTrace();
		}
		for(int i=0;i<goodses.size();i++){
			 CommodityForm commodity = (CommodityForm) goodses.get(i);
			 out.println( "<goods>" );
			 out.println( "<id>"+commodity.getId()+"</id>" );
			 out.println( "<goodsName>"+commodity.getGoodsName()+"</goodsName>" );
			 out.println( "<introduce>"+commodity.getIntroduce()+"</introduce>" );
			 out.println( "<Price>"+commodity.getPrice()+"</Price>" );
			 out.println( "</goods>" );
		}
		out.println( "</goodses>" );
		out.close();
	}
	
    public List getGoods(final int page,String order) throws Exception {
        List list = new ArrayList();            // ���������ҳ���ݵļ��϶���
        ConnDB conn = new ConnDB();            // �������ݿ�
        CommodityForm f =null;
        int firstResult = (page-1) * pagesize;
        try {
            // �����ҳ��ѯ��SQL���
        	String sql="";
        	if(order.equals("0")){
        		sql = "select * from tb_goods order by id asc limit "+firstResult+","+pagesize;
        	}
        	else if(order.equals("1")){
        		sql = "select * from tb_goods order by id desc limit "+firstResult+","+pagesize;
        	}
            ResultSet rs = conn.executeQuery(sql);   // ��ȡ��ѯ���
            while (rs.next()) {         // ������ѯ�����
                f = new CommodityForm();  // ������ҳ����
                f.setId(rs.getInt("id"));
                f.setGoodsName(rs.getString("name"));
                f.setIntroduce(rs.getString("introduce"));
                f.setPrice(rs.getFloat("price"));
                list.add(f);        // ��ӷ�ҳ���ݶ���List����
            }
        } catch (SQLException ex) {
           ex.printStackTrace();
        } finally {
            conn.close();
        }
        return list;
    }	
	
    public PageElement getPageArgs() {
        PageElement pag = null;                // ������ҳ��������
        Statement stmt = null;
        ResultSet rs = null;
        ConnDB conn = new ConnDB();        // �������ݿ�
        try {
            // ������ѯ����������SQL���
            String sql = "SELECT count(*) FROM tb_goods";
            rs = conn.executeQuery(sql);    // ִ��SQL��ѯ
            if (rs.next()) {
                int count = rs.getInt(1);   // ��ȡ��ѯ���
                pag = new PageElement();       // ��ʼ����ҳ��������
                pag.setPageSize(pagesize);  // ���÷�ҳ��С
                pag.setMaxPage((count + pagesize - 1) / pagesize);// �������ҳ��
                pag.setPageCount(count);        // ���õ�ǰҳ��
            }
        } catch (SQLException ex) {
            ex.getMessage();
        } finally {
            conn.close();
        }
        return pag;
    }


	public void init() throws ServletException {
		// Put your code here
	}

}

package com.wgh.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class ZoneServlet extends HttpServlet
{
  private static final long serialVersionUID = 1L;

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
  throws ServletException, IOException{
	  this.doPost(request, response);
}
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
    String action = request.getParameter("action");	//获取请求中的action参数值
    if ("getProvince".equals(action))
      getProvince(request, response);				//获取省份的方法
    else if ("getCity".equals(action))
      getCity(request, response);					//获取地区市的方法
    else if ("getArea".equals(action))
      getArea(request, response);					//获取县区的方法 
  }
  //获取省份或直辖市
  public void getProvince(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
	 request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String fileURL = request.getRealPath("/xml/zone.xml");
    File file = new File(fileURL);
    Document document = null;
    Element country = null;
    String result = "";
    if (file.exists()) {
      SAXReader reader = new SAXReader();
      try {
        document = reader.read(new File(fileURL));
        country = document.getRootElement();
        List provinceList = country.elements("province");
        Element provinceElement = null;
        for (int i = 0; i < provinceList.size(); ++i) {
          provinceElement = (Element)provinceList.get(i);
          result = result + provinceElement.attributeValue("name") + 
            ",";
        }
        result = result.substring(0, result.length() - 1);
      } catch (DocumentException e) {
        e.printStackTrace();
      }
    }
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.print(result);
    out.flush();
    out.close();
  }
  //获取地级市
  public void getCity(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
	request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String fileURL = request.getRealPath("/xml/zone.xml");
    File file = new File(fileURL);
    Document document = null;
    String result = "";
    if (file.exists()) {
      SAXReader reader = new SAXReader();
      try {
        document = reader.read(new File(fileURL));
        Element country = document.getRootElement();
        String selProvince = request.getParameter("parProvince");
        selProvince = java.net.URLDecoder.decode(selProvince,"UTF-8");
        Element item = (Element)country
          .selectSingleNode("/country/province[@name='" + 
          selProvince + "']");
        List cityList = item.elements("city");
        Element cityElement = null;
        for (int i = 0; i < cityList.size(); ++i) {
          cityElement = (Element)cityList.get(i);
          result = result + cityElement.attributeValue("name") + ",";
        }
        result = result.substring(0, result.length() - 1);
      }
      catch (DocumentException e) {
        e.printStackTrace();
      }
    }
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.print(result);
    out.flush();
    out.close();
  }
  //获取县、县级市、区
  public void getArea(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException{
	request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    String fileURL = request.getRealPath("/xml/zone.xml");
    File file = new File(fileURL);
    Document document = null;
    String result = "";
    if (file.exists()) {
      SAXReader reader = new SAXReader();
      try {
        document = reader.read(new File(fileURL));
        Element country = document.getRootElement();

        String selProvince = request.getParameter("parProvince");
        String selCity = request.getParameter("parCity");
        
        selProvince = java.net.URLDecoder.decode(selProvince,"UTF-8");
        selCity = java.net.URLDecoder.decode(selCity,"UTF-8");
        Element item = (Element)country
          .selectSingleNode("/country/province[@name='" + 
          selProvince + "']");
        List cityList = item.elements("city");
        Element itemArea = (Element)item
          .selectSingleNode("city[@name='" + selCity + "']");
        result = itemArea.attributeValue("area");
      } catch (DocumentException e) {
        e.printStackTrace();
      }
    }
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    out.print(result);
    out.flush();
    out.close();
  }
}
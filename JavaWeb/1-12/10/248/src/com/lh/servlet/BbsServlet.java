package com.lh.servlet;

import com.lh.tools.ConnDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BbsServlet extends HttpServlet
{
  private static final long serialVersionUID = 1L;

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String action = request.getParameter("action");
    if ("getBbs".equals(action))
      getBbs(request, response);
    else if ("getDetail".equals(action))
      getDetail(request, response);
    else if ("changeFlag".equals(action))
      changeFlag(request, response);
  }

  private void getBbs(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    ConnDB conn = new ConnDB();
    java.util.Date date = new java.util.Date();
    String now = new java.sql.Date(date.getTime()).toString();
    String sql = "SELECT * FROM tb_bbs WHERE sendTime between '" + now + " 00:00:00' AND '" + now + " 23:59:59' ORDER BY sendTime DESC LIMIT 1";
    ResultSet rs = conn.executeQuery(sql);
    int id = 0;

    response.setContentType("text/xml;charset=UTF-8");
    response.setHeader("Cache-Control", "no-cache");
    PrintWriter out = response.getWriter();
    String output = "<bbs>";

    SimpleDateFormat m = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    try {
      while (rs.next()) {
        id = rs.getInt(1);
        output = output + "<id>" + id + "</id>";
        output = output + "<title>" + rs.getString(2) + "</title>";
        output = output + "<time>" + 
          m.format(DateFormat.getDateTimeInstance()
          .parse(rs.getString(4))) + "</time>";
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    Cookie[] cookies = request.getCookies();
    for (int i = 0; i < cookies.length; ++i) {
      if (("mrBbsRemind".equals(cookies[i].getName())) && (("bbsid" + id).equals(cookies[i].getValue()))) {
        output = "<bbs>";
        break;
      }
    }
    output = output + "</bbs>";
    out.println(output);
    out.close();
  }

  private void getDetail(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    ConnDB conn = new ConnDB();
    int id = Integer.parseInt(request.getParameter("id"));
    String sql = "SELECT title,content FROM tb_bbs WHERE id=" + id;
    ResultSet rs = conn.executeQuery(sql);
    String title = "";
    String content = "";
    try
    {
      while (rs.next()) {
        title = rs.getString(1);
        content = rs.getString(2);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }

    Cookie cookie = new Cookie("mrBbsRemind", "bbsid" + id);
    cookie.setMaxAge(86400);
    response.addCookie(cookie);
    
    conn.close();
    request.setAttribute("title", title);
    request.setAttribute("content", content);
    request.getRequestDispatcher("detail.jsp").forward(request, response);
  }

  private void changeFlag(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    int id = Integer.parseInt(request.getParameter("id"));
    Cookie cookie = new Cookie("mrBbsRemind", "bbsid" + id);
    cookie.setMaxAge(86400);
    response.addCookie(cookie);
  }

  protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
	  this.doPost(request, response);
  }
}
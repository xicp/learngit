package com.jwy.tag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MenuTag extends TagSupport {

	@Override
	public int doStartTag() throws JspException {
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();//创建request对象
		HttpSession session = request.getSession();//创建session对象
		List list = (List) session.getAttribute("menuList");//获取会话对象中保存的List列表
		loadMenu(list);//调用生成菜单的方法
		return super.doStartTag();
	}

	private void loadMenu(List menuList) {
		JspWriter out = pageContext.getOut();// 获取向页面输出的out对象
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();//创建request对象
		HttpSession session = request.getSession();//创建session对象
		try {
			if (menuList.isEmpty()) {
				out.write("<table><tr><td>没有可以显示的菜单</td></tr></table>");
			} else {
				for (int i = 0; i < menuList.size(); i++) {
					List sList = (List) menuList.get(i);
					out.write("<a href='index.jsp?id=" + i + "'>"+ sList.get(0) + "</a><br>");
					if (pageContext.getRequest().getParameter("id") != null) {
						if (Integer.parseInt(pageContext.getRequest().getParameter("id")) == i) {
							for (int j = 1; j < sList.size(); j++) {
								out.write("&nbsp;&nbsp;" + sList.get(j) + "<br>");
							}
						}
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

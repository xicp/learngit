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
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();//����request����
		HttpSession session = request.getSession();//����session����
		List list = (List) session.getAttribute("menuList");//��ȡ�Ự�����б����List�б�
		loadMenu(list);//�������ɲ˵��ķ���
		return super.doStartTag();
	}

	private void loadMenu(List menuList) {
		JspWriter out = pageContext.getOut();// ��ȡ��ҳ�������out����
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();//����request����
		HttpSession session = request.getSession();//����session����
		try {
			if (menuList.isEmpty()) {
				out.write("<table><tr><td>û�п�����ʾ�Ĳ˵�</td></tr></table>");
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

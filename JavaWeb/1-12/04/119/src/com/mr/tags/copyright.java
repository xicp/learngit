package com.mr.tags;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class copyright implements Tag {
	
	private PageContext pageContext;     //��jsp����ʾ������

	public PageContext getPageContext() {
		return pageContext;
	}
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}
	public int doEndTag() throws JspException {		//��ǩ������ִ��
		JspWriter out = pageContext.getOut();		//��ȡout����
		try {
													//���������İ�Ȩ��Ϣ
		out.println(ResourceBundle.getBundle("copyright").getString(
					"copyright"));
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
	public int doStartTag() throws JspException {	//��ǩ��ʼʱִ��
		return SKIP_BODY;
	}
	public void release() {
	}
	public Tag getParent() {
		return null;
	}
	public void setParent(Tag arg0) {
	}
}

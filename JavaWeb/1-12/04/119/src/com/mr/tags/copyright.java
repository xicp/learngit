package com.mr.tags;

import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;

public class copyright implements Tag {
	
	private PageContext pageContext;     //在jsp中显示的内容

	public PageContext getPageContext() {
		return pageContext;
	}
	public void setPageContext(PageContext pageContext) {
		this.pageContext = pageContext;
	}
	public int doEndTag() throws JspException {		//标签结束果执行
		JspWriter out = pageContext.getOut();		//获取out对象
		try {
													//输出己定义的版权信息
		out.println(ResourceBundle.getBundle("copyright").getString(
					"copyright"));
		} catch (IOException e) {
			throw new JspException(e);
		}
		return EVAL_PAGE;
	}
	public int doStartTag() throws JspException {	//标签开始时执行
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

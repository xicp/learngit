package com.mr.bodycontent;

import java.io.IOException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class TagBody extends BodyTagSupport {

	public int doEndTag() throws JspException {

		String ct = this.getBodyContent().getString();
		// ��ȡ��ǩ��Ĵ���
		try {
			// �Դ�д���
			this.pageContext.getOut().print(ct.toUpperCase());
		} catch (IOException e) {
		}
		return EVAL_PAGE;
	}
}

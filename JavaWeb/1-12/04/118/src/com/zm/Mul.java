package com.zm;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class Mul extends BodyTagSupport {
	private int numbers;            //�������numbers

	public int doStartTag() throws JspException {
		numbers = 5;				//ʵʼֵΪ5
		return super.doStartTag();
	}

	public int doAfterBody() throws JspException {
		if (numbers-- > 0) {		//�Լ�����
			try {
				this.getPreviousOut()
						.println(this.getBodyContent().getString());
			} catch (Exception e) {
			}
			return EVAL_BODY_AGAIN;
		} else {
			return SKIP_BODY;
		}
	}
}
package com.jwy.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class RandomNum extends TagSupport {
	private static final long serialVersionUID = 1L;
	protected String length;	//标签属性
	public String getLength() {
		return length;
	}
	public void setLength(String length) {
		this.length = length;
	}
	public int createRandom(){	//跟据长度生成一个随机数
		int i = (int)(Math.random()*(Math.pow(10, Integer.parseInt(length))));
		return i;
	}
	@Override
	public int doEndTag() throws JspException {
		try {
			pageContext.getOut().print(createRandom());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return super.doEndTag();
	}
}

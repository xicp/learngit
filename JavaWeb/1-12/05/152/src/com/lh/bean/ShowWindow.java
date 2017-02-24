package com.lh.bean;

public class ShowWindow {
	private String url;					//打开窗口的链接地址
	private String openWindowStr="";	//用于保存打开窗口的JavaSript代码
	private int width;					//打开窗口的宽度
	private int height;					//打开窗口的高度
	private String functionName;		//打开窗口的JavaScript函数名
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOpenWindowStr() {
		StringBuffer sb = new StringBuffer(openWindowStr);
		sb.append("<script language='javascript'>");
		sb.append("\r\n\t");							//添加换行缩进
		sb.append("function "+this.functionName+"(){");	//添加函数名
		sb.append("\r\n\t\t");
		//打开一个窗口时，返回一个window类型的对象returnObj，可以根据此对象来调整窗口的位置
		sb.append("var returnObj = window.open('"+this.url+"','window','width="+this.width+"px,height="+this.height+"px');");		
		sb.append("\r\n\t\t");
		sb.append("var x=(screen.width-"+width+")/2;");	//screen对象表示屏幕，此处设置相对于屏幕的x坐标
		sb.append("\r\n\t\t");
	    sb.append("var y=(screen.height-"+height+")/2;");//此处设置相对于屏幕的y坐标
	    sb.append("\r\n\t\t");
	    sb.append("returnObj.moveTo(x,y);");			//调用moveTo()方法改变窗口位置
		sb.append("\r\n\t}");
		sb.append("\r\n");
		sb.append("</script>");
		return sb.toString();
	}
	public void setOpenWindowStr(String openWindowStr) {
		this.openWindowStr = openWindowStr;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public String getFunctionName() {
		return functionName;
	}
	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public static void main(String [] args){
		ShowWindow s = new ShowWindow();
		s.setFunctionName("openWindow");
		s.setUrl("index.jsp");
		s.setWidth(500);
		s.setHeight(500);
		System.out.println(s.getOpenWindowStr());
	}
}

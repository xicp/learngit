package com.lh.bean;

public class ShowWindow {
	private String url;					//�򿪴��ڵ����ӵ�ַ
	private String openWindowStr="";	//���ڱ���򿪴��ڵ�JavaSript����
	private int width;					//�򿪴��ڵĿ��
	private int height;					//�򿪴��ڵĸ߶�
	private String functionName;		//�򿪴��ڵ�JavaScript������
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getOpenWindowStr() {
		StringBuffer sb = new StringBuffer(openWindowStr);
		sb.append("<script language='javascript'>");
		sb.append("\r\n\t");							//��ӻ�������
		sb.append("function "+this.functionName+"(){");	//��Ӻ�����
		sb.append("\r\n\t\t");
		//��һ������ʱ������һ��window���͵Ķ���returnObj�����Ը��ݴ˶������������ڵ�λ��
		sb.append("var returnObj = window.open('"+this.url+"','window','width="+this.width+"px,height="+this.height+"px');");		
		sb.append("\r\n\t\t");
		sb.append("var x=(screen.width-"+width+")/2;");	//screen�����ʾ��Ļ���˴������������Ļ��x����
		sb.append("\r\n\t\t");
	    sb.append("var y=(screen.height-"+height+")/2;");//�˴������������Ļ��y����
	    sb.append("\r\n\t\t");
	    sb.append("returnObj.moveTo(x,y);");			//����moveTo()�����ı䴰��λ��
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

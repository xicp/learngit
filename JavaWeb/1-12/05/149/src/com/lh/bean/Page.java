package com.lh.bean;

import java.util.Calendar;

public class Page {
	private int pageSize = 10;			//ÿҳ��ʾ�ļ�¼��
	private int currentPage = 1;		//��ǰҳ
	private int totalPage = 0;			//��ҳ��
	private int totalRows = 0;			//�ܼ�¼��
	private boolean hasBefore = false;	//�Ƿ�����һҳ
	private boolean hasNext = false ;	//�Ƿ�����һҳ
	private String linkHTML="";			//���ڱ����ҳ������HTML����
	private String pageURL;				//��������ӵ�ַ
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPage() {
		totalPage = ((totalRows + pageSize) - 1) / pageSize;//��������������ÿҳ��ʾ�ļ�¼�������ҳ��
		return totalPage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public boolean isHasBefore() {
		return hasBefore;
	}
	public void setHasBefore(boolean hasBefore) {
		this.hasBefore = hasBefore;
	}
	public boolean isHasNext() {
		return hasNext;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	
	public String getPageURL() {
		return pageURL;
	}
	public void setPageURL(String pageURL) {
		this.pageURL = pageURL;
	}
	//����������ҳ
	public void firstPage(){
		currentPage = 1;				//��ǰҳ��ֵΪ1
		this.setHasBefore(false);		//û����һҳ
		this.refresh();					//������ҳʱӦ�������Ƿ�����һҳ����һҳ
	}
	//����������һҳ
	public void beforePage(){
		currentPage -- ;				//��ǰҳ��ֵ��1
		this.refresh();					//������һҳʱӦ�������Ƿ�����һҳ����һҳ
		
	}
	//����������һҳ
	public void nextPage(){
		if(currentPage < totalPage){
			currentPage ++ ;			// ��ǰҳ��ֵ��1
		}
		this.refresh();					//������һҳʱӦ�������Ƿ�����һҳ����һҳ
	}
	//��������βҳ
	public void lastPage(){
		currentPage = totalPage ;		//��ǰҳ��ֵ������ҳ��
		this.setHasNext(false);			//û����һҳ
		this.refresh();					//������һҳʱӦ�������Ƿ�����һҳ����һҳ
	}
	//�ж��û��Ĳ������ж��Ƿ�����һҳ����һҳ
	public void refresh(){
		if(totalPage<=1){				//��ҳ��С�ڵ���1�������û����һҳ����һҳ
			this.setHasBefore(false);
			this.setHasNext(false);
		}
		else if(currentPage==1){		//��ǰҳΪ��ҳ��û����һҳ������һҳ
			this.setHasBefore(false);
			this.setHasNext(true);
		}
		else if(currentPage==totalPage){//��ǰҳΪβҳ��û����һҳ������һҳ
			this.setHasBefore(true);
			this.setHasNext(false);
		}else{//�������ϵ���������������һҳ����һҳ
			this.setHasBefore(true);
			this.setHasNext(true);
		}
	}
	//��÷�ҳ��������ķ�������Ҫ�����Ƿ�����һҳ����һҳ���ж�
	public String getLinkHTML() {
		linkHTML += "��"+this.totalRows+"����¼ &nbsp;&nbsp;&nbsp;&nbsp;";
		if( this.hasBefore ){//�������һҳ�������һҳ�ĳ����Ӵ���		
			linkHTML += "<a href='"+this.pageURL+"?currPage=1'>��ҳ</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
			linkHTML += "<a href='"+this.pageURL+"?currPage="+this.currentPage+"&action=before'>��һҳ</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
		} else{				//���û����һҳ
			linkHTML += "��ҳ  &nbsp;&nbsp;&nbsp;&nbsp;��һҳ&nbsp;&nbsp;&nbsp;&nbsp;"; 
		}
		if( this.hasNext ){	//�������һҳ�������һҳ�ĳ����Ӵ���
			linkHTML += "<a href='"+this.pageURL+"?currPage="+this.currentPage+"&action=next'>��һҳ</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
			linkHTML += "<a href='"+this.pageURL+"?currPage="+this.totalPage+"'>βҳ</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
		} else {			//û����һҳ
			linkHTML += "��һҳ  &nbsp;&nbsp;&nbsp;&nbsp;βҳ&nbsp;&nbsp;&nbsp;&nbsp;"; 
		}
		linkHTML +="��ǰΪ"+this.currentPage+"/"+this.totalPage+"ҳ";
		return linkHTML;
	}
	public void setLinkHTML(String linkHTML) {
		linkHTML = linkHTML;
	}
}

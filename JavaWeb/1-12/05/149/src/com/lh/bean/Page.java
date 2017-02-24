package com.lh.bean;

import java.util.Calendar;

public class Page {
	private int pageSize = 10;			//每页显示的记录数
	private int currentPage = 1;		//当前页
	private int totalPage = 0;			//总页数
	private int totalRows = 0;			//总记录数
	private boolean hasBefore = false;	//是否有上一页
	private boolean hasNext = false ;	//是否有下一页
	private String linkHTML="";			//用于保存分页导航的HTML代码
	private String pageURL;				//具体的链接地址
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
		totalPage = ((totalRows + pageSize) - 1) / pageSize;//根据数据总数和每页显示的记录数算出总页数
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
	//单击的是首页
	public void firstPage(){
		currentPage = 1;				//当前页的值为1
		this.setHasBefore(false);		//没有上一页
		this.refresh();					//单击首页时应该设置是否有上一页和下一页
	}
	//单击的是上一页
	public void beforePage(){
		currentPage -- ;				//当前页的值减1
		this.refresh();					//单击上一页时应该设置是否有上一页和下一页
		
	}
	//单击的是下一页
	public void nextPage(){
		if(currentPage < totalPage){
			currentPage ++ ;			// 当前页的值加1
		}
		this.refresh();					//单击下一页时应该设置是否有上一页和下一页
	}
	//单击的是尾页
	public void lastPage(){
		currentPage = totalPage ;		//当前页的值等于总页数
		this.setHasNext(false);			//没有下一页
		this.refresh();					//单击上一页时应该设置是否有上一页和下一页
	}
	//判断用户的操作，判断是否有上一页和下一页
	public void refresh(){
		if(totalPage<=1){				//总页数小于等于1的情况，没有上一页和下一页
			this.setHasBefore(false);
			this.setHasNext(false);
		}
		else if(currentPage==1){		//当前页为首页，没有上一页，有下一页
			this.setHasBefore(false);
			this.setHasNext(true);
		}
		else if(currentPage==totalPage){//当前页为尾页，没有下一页，有上一页
			this.setHasBefore(true);
			this.setHasNext(false);
		}else{//除了以上的所有条件，有上一页和下一页
			this.setHasBefore(true);
			this.setHasNext(true);
		}
	}
	//获得分页导航代码的方法，主要根据是否有上一页和下一页来判断
	public String getLinkHTML() {
		linkHTML += "共"+this.totalRows+"条记录 &nbsp;&nbsp;&nbsp;&nbsp;";
		if( this.hasBefore ){//如果有上一页，添加上一页的超链接代码		
			linkHTML += "<a href='"+this.pageURL+"?currPage=1'>首页</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
			linkHTML += "<a href='"+this.pageURL+"?currPage="+this.currentPage+"&action=before'>上一页</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
		} else{				//如果没有上一页
			linkHTML += "首页  &nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;"; 
		}
		if( this.hasNext ){	//如果有下一页，添加下一页的超链接代码
			linkHTML += "<a href='"+this.pageURL+"?currPage="+this.currentPage+"&action=next'>下一页</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
			linkHTML += "<a href='"+this.pageURL+"?currPage="+this.totalPage+"'>尾页</a>";
			linkHTML += "&nbsp;&nbsp;&nbsp;&nbsp;";
		} else {			//没有下一页
			linkHTML += "下一页  &nbsp;&nbsp;&nbsp;&nbsp;尾页&nbsp;&nbsp;&nbsp;&nbsp;"; 
		}
		linkHTML +="当前为"+this.currentPage+"/"+this.totalPage+"页";
		return linkHTML;
	}
	public void setLinkHTML(String linkHTML) {
		linkHTML = linkHTML;
	}
}

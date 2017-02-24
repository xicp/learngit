package com.core;

public class PageElement {
	    private int pageNum;	//��ǰҳ
	    private int pageSize;	//ҳ����ʾ���ݵ�����
	    private long maxPage;	//��ҳ��
	    private int prePage;	//��һҳ
	    private int nextPage;	//��һҳ

	    public int getNextPage() {
	        return nextPage;
	    }

	    public int getPrePage() {
	        return prePage;
	    }

	    public long getMaxPage() {
	        return maxPage;
	    }

	    public void setMaxPage(long maxPage) {
	        this.maxPage = maxPage;
	    }

	    public int getPageSize() {
	        return pageSize;
	    }

	    public void setPageSize(int pageSize) {
	        this.pageSize = pageSize;
	    }

	    public int getPageNum() {
	        return pageNum;
	    }

	    public void setPageCount(int pageNum) {
	        this.pageNum = pageNum;
	        //������һҳ��ҳ��
	        prePage=pageNum-1<=1?1:pageNum-1;
	        //������һҳ��ҳ�� 
	        nextPage=(int)(pageNum + 1 >= maxPage ? maxPage : pageNum + 1);
	    }

}

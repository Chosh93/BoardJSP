package woo.edu.c.vo;

public class PageVo {
	
	private int page = 1;
	private int totalCnt;
	private int displayRow;
	private int displayPage = 10;
	private int beginPage;
	private int endPage;
	
	boolean prev;
	boolean next;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
		paging();
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
		paging();
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	private void paging() {
		endPage = ((int)Math.ceil(page/(double)displayPage))*displayPage;
		beginPage = endPage - (displayPage - 1);
		
		int totalPage = (int)Math.ceil(totalCnt/(double)displayRow);
		
		if(totalPage < endPage) {
			endPage = totalPage;
			next = false;
		} else {
			next = true;
		}
		
		prev = (beginPage == 1) ? false : true;
	}
	@Override
	public String toString() {
		return "PageVo [page=" + page + ", totalCnt=" + totalCnt + ", displayRow=" + displayRow + ", displayPage="
				+ displayPage + ", beginPage=" + beginPage + ", endPage=" + endPage + ", prev=" + prev + ", next="
				+ next + "]";
	}
	
	
}

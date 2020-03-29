package com.kh.notice.model.vo;

public class NoticePageInfo {

	private int noticeListCount;	// 총 게시글 갯수
	private int noticeCurrentPage;	// 현재 페이지
	private int noticeStartPage;	// 현재 페이지 하단에 보여지는 페이징 바의 시작수
	private int noticeEndPage;		// 현재 페이지 하단에 보여지는 페이징 바의 끝 수
	private int noticeMaxPage;		// 전체 페이지에서의 가장 마지막 페이지
	
	
	private int noticePageLimit;	// 한 페이지 하단에 보여질 페이지 최대 갯수
	private int noticeLimit;	// 한 페이지에 보여질 게시글 최대 갯수
	
	public NoticePageInfo() {
		
	}

	public NoticePageInfo(int noticeListCount, int noticeCurrentPage, int noticeStartPage, int noticeEndPage,
			int noticeMaxPage, int noticePageLimit, int noticeLimit) {
		super();
		this.noticeListCount = noticeListCount;
		this.noticeCurrentPage = noticeCurrentPage;
		this.noticeStartPage = noticeStartPage;
		this.noticeEndPage = noticeEndPage;
		this.noticeMaxPage = noticeMaxPage;
		this.noticePageLimit = noticePageLimit;
		this.noticeLimit = noticeLimit;
	}

	public int getNoticeListCount() {
		return noticeListCount;
	}

	public void setNoticeListCount(int noticeListCount) {
		this.noticeListCount = noticeListCount;
	}

	public int getNoticeCurrentPage() {
		return noticeCurrentPage;
	}

	public void setNoticeCurrentPage(int noticeCurrentPage) {
		this.noticeCurrentPage = noticeCurrentPage;
	}

	public int getNoticeStartPage() {
		return noticeStartPage;
	}

	public void setNoticeStartPage(int noticeStartPage) {
		this.noticeStartPage = noticeStartPage;
	}

	public int getNoticeEndPage() {
		return noticeEndPage;
	}

	public void setNoticeEndPage(int noticeEndPage) {
		this.noticeEndPage = noticeEndPage;
	}

	public int getNoticeMaxPage() {
		return noticeMaxPage;
	}

	public void setNoticeMaxPage(int noticeMaxPage) {
		this.noticeMaxPage = noticeMaxPage;
	}

	public int getNoticePageLimit() {
		return noticePageLimit;
	}

	public void setNoticePageLimit(int noticePageLimit) {
		this.noticePageLimit = noticePageLimit;
	}

	public int getNoticeLimit() {
		return noticeLimit;
	}

	public void setNoticeLimit(int noticeLimit) {
		this.noticeLimit = noticeLimit;
	}

	@Override
	public String toString() {
		return "NoticePageInfo [noticeListCount=" + noticeListCount + ", noticeCurrentPage=" + noticeCurrentPage
				+ ", noticeStartPage=" + noticeStartPage + ", noticeEndPage=" + noticeEndPage + ", noticeMaxPage="
				+ noticeMaxPage + ", noticePageLimit=" + noticePageLimit + ", noticeLimit=" + noticeLimit + "]";
	}

	
	
}

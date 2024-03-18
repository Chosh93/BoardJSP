package woo.edu.c.vo;

import java.util.Date;

public class BoardVo {
	
	private int bnum;
	private String btitle;
	private String bwriter;
	private String bcontents;
	private Date bdate;
	private String isDel;
	
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBwriter() {
		return bwriter;
	}
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	@Override
	public String toString() {
		return "BoardVo [bnum=" + bnum + ", btitle=" + btitle + ", bwriter=" + bwriter + ", bcontents=" + bcontents
				+ ", bdate=" + bdate + ", isDel=" + isDel + "]";
	}
}

package woo.edu.c.vo;

import java.util.Date;

public class testVo {

	private int BID;
	private String BNAME;
	private String BTITLE;
	private String BCONTENT;
	private Date BDATE;
	
	
	public int getBID() {
		return BID;
	}
	public void setBID(int bID) {
		BID = bID;
	}
	public String getBNAME() {
		return BNAME;
	}
	public void setBNAME(String bNAME) {
		BNAME = bNAME;
	}
	public String getBTITLE() {
		return BTITLE;
	}
	public void setBTITLE(String bTITLE) {
		BTITLE = bTITLE;
	}
	public String getBCONTENT() {
		return BCONTENT;
	}
	public void setBCONTENT(String bCONTENT) {
		BCONTENT = bCONTENT;
	}
	public Date getBDATE() {
		return BDATE;
	}
	public void setBDATE(Date bDATE) {
		BDATE = bDATE;
	}
	
	@Override
	public String toString() {
		return "BoardVo [BID=" + BID + ", BNAME=" + BNAME + ", BTITLE=" + BTITLE + ", BCONTENT=" + BCONTENT +", BDATE=" + BDATE + "]";
	}
}

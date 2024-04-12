package woo.edu.c.vo;

public class LoginVo {
	
	private int memberno;
	private String memberid;
	private String memberpw;
	private String memberisDel;
	private String memberName;
	
	public int getMemberno() {
		return memberno;
	}
	public void setMemberno(int memberno) {
		this.memberno = memberno;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMemberpw() {
		return memberpw;
	}
	public void setMemberpw(String memberpw) {
		this.memberpw = memberpw;
	}
	public String getMemberisDel() {
		return memberisDel;
	}
	public void setMemberisDel(String memberisDel) {
		this.memberisDel = memberisDel;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "LoginVo [memberno=" + memberno + ", memberid=" + memberid + ", memberpw=" + memberpw + ", memberisDel="
				+ memberisDel + ", memberName=" + memberName + "]";
	}
}

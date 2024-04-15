package woo.edu.c.vo;

public class LoginVo {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberIsDel;
	private String memberName;
	public int getMemberno() {
		return memberNo;
	}
	public void setMemberno(int memberno) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getMemberIsDel() {
		return memberIsDel;
	}
	public void setMemberIsDel(String memberIsDel) {
		this.memberIsDel = memberIsDel;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	@Override
	public String toString() {
		return "LoginVo [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberIsDel="
				+ memberIsDel + ", memberName=" + memberName + "]";
	}
}

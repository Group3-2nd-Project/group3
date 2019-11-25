package kr.or.bit.dto;

public class Membergrade {	//회원 등급

	
	
	private int grade;
	private String gname;	

	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	
	@Override
	public String toString() {
		return "Membergrade [grade=" + grade + ", gname=" + gname + "]";
	}
	
	
	
}

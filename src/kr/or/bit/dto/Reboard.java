package kr.or.bit.dto;

public class Reboard extends Board{	//답글게시판
	

	private int reboardidx;
	private int ref;
	private int dept;
	private int step;
	private int reboardcount;

	public int getReboardidx() {
		return reboardidx;
	}
	public void setReboardidx(int reboardidx) {
		this.reboardidx = reboardidx;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDept() {
		return dept;
	}
	public void setDept(int dept) {
		this.dept = dept;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getReboardcount() {
		return reboardcount;
	}
	public void setReboardcount(int reboardcount) {
		this.reboardcount = reboardcount;
	}
	
	@Override
	public String toString() {
		return "BoardForReboard [reboardidx=" + reboardidx + ", ref=" + ref + ", dept=" + dept + ", step=" + step
				+ ", reboardcount=" + reboardcount + "]";
	}
	
	
	
	
}

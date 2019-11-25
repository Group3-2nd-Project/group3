package kr.or.bit.dto;

public class File extends Board { //파일게시판
	private int fidx; //자료실식별번호
	private int idx;
	private String oriname;
	private String savename;
	private int fsize;
	private int cocode;
	
	public int getFidx() {
		return fidx;
	}
	public void setFidx(int fidx) {
		this.fidx = fidx;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOriname() {
		return oriname;
	}
	public void setOriname(String oriname) {
		this.oriname = oriname;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public int getFsize() {
		return fsize;
	}
	public void setFsize(int fsize) {
		this.fsize = fsize;
	}
	public int getCocode() {
		return cocode;
	}
	public void setCocode(int cocode) {
		this.cocode = cocode;
	}
	@Override
	public String toString() {
		return "File [fidx=" + fidx + ", idx=" + idx + ", oriname=" + oriname + ", savename=" + savename + ", fsize="
				+ fsize + ", cocode=" + cocode + "]";
	}
	
	
	
	
	
	
}

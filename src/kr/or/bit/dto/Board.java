package kr.or.bit.dto;

public class Board {	//게시판
	
	private int idx;
	private String id;
	private int bcode;
	private int tcode;
	private String title;
	private String content;
	private int readnum;
	private String writedate;	//날짜는 String 타입으로
	private int ref;
	private int dept;
	private int step;
	private int cocode;
	private int reboardcount;	//답글 수
	private int ps;
	private int cp;
	private int zcode;
	
	
	
	
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}
	public int getCp() {
		return cp;
	}
	public void setCp(int cp) {
		this.cp = cp;
	}
	public int getZcode() {
		return zcode;
	}
	public void setZcode(int zcode) {
		this.zcode = zcode;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBcode() {
		return bcode;
	}
	public void setBcode(int bcode) {
		this.bcode = bcode;
	}
	public int getTcode() {
		return tcode;
	}
	public void setTcode(int tcode) {
		this.tcode = tcode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadnum() {
		return readnum;
	}
	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
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
	public int getCocode() {
		return cocode;
	}
	public void setCocode(int cocode) {
		this.cocode = cocode;
	}
	public int getReboardcount() {
		return reboardcount;
	}
	public void setReboardcount(int reboardcount) {
		this.reboardcount = reboardcount;
	}
	@Override
	public String toString() {
		return "Board [idx=" + idx + ", id=" + id + ", bcode=" + bcode + ", tcode=" + tcode + ", title=" + title
				+ ", content=" + content + ", readnum=" + readnum + ", writedate=" + writedate + ", ref=" + ref
				+ ", dept=" + dept + ", step=" + step + ", cocode=" + cocode + ", reboardcount=" + reboardcount
				+ ", ps=" + ps + ", cp=" + cp + ", zcode=" + zcode + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

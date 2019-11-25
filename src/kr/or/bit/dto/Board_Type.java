package kr.or.bit.dto;

public class Board_Type {	//게시판 타입

	private int btype_num;
	private String btype_name;

	
    public int getBtype_num() {
		return btype_num;
	}


	public void setBtype_num(int btype_num) {
		this.btype_num = btype_num;
	}


	public String getBtype_name() {
		return btype_name;
	}


	public void setBtype_name(String btype_name) {
		this.btype_name = btype_name;
	}
	
	@Override
	public String toString() {
		return "Board_Type [btype_num=" + btype_num + ", btype_name=" + btype_name + "]";
	}

	
	
}

package kr.or.bit.dto;

public class Zzim_List {	//찜 목록
	private String contentid;
	private String id;
	
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "Zzim_List [contentid=" + contentid + ", id=" + id + "]";
	}
			

	
}

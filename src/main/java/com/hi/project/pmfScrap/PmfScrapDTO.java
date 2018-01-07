package com.hi.project.pmfScrap;

import com.hi.project.pmf.PmfBoardDTO;

public class PmfScrapDTO {

	private int snum;
	private int num;
	private String nickname;
	private PmfBoardDTO pmfBoardDTO;
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public PmfBoardDTO getPmfBoardDTO() {
		return pmfBoardDTO;
	}
	public void setPmfBoardDTO(PmfBoardDTO pmfBoardDTO) {
		this.pmfBoardDTO = pmfBoardDTO;
	}

}

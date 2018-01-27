package com.hi.project.temp;

import com.hi.project.pmf.PmfBoardDTO;
import com.hi.saveboard.TradeSaveDTO;

public class TempDTO {
	private String kind;
	private PmfBoardDTO pmfBoardDTO;
	private TradeSaveDTO tradeSaveDTO;
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public PmfBoardDTO getPmfBoardDTO() {
		return pmfBoardDTO;
	}
	public void setPmfBoardDTO(PmfBoardDTO pmfBoardDTO) {
		this.pmfBoardDTO = pmfBoardDTO;
	}
	public TradeSaveDTO getTradeSaveDTO() {
		return tradeSaveDTO;
	}
	public void setTradeSaveDTO(TradeSaveDTO tradeSaveDTO) {
		this.tradeSaveDTO = tradeSaveDTO;
	}
}

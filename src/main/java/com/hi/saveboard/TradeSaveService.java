package com.hi.saveboard;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

@Service
public class TradeSaveService {

	@Inject
	TradeSaveDAO tradeSaveDAO;
	
	public int insert (TradeSaveDTO tradeSaveDTO) throws Exception {
		int result = tradeSaveDAO.getNum();
		int writers = 0;
		writers = tradeSaveDAO.getWriters(tradeSaveDTO);
		
		if(writers < 50){
			tradeSaveDTO.setSave_num(result);
			tradeSaveDAO.insert(tradeSaveDTO);
		}else{
			result = 0;
		}
		return result;
	}
	
	public int update (TradeSaveDTO tradeSaveDTO) throws Exception {
		int result = 0;
		result = tradeSaveDAO.update(tradeSaveDTO);
		
		return result;
	}
}

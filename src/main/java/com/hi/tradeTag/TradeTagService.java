package com.hi.tradeTag;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hi.trade.TradeBoardDTO;

@Service
public class TradeTagService {

	@Inject
	TradeTagDAO tradeTagDAO;
	
	public int insert (TradeBoardDTO tradeBoardDTO) throws Exception {
			int result = 0;
			TradeTagDTO tagDTO = null;
			String kind = "board";
			
			if(tradeBoardDTO.getTag() != null){
				tagDTO = new TradeTagDTO();
				
				for (String t : tradeBoardDTO.getTag()) {
					tagDTO.setKind(kind);
					tagDTO.setNum(tradeBoardDTO.getNum());
					tagDTO.setTag(t);
					
					result = tradeTagDAO.insert(tagDTO);
				}
			}
		return result;
	}
	
	public int deleteOne (int num) throws Exception {
		int result = 0;
		result = tradeTagDAO.deleteOne(num);
		return result;
	}
	
	
	public int deleteAll(int num) throws Exception {
		return tradeTagDAO.deleteAll(num);
	}

}

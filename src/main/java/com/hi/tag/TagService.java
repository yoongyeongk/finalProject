package com.hi.tag;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.hi.trade.TradeBoardDTO;

@Service
public class TagService {

	@Inject
	TagDAO tagDAO;
	
	public int insert (TradeBoardDTO tradeBoardDTO) throws Exception {
			int result = 0;
			TagDTO tagDTO = null;
			String kind = "board";
			
			if(tradeBoardDTO != null){
				tagDTO = new TagDTO();
	
				for (String t : tradeBoardDTO.getTag()) {
					tagDTO.setKind(kind);
					tagDTO.setNum(tradeBoardDTO.getNum());
					tagDTO.setTag(t);
					
					result = tagDAO.insert(tagDTO);
				}
			}
		return result;
	}
}

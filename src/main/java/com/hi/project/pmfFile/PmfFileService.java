package com.hi.project.pmfFile;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hi.file.FileDTO;

@Service
public class PmfFileService {

	@Inject
	private PmfFileDAO pmfFileDAO;
	
	@RequestMapping(value="deleteOne")
	public ModelAndView deleteOne(int fnum, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String filePath = session.getServletContext().getRealPath("pmf_file");
		FileDTO fileDTO = pmfFileDAO.selectOne(fnum);
		File file = new File(filePath, fileDTO.getFilename());
		
		if(file.exists()){
			file.delete();
		}
		
		int result = pmfFileDAO.delete(fnum);
		
		if(result>0){
			mv.addObject("data", "파일이 삭제되었습니다.");
		}else{
			mv.addObject("data", "파일 삭제에 실패했습니다.");
			//파일 삭제 실패 시 다시 파일 저장하기.
		}
		mv.setViewName("common/ajax");
		
		return mv;
	}
	
}
